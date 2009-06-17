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
         if lane > lanes then
            -- only one lane in this segment
            if lane_one_is_free then
               lane_one_speed := speed;
               requeue lane_one
      end Enter;

      --  release the segment
      --+ (formal parameter not used explicitly
      --+  but needed for distributed dispatching)
      procedure Leave ( lane : positive ) is
      begin
         if lane = 1 then
            lane_one_is_free := true;
         else
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
