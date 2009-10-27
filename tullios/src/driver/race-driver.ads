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

with Ada.Numerics.Float_Random;
with Ada.Strings.Unbounded;
with Ada.Exceptions;
with CORBA;

--  This package contains driver interface definition.

package Race.Driver is

   task the_Driver is
      entry init(params		: String_array_T;
                 position	: Positive;
                 track		: LP_track_T;
                 box		: LP_track_T;
                 laps		: Positive;
				 start_time	: Time);
   end the_Driver;

   subtype Driver_lenght is Positive range 1..20;

   -- Driver parameters
   Name			: Ada.Strings.Unbounded.Unbounded_String;
   ID 			: CORBA.Short;
   Team			: Ada.Strings.Unbounded.Unbounded_String;
   Accel		: Positive;
   Brake		: Positive;
   MSpeed		: float;
   Strategy		: Strategy_T(0..5);--max 5 pit stops
   Strategy_lenght : Natural := 0;
   Strategy_index  : Natural := 0;
   
   Log_a : float;
   Log_d : float;
   
   go_box : Integer := -1;
   
   LP_box: LP_Track_Ref_T;
   LP_track: LP_Track_Ref_T;
   
   Wake : Time;
   
   Tot_Laps: Positive;
   
   G : Ada.Numerics.Float_Random.Generator;
   
   -- Incidents that can occur
   type incident is (Engine_Tyre, Box, Crash);
   
   Engine_Break : Exception;
   Tyre_Break 	: Exception;
   Box_Retire 	: Exception;
   Crash_car	: Exception;

end Race.Driver;
