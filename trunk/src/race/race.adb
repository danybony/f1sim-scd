--------------------------------------------------------
--  Copyright (C) 2009                                --
--  Daniele Bonaldo, Alberto Zatton                   --
--                                                    --
--  F1Sim-scd 1.0                                     --
--                                                    --
--  Concurrent and Distributed Systems class project  --
--  Master Degree in Computer Science                 --
--  Academic year 2008/2009                           --
--  Dept. of Pure and Applied Mathematics             --
--  University of Padua, Italy                        --
--                                                    --
--  This program is free software; you can            --
--  redistribute it and/or modify it under the terms  --
--  of the GNU General Public License as published    --
--  by the Free Software Foundation; either           --
--  version 2 of the License, or (at your option)     --
--  any later version.                                --
--------------------------------------------------------


package body Race is

   --  static variable used as the T0 reference basis for
   --+ the running counter of the elapsed time
   --Passed : Time_Span;

   --  Segment_T is a monitor that control access to a segment
   --  In the other hand, Segment_spec_T contains all the infos
   --  about a segment i.
   protected body Segment_T is

      --  get the segment
      entry Enter ( speed : in out float; lane : positive ) when true is
      begin
         -----------------------------------------------------------------------
         -------------------CASE 1: SEGMENT WITH ONE LANE-----------------------
         -----------------------------------------------------------------------
         if lanes = 1 then
            -- only one lane in this segment

               if lane_one_is_free then
                  -- take the segment
                  lane_one_speed := speed;
                  requeue lane_one;
               else
                  -- the segment is taken: brake if necessary
                  if speed > lane_one_speed then
                     speed := lane_one_speed;
                  end if;
                  requeue lane_one;
               end if;

         end if;

         -----------------------------------------------------------------------
         -------------------CASE 2: SEGMENT WITH TWO LANES----------------------
         -----------------------------------------------------------------------
         if lanes = 2 then
            -- two lanes in this segment
            if lane = 1 then
               -----------------------------------------------------------------
               -----------------CASE 2.1: DRIVER IN LANE ONE--------------------
               -----------------------------------------------------------------
               if lane_one_is_free then
                  -- continue in this lane
                  lane_one_speed := speed;
                  requeue lane_one;
               else
                  if lane_two_is_free then
                     -- try to pass!
                     lane_two_speed := speed;
                     requeue lane_two;
                  else
                     -- choose the lane with less drivers
                     if lane_one_queue <= lane_two_queue then
                        -- brake if necessary
                        lane_one_queue := lane_one_queue + 1;
                        if speed > lane_one_speed then
                           speed := lane_one_speed;
                           requeue lane_one;
                        end if;
                     else
                        lane_two_queue := lane_two_queue + 1;
                        if speed > lane_two_speed then
                           speed := lane_two_speed;
                           requeue lane_two;
                        end if;
                     end if;

                  end if;

               end if;

            end if;

            if lane = 2 then
               -----------------------------------------------------------------
               -----------------CASE 2.2: DRIVER IN LANE TWO--------------------
               -----------------------------------------------------------------
               if lane_one_is_free then
                  -- continue in this lane
                  lane_one_speed := speed;
                  requeue lane_one;
               else
                  if lane_two_is_free then
                     -- try to pass!
                     lane_two_speed := speed;
                     requeue lane_two;
                  else
                     -- choose the lane with less drivers
                     if lane_one_queue <= lane_two_queue then
                        -- brake if necessary
                        lane_one_queue := lane_one_queue + 1;
                        if speed > lane_one_speed then
                           speed := lane_one_speed;
                           requeue lane_one;
                        end if;
                     else
                        lane_two_queue := lane_two_queue + 1;
                        if speed > lane_two_speed then
                           speed := lane_two_speed;
                           requeue lane_two;
                        end if;
                     end if;

                  end if;

               end if;
            end if;


         end if;


      end Enter;

      --  release the segment
      procedure Leave ( lane : positive ) is
      begin
         if lane = 1 then
            if lane_one_queue > 0 then
               lane_one_queue := lane_one_queue - 1;
            end if;
            lane_one_is_free := true;
         else
            if lane_two_queue > 0 then
               lane_two_queue := lane_two_queue - 1;
            end if;
            lane_two_is_free := true;
         end if;
      end Leave;

      entry lane_one ( speed : in out float; lane : positive )
        when lane_one_is_free is
      begin
         lane_one_is_free := false;
      end lane_one;

      entry lane_two ( speed : in out float; lane : positive )
        when lane_two_is_free is
      begin
         lane_two_is_free := false;
      end lane_two;


   end Segment_T;

end Race;
