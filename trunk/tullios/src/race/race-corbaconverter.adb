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
--  by the Free Drivers.lengthSoftware Foundation; either           --
--  version 2 of the License, or (at your option)     --
--  any later version.                                --
--------------------------------------------------------

with text_io;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with CORBA;
with PolyORB.Sequences.Unbounded;


package body Race.CORBAConverter is

   -----------------------------------------------------------------
   -------------------------TO CORBA--------------------------------
   -----------------------------------------------------------------

   -- Function that convert String_array_T into RI.StringArray
   function to_RI_StringArray (
                            array_in : String_array_T
                                     ) return RI.StringArray is

      index: Integer;
      temp_string : ada.strings.Unbounded.unbounded_string;
      temp_StringArray : RI.StringArray;

   begin

      index := 0;
      while index < array_in'Length loop
         temp_string := array_in(index + 1);
         -- CORBA arrays' indexes are from 0 to length-1
         temp_StringArray(index):= CORBA.To_CORBA_String(To_String(temp_string));
         index := index + 1;
      end loop;

      return temp_StringArray;

   end to_RI_StringArray;


   -- Function that convert Segment_Properties_T into RI.SegmentProperties
   function to_RI_SegmentProperties (
                            segment_properties_in : Segment_Properties_T
                                     ) return RI.SegmentProperties is

      temp_segment_properties : RI.SegmentProperties;

   begin

      temp_segment_properties.Starting_Speed := CORBA.Float(segment_properties_in.Starting_Speed);
      temp_segment_properties.Leaving_Speed := CORBA.Float(segment_properties_in.Leaving_Speed);
      temp_segment_properties.Segments := CORBA.Unsigned_Short(segment_properties_in.Segments);

      return temp_segment_properties;

   end to_RI_SegmentProperties;


   -- Function that convert LP_track_T into RI.LPtrack
   function to_RI_LPtrack (
                            LP_track_in : LP_track_T
                                 ) return RI.LPtrack is

      temp_LPtrack : RI.LPtrack;
      index: Positive;

   begin

      index := 1;
      while index <= LP_track_in'Length loop
         RI.Append(temp_LPtrack, to_RI_SegmentProperties(LP_track_in(index)));
         index := index + 1;
      end loop;

      return temp_LPtrack;

   end to_RI_LPtrack;



   -- Function that convert String_array_T into RI.StringSequence
   function to_StringSequence (
                               array_in : String_array_T)
                               return RI.StringSequence is

      temp_sequence : RI.StringSequence;
      index: Positive;

   begin
      index := 1;
      while index <= array_in'Length loop
         text_io.put_line(To_String(array_in(index)));
         RI.Append(temp_sequence, CORBA.To_CORBA_String(To_String(array_in(index))));
         index := index + 1;
      end loop;
      return temp_sequence;

   end to_StringSequence;



   -----------------------------------------------------------------
   -------------------------FROM CORBA------------------------------
   -----------------------------------------------------------------

   -- Function that convert driver_RI.StringArray into String_array_T
   function to_String_Array_T (
                               array_in : RI.StringArray
                              ) return String_array_T is


      index: Integer;
      temp_string : ada.strings.Unbounded.unbounded_string;
      temp_String_array : String_array_T(1..array_in'Length);

   begin

      index := 0;
      while index < array_in'Length loop
         temp_string := to_unbounded_string(CORBA.to_standard_string(array_in(index)));
         temp_String_array(index+1):= temp_string;
         index := index + 1;
      end loop;

      return temp_String_array;

   end to_String_Array_T;



   -- Function that convert driver_RI.StringArray into String_array_T
   function to_String_Array_T (
                               array_in : RI.StringSequence
                              ) return String_array_T is


      index: Integer;
      temp_string : ada.strings.Unbounded.unbounded_string;
      temp_String_array : String_array_T(1..RI.length(array_in));

   begin

      index := 1;
      while index <= RI.length(array_in) loop
         temp_string := to_unbounded_string(CORBA.to_standard_string(RI.Get_Element(array_in,index)));
         temp_String_array(index):= temp_string;
         index := index + 1;
      end loop;

      return temp_String_array;

   end to_String_Array_T;


   -- Function that convert driver_RI.SegmentProperties into Segment_Properties_T
   function to_Segment_Properties_T (
                            SegmentProperties_in : RI.SegmentProperties
                                     ) return Segment_Properties_T is

      temp_segment_properties : Segment_Properties_T;

   begin

      temp_segment_properties.Starting_Speed := Float(SegmentProperties_in.Starting_Speed);
      temp_segment_properties.Leaving_Speed := Float(SegmentProperties_in.Leaving_Speed);
      temp_segment_properties.Segments := Positive(SegmentProperties_in.Segments);

      return temp_segment_properties;

   end to_Segment_Properties_T;



   function to_LP_track_T (
                           LPtrack_in : RI.LPtrack)
                           return LP_track_T is

      temp_LP_track : LP_track_Ref_T;
      index: Positive := 1;
      total: Positive;

   begin

      total:= RI.Length(LPtrack_in);
      temp_LP_track := new LP_track_T(1..total);
      while index <= total loop
         temp_LP_track(index) := to_Segment_Properties_T(
                                       RI.Get_Element(LPtrack_in,index));
         index := index + 1;
      end loop;

      return temp_LP_track.all;

   end to_LP_track_T;


end Race.CORBAConverter;
