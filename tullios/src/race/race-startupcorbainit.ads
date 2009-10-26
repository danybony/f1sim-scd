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

with RI.Circuit_RI;
with RI.Log_viewer;
with Cosnaming.NamingContextExt;


package Race.StartupCORBAInit is

   task type CORBAInit is
      entry init (tot_drivers_init	:integer;
                   circuit_init 	:RI.Circuit_RI.Ref;
                   logger_init		:RI.Log_viewer.Ref;
                   rootCxtExt_init 	:CosNaming.NamingContextExt.Ref);
   end CORBAInit;

   type CORBAInit_Ref is access CORBAInit;

end Race.StartupCORBAInit;
