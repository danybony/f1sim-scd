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


with Race.Segment; use Race.Segment;
with Ada.Strings.Unbounded;

--  This package contains driver interface definition.

package Race.Driver is

   task type Driver is
      entry init(params		: String_array_T;
                 position	: Positive;
                 track		: LP.Vector;
                 laps		: Positive);
   end Driver;

   type Driver_Ref_T is access Driver;

end Race.Driver;
