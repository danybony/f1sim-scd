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

with Ada.Integer_Text_IO;

package body Race.Circuit is

   procedure build_track (MacroSegments		:in String_array_T;
                          MacroSegments_total	:in integer)
   is
      use Ada.Strings.Unbounded;
      use Ada.Integer_Text_IO;
      segment_lenght: constant Positive:=1;--lenght(in meters) of one segment
      main_loop_index: Positive := 1;
      segments_index : Positive := 1;
      macro_lenght : Positive;
      macro_lanes : Positive;

      last : Positive;
      segment_temp : Segment_ref_T;

   begin

      -- box macro segment
      get(To_String(MacroSegments(1)),macro_lenght,last);
      get(To_String(MacroSegments(4)),macro_lanes,last);
      macro_lenght := macro_lenght/segment_lenght;

      while segments_index <= macro_lenght loop
         segment_temp := new Segment_T(macro_lanes);
         LR.Append(LR_box, segment_temp);
         segments_index := segments_index + 1;
      end loop;

      segments_index := 1;
      main_loop_index := main_loop_index + 4;--skip to next macro segment

      -- track macro segments
      while main_loop_index <= MacroSegments_total loop
         get(To_String(MacroSegments(main_loop_index)),macro_lenght,last);
         get(To_String(MacroSegments(main_loop_index+3)),macro_lanes,last);

         macro_lenght := macro_lenght/segment_lenght;

         while segments_index <= macro_lenght loop
            segment_temp := new Segment_T(macro_lanes);
            LR.Append(LR_track, segment_temp);
            segments_index := segments_index + 1;
         end loop;

         segments_index := 1;
         main_loop_index := main_loop_index + 4;--skip to next macro segment

      end loop;

   end build_track;

end Race.Circuit;
