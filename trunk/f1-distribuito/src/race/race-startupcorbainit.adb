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

with text_io;
with Ada.Command_Line;
with CORBA.ORB;
with CORBA.Impl;
with CORBA.Object;
with RI.Circuit_RI;
with RI.Log_viewer;
with Cosnaming.NamingContextExt;
with Cosnaming;

with RI.Startup_RI.Impl;
with PortableServer.POA.Helper;
with PortableServer.POAManager;
with Polyorb.Setup.Thread_Per_Request_Server;
pragma Warnings (Off, PolyORB.Setup.Thread_Per_Request_Server);

package body Race.StartupCORBAInit is

   task body CORBAInit is

      use Ada.Strings.Unbounded;
      use Text_IO;
      use Ada.Command_Line;
      use CosNaming.NamingContextExt;
      use CosNaming;

      Argv 		: CORBA.ORB.Arg_List := CORBA.ORB.Command_Line_Arguments;
      Root_POA 	: PortableServer.POA.Local_Ref;
      -- the object to be published
      Obj 		: CORBA.Impl.Object_Ptr;
      Ref 		: CORBA.Object.Ref;
      obj_name 		:CosNaming.Name;
      rootCxtExt 	:CosNaming.NamingContextExt.Ref;
      tot_drivers	:integer;

      circuit 		:RI.Circuit_RI.Ref;
      logger		:RI.Log_viewer.Ref;

   begin

      accept init (tot_drivers_init	:integer;
                   circuit_init 	:RI.Circuit_RI.Ref;
                   logger_init		:RI.Log_viewer.Ref;
                   rootCxtExt_init 	:CosNaming.NamingContextExt.Ref)
      do
         begin

            	   tot_drivers := tot_drivers_init;
                   rootCxtExt := rootCxtExt_init;
                   circuit := circuit_init;
                   logger := logger_init;
         end;
      end init;

      	 Obj := new RI.startup_RI.Impl.Object(tot_drivers);

         --  Create and publish startup remote interface in Name Service
         CORBA.ORB.Init (CORBA.ORB.To_CORBA_String ("ORB"), Argv);

         Root_POA := PortableServer.POA.Helper.To_Local_Ref
                 (CORBA.ORB.Resolve_Initial_References
                    (CORBA.ORB.To_CORBA_String ("RootPOA")));

         PortableServer.POAManager.Activate
           (PortableServer.POA.Get_The_POAManager (Root_POA));

         -- Set up new object
         Ref := PortableServer.POA.Servant_To_Reference
                  (Root_POA, PortableServer.Servant (Obj));

      	-- Bind in Name Service
      	Append (obj_name, NameComponent'(Id => To_CORBA_String ("Startup"),
                                       Kind => To_CORBA_String ("")));

         bind(rootCxtExt, obj_name, Ref);
         put_line("Race startup Remote Inderface binded in Name Service.");

         -- Launch the server
     	 CORBA.ORB.Run;

      	 put_line("Race ended.");

	 begin
         	RI.Log_viewer.endRace (logger);
         exception
      	    when others =>
            	put_line("Logger is down");
      	 end;

      	 begin
         	RI.Circuit_RI.endRace (circuit);
         exception
      	    when others =>
            	put_line("Circuit is down");
      	 end;

         -- Unbind from Name Service
         unbind(rootCxtExt, obj_name);

      end CORBAInit;

end Race.StartupCORBAInit;
