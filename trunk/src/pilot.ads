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

with Circuit.Types; use Circuit.Types;
with Circuit; use Circuit;

--  the Pilot entity
package Circuit.Pilot is

   task type Pilot_T
     (Name		: String_Ref_T;
      Car		: Scuderia_ID_T
      Number		: Positive;
      Accel_Coeff	: Accel_Coeff_Type_T;
      Break_Coeff	: Break_Coeff_Type_T;
      Max_Speed		: Real;
      Strategy		: Strategy_Type_T
      Position		: Positive;
      Laps_Done		: Positive;
      Prior		: Positive;
     ) is

      pragma Priority (Prior);

   end Pilot_T;

   type Pilot_Ref_T is access all Pilot_T;

end Circuit.Pilot;
