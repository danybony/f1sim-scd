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

--with Race.Circuit.Segment; use Race.Circuit.Segment;
package RaceTypes is

   subtype Positive 	is Integer range 1..Integer'last;
   type String_Ref_T       is access all String;
   type Integer_Ref_T      is access all Integer;

   --type Macro_Segment_T;
   --type Macro_Segment_Ref_T is access all Macro_Segment_T;
   subtype Substring_T is String(1..255);
   type Substring_array_T is array (Positive range <>) of Substring_T;
   type Strategy_T is array (Positive range <>) of Positive;



end RaceTypes;

