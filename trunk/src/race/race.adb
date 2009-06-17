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

   --  Segment_T is a monitor that control access to a segment
   protected body Segment_T is

      --  get the segment
      entry Enter ( speed : in out float; lane : in out positive ) when true is
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
               -- the segment is taken: brake if necessary...
               if speed > lane_one_speed then
                  speed := lane_one_speed;
               end if;

               -- ...and queue in until lane is free
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
                     -- lane one is full, but lane two is free: try to pass!
                     lane_two_speed := speed;
                     requeue lane_two;
                  else
                     -- all lanes are full: choose the lane with less drivers
                     if lane_one_queue <= lane_two_queue then
                        -- choose lane one: brake if necessary...
                        lane_one_queue := lane_one_queue + 1;
                        if speed > lane_one_speed then
                           speed := lane_one_speed;
                        end if;
                        -- ...and queue in
                        requeue lane_one;
                     else
                        -- lane two has less driver in queue
                        lane_two_queue := lane_two_queue + 1;
                        -- brake if necessary...
                        if speed > lane_two_speed then
                           speed := lane_two_speed;
                        end if;
                        -- ...and queue in
                        requeue lane_two;
                     end if;-- end case: lanes full

                  end if;-- end case: test lane two

               end if;-- end case: test lane one

            end if;-- end case 2.1: driver in lane one

            if lane = 2 then
               -----------------------------------------------------------------
               -----------------CASE 2.2: DRIVER IN LANE TWO--------------------
               -----------------------------------------------------------------
               if lane_two_is_free then
                  -- continue in this lane
                  lane_two_speed := speed;
                  requeue lane_two;
               else
                  if lane_one_is_free then
                     -- lane two is full but lane one is free: try to pass!
                     lane_one_speed := speed;
                     requeue lane_one;
                  else
                     -- all lanes are full: choose lane with less drivers
                     if lane_two_queue <= lane_one_queue then
                        -- choose lane two: brake if necessary...
                        lane_two_queue := lane_two_queue + 1;
                        if speed > lane_two_speed then
                           speed := lane_two_speed;
                        end if;
                        -- ... and queue in
                        requeue lane_two;
                     else
                        -- lane one has less driver in queue
                        lane_one_queue := lane_one_queue + 1;
                        -- brake if necessary...
                        if speed > lane_one_speed then
                           speed := lane_one_speed;
                        end if;
                        -- ...and queue in
                        requeue lane_one;
                     end if;-- end case: all lanes full

                  end if;-- end case: test lane one

               end if;--end case: test lane two
            end if;--end case 2.2: driver in lane two


         end if;--end case 2: segment has two lanes


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

      entry lane_one ( speed : in out float; lane : in out positive )
        when lane_one_is_free is
      begin
         lane_one_is_free := false;
         lane := 1;
      end lane_one;

      entry lane_two ( speed : in out float; lane : in out positive )
        when lane_two_is_free is
      begin
         lane_two_is_free := false;
         lane := 2;
      end lane_two;


   end Segment_T;

end Race;
