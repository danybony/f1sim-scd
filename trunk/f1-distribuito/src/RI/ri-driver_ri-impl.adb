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

with CORBA;
with CORBA.ORB;
with RI.driver_RI.Skel;
with Polyorb.Protocols.GIOP;
with Race.Driver; use Race.Driver;
with Race.CORBAConverter; use Race.CORBAConverter;

pragma Warnings(Off, RI.driver_RI.Skel);

package body RI.driver_RI.Impl is

   procedure init
     (Self : access Object;
      params : RI.StringArray;
      position : CORBA.Short;
      track : RI.LPtrack;
      box : RI.LPtrack;
      laps : CORBA.Short) is

      pragma Warnings (Off);
      pragma Unreferenced (Self);
      pragma Warnings (On);

   begin
      CORBA.ORB.shutdown(false);
      put_line("Init received.");
      the_Driver.init (to_String_Array_T (params),	--: String_array_T;
                       Integer(position),	--: Positive;
                       to_LP_track_T(track),       --: LP_track_T;
                       to_LP_track_T(box),
                       Integer(laps));	--: Positive)


   exception
      when Polyorb.Protocols.GIOP.GIOP_Error =>Put_Line("Catch");
   end init;


end RI.driver_RI.Impl;
