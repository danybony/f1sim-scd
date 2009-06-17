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

--  This package contains driver interface definition.

package Race.Driver is

   task type Driver is
      entry init(params		: String_array_T;
                 position	: Positive;
                 track		: LP_track_T;
                 box		: LP_track_T;
                 laps		: Positive);
   end Driver;

   type Driver_Ref_T is access Driver;
   subtype Driver_lenght is Positive range 1..20;

   package Driver_Vector is new Ada.Containers.Vectors
     (Element_type => Driver_Ref_T,
      Index_type => Driver_lenght);

   -- Brake points array
   -- For every macro segment, this array indicates when start braking
   type brake_points_T is array (Positive range <>) of Natural;
   type brake_points_Ref_T is access brake_points_T;

end Race.Driver;
