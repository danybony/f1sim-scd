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

--with Race.Types; use Race.Types;
--with Race; use Race;
with Race.Driver.Types; use Race.Driver.Types;


--  This package contains driver interface definition.

package Race.Driver is

  	task type Driver(
		
		Name		: String;
		Team		: Team_ID_T;
      		Car_Number	: Positive;
      		Accel_Coeff	: Accel_Coeff_T;
      		Break_Coeff	: Break_Coeff_T;
      		Max_Speed	: Real;
      		Strategy	: Strategy_T
      		Position	: Positive;
      		Laps_Done	: Positive;
      		Prior		: Positive;
     )

   end Driver;

   type Driver_Ref_T is access all Driver;

end Race.Driver;
