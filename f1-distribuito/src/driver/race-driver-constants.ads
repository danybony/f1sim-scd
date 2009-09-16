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

package Race.Driver.Constants is

      CHANGE_LINE_DELAY : constant float := 0.001;

      -- log base for acceleration
      -- acceleration is usually 1,45 g (14,25 m/s^2) in F1
      -- less log_a_base = more acceleration
      LOG_A_BASE : constant float := 1.07500E+00;

      -- log base for deceleration
      -- deceleration is usually 4 g (39 m/s^2) in F1
      -- less log_d_base = more brake power = delayed brakes
      LOG_D_BASE : constant float := 1.05450E+00;
	  
	  METERS_PER_SEGMENT : constant float := 1.00000E+01;
			

end Race.Driver.Constants;