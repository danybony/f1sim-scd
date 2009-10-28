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
with Ada.Strings.Unbounded;
with Ada.Containers.Vectors;

package Race is

   type Strategy_T is array (Natural range <>) of Positive;
   type Strategy_Ref_T is access Strategy_T;

   type String_array_T is array (Positive range <>) of
     Ada.Strings.Unbounded.Unbounded_String;
   type String_array_Ref_T is access String_array_T;

   --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
   --++++++       LP-related definitions        ++++++++++++++++++++++++++++++--
   type Segment_Properties_T is
   --  info about a macro segment
      record
         Starting_Speed: Float;
         Leaving_Speed: Float;
         Segments: Positive;
      end record;

   type Segment_properties_Ref_T is access Segment_Properties_T;
   subtype LP_lenght is Positive range 1..Positive'Last;


   package LP is new Ada.Containers.Vectors
     (Element_Type => Segment_Properties_T,
      Index_Type => LP_lenght);

   type LP_track_T is array (Positive range <>) of Segment_Properties_T;
   type LP_track_Ref_T is access LP_track_T;




   --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
   --++++++      LR-related definitions         ++++++++++++++++++++++++++++++--

   protected type Segment_T (tot_lanes :Positive) is

      --  request the segment
      entry Enter(speed : in out Float;
                  lane : in out Positive);

      --  release the segment
      procedure Leave (lane : Positive);

   private

      entry lane_one(speed : in out Float;
                     lane : in out Positive);

      entry lane_two(speed : in out Float;
                     lane : in out Positive);

      Lanes : Positive := tot_lanes;

      lane_one_is_free : Boolean := True;
      lane_two_is_free : Boolean := True;

      lane_one_speed : Float := 0.00000E+00;
      lane_two_speed : Float := 0.00000E+00;

      lane_one_queue : Integer := 0;
      lane_two_queue : Integer := 0;


   end Segment_T;

   type Segment_Ref_T is access Segment_T;

   subtype LR_lenght is Positive range 1..Positive'Last;

   package LR is new Ada.Containers.Vectors
     (Element_Type => Segment_Ref_T,
      Index_Type => LR_lenght);

end Race;

