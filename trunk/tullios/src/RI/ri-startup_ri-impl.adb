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

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;

with CORBA;
with CORBA.ORB;
with RI.startup_RI.Skel;
with Polyorb.Protocols.GIOP;
with Race.Startup; use Race.Startup;
with Race.CORBAConverter; use Race.CORBAConverter;

pragma Warnings(Off, RI.startup_RI.Skel);

package body RI.startup_RI.Impl is

   procedure endRace
     (Self : access Object) is

   begin

      Self.drivers_running := Self.drivers_running - 1;

      if Self.drivers_running = 0 then

         CORBA.ORB.shutdown(false);

      end if;


   exception
      when Polyorb.Protocols.GIOP.GIOP_Error =>Put_Line("Catch");
   end endRace;


end RI.startup_RI.Impl;
