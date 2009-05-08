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
with Ada.strings.unbounded;
with Ada.Containers.Doubly_Linked_Lists;

package Race is

   type String_Ref_T       is access all String;
   type Integer_Ref_T      is access all Integer;

   --type Macro_Segment_T;
   --type Macro_Segment_Ref_T is access all Macro_Segment_T;
   --subtype Substring_T is String(1..255);
   --type Substring_array_T is array (Positive range <>) of Substring_T;
   type Strategy_T is array (Natural range <>) of Positive;
   type Strategy_Ref_T is access Strategy_T;

   type String_array_T is array (Positive range <>) of ada.strings.Unbounded.unbounded_string;

   type Segment_Properties_T is
   --  info about a single segment
      record
         Speed: Positive;
      end record;

   type Segment_properties_Ref_T is access Segment_Properties_T;
   subtype LP_lenght is Positive range 1..Positive'last;


   package LP is new Ada.Containers.Vectors
     (Element_Type => Segment_Properties_T,
      Index_Type => LP_lenght);

end Race;

