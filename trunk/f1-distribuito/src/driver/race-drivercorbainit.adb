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
with Race.IorReader;
with CORBA.ORB;
with CORBA.Impl;
with CORBA.Object;
with RI.Circuit_RI.Helper;
with RI.Log_viewer.Helper;
with RI.driver_RI.Impl;
with PortableServer.POA.Helper;
with PortableServer.POAManager;
with Polyorb.Setup.Thread_Per_Request_Server;
pragma Warnings (Off, PolyORB.Setup.Thread_Per_Request_Server);

package body Race.DriverCORBAInit is


   task body CORBAInit is


      use Ada.Strings.Unbounded;
      use Text_IO;
      use Ada.Command_Line;
      use CosNaming;
      --use CosNaming.NamingContext;
      use CosNaming.NamingContextExt;

      Argv 		: CORBA.ORB.Arg_List := CORBA.ORB.Command_Line_Arguments;
      root_POA 	: PortableServer.POA.Local_Ref;

      IOR	 	: Ada.Strings.Unbounded.Unbounded_String;

         --the object to be published
      Obj 		: constant CORBA.Impl.Object_Ptr := new RI.driver_RI.Impl.Object;
      Ref 		: CORBA.Object.Ref;
      rootCxtExt_local	: CosNaming.NamingContextExt.Ref;
      obj_name 		: CosNaming.Name;

--        circuit 		:RI.Circuit_RI.Ref;
--        logger		:RI.Log_viewer.Ref;



      begin

         accept init (circuit 	: in out RI.Circuit_RI.Ref;
                   logger	: in out RI.Log_viewer.Ref;
                   rootCxtExt 	: in out CosNaming.NamingContextExt.Ref)
      do
         begin
--               	   rootCxtExt := rootCxtExt_init;
--                     circuit := circuit_init;
--                     logger := logger_init;


         if Argument_Count /= 1 then
                Put_Line ("Missing driver ID.");
                Put_Line ("Usage : main_driver <ID>");
         end if;


        --  Retrieve Root POA
        CORBA.ORB.Init (CORBA.ORB.To_CORBA_String ("ORB"), Argv);

        Root_POA := PortableServer.POA.Helper.To_Local_Ref
                 (CORBA.ORB.Resolve_Initial_References
                    (CORBA.ORB.To_CORBA_String ("RootPOA")));


        PortableServer.POAManager.Activate
           (PortableServer.POA.Get_The_POAManager (Root_POA));


        --  Set up new object
        Ref := PortableServer.POA.Servant_To_Reference
                  (Root_POA, PortableServer.Servant (Obj));

        -- Read NameService IOR from file
        Race.IorReader.read_IOR(IOR);

        -- Getting the NameService
        CORBA.ORB.Initialize ("ORB");
      	CORBA.ORB.String_To_Object
        (CORBA.To_CORBA_String (TO_String(IOR)), rootCxtExt);

      	if Is_Nil (rootCxtExt) then
               Put_Line ("driver"& Ada.Command_Line.Argument (1) & " : cannot locate NameService");
    	end if;
        put("NameService IOR: ok ");new_line;

        rootCxtExt_local := rootCxtExt;

         -- Get circuit Remote Interface from Name Service
      	 Append (obj_name, NameComponent'(Id => To_CORBA_String ("Circuit"),
                                       Kind => To_CORBA_String ("")));
      	 circuit := RI.Circuit_RI.Helper.To_Ref(resolve_str(
                rootCxtExt,CosNaming.NamingContextExt.to_string(rootCxtExt,obj_name)));
         put_line("Got circuit from Name Service");

         begin
            -- Get logger Remote Interface from Name Service
            Replace_Element (obj_name, 1, NameComponent'(Id => To_CORBA_String ("Logger"),
                                       Kind => To_CORBA_String ("")));
      	    logger := RI.Log_viewer.Helper.To_Ref(resolve_str(
                rootCxtExt,CosNaming.NamingContextExt.to_string(rootCxtExt,obj_name)));
            put_line("Got logger from Name Service");

            exception
     		 when others =>
                  put_line("Unable to get logger from Name Service.");
                  put_line("Race will start without logs.");
     	 end;

          end;
      end init;


         --  Bind in Name Service
         Replace_Element (obj_name, 1, NameComponent'(Id => To_CORBA_String ("Driver" & Ada.Command_Line.Argument (1)),
                                         Kind => To_CORBA_String ("")));

         bind(rootCxtExt_local, obj_name, Ref);
         put_line("Driver Remote Inderface bound in Name Service");


         --  Launch the server
         CORBA.ORB.Run;

         --  Unbind from Name Service
         unbind(rootCxtExt_local, obj_name);

      end CORBAInit;

end Race.DriverCORBAInit;
