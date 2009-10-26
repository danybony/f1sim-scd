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

package Race.Circuit is

   LR_Track: LR.Vector;

   LR_Box: LR.Vector;

   procedure build_track (MacroSegments		:in String_array_T;
                          MacroSegments_total	:in integer;
                          Segments_total	:out integer);

   task type Circuit;

   type Circuit_Ref_T is access Circuit;

end Race.Circuit;
