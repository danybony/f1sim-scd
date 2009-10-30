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
with RI;

package Race.CORBAConverter is

   function to_RI_StringArray (array_in : String_array_T) return RI.StringArray;

   function to_RI_LPtrack (LP_track_in : LP_track_T) return RI.LPtrack;

   function to_StringSequence (array_in : String_array_T) return RI.StringSequence;

   function to_String_Array_T (array_in : RI.StringArray) return String_array_T;

   function to_String_Array_T (array_in : RI.StringSequence) return String_array_T;

   function to_LP_track_T (LPtrack_in : RI.LPtrack) return LP_track_T;

end Race.CORBAConverter;

