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
with Race.Segment;

package body Race.Circuit is


   --Function that build all the segments (monitor) of the track and return it
   --function build_track (
   --                       segment_array:substring_array_T;
   --                       number_of_segments:integer
   --                      )return Segment_list_T;

   procedure build_track (MacroSegments		:in String_array_T;
                          MacroSegments_total	:in integer)
   is
      use Ada.Strings.Unbounded;
      use LP;
      use Ada.Integer_Text_IO;
      segment_lenght: constant Positive:=1;--lenght(in meters) of one segment
      index: Positive := 1;
      segments_index : Positive := 1;
      macro_lenght : Positive;
      macro_first_lenght : Positive;
      macro_first_speed : Positive;
      macro_last_lenght : Positive;
      macro_last_speed : Positive;
      macro_change_line : Positive;

      break_coeff: integer;
      last : Positive;
      segment_temp : Segment_properties_ref_T;

   begin
      while index <= MacroSegments_total loop
         get(To_String(MacroSegments(index)),macro_lenght,last);
         get(To_String(MacroSegments(index+3)),macro_change_line,last);
         macro_first_lenght := macro_change_line/segment_lenght;
         macro_last_lenght := (macro_lenght-macro_change_line)/segment_lenght;
         get(To_String(MacroSegments(index+1)),macro_first_speed,last);
         get(To_String(MacroSegments(index+2)),macro_last_speed,last);

         while segments_index <= macro_first_lenght loop
            segment_temp := new Segment_properties_T;
            segment_temp.speed := macro_first_speed;
            LP.Append(track, segment_temp.all);
            segments_index := segments_index + 1;
         end loop;

         break_coeff := (macro_first_speed - macro_last_speed) /
           macro_last_lenght;

         while segments_index <= macro_lenght loop
            segment_temp := new Segment_properties_T;
            segment_temp.speed := macro_first_speed -
              (break_coeff*(segments_index-macro_first_lenght));
            LP.Append(track, segment_temp.all);
            segments_index := segments_index + 1;
         end loop;

         segments_index := 1;
         index := index + 5;--skip to next macro segment

      end loop;

   end build_track;

end Race.Circuit;
