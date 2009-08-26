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

with Ada.Integer_Text_IO;
with Text_IO;
with Race.IorReader;

--CORBA imports
with CORBA.Impl;
with CORBA.Object;
with CORBA.ORB;
with PortableServer.POA.Helper;
with PortableServer.POAManager;
with CosNaming;
with Cosnaming.NamingContextExt;
with Cosnaming.NamingContext;
with RI.circuit_RI.Impl;
with PolyORB.CORBA_P.CORBALOC;

with Polyorb.Setup.Thread_Per_Request_Server;
pragma Warnings (Off, PolyORB.Setup.Thread_Per_Request_Server);

package body Race.Circuit is

   procedure build_track (MacroSegments		:in String_array_T;
                          MacroSegments_total	:in integer;
                          Segments_total	:out integer)
   is
      use Ada.Strings.Unbounded;
      use Ada.Integer_Text_IO;
      segment_lenght: constant Positive:=1;--lenght(in meters) of one segment
      main_loop_index: Positive := 1;
      segments_index : Positive := 1;
      macro_lenght : Positive;
      macro_lanes : Positive;

      last : Positive;
      segment_temp : Segment_ref_T;

   begin

      -- box macro segment
      get(To_String(MacroSegments(1)),macro_lenght,last);
      get(To_String(MacroSegments(4)),macro_lanes,last);
      macro_lenght := macro_lenght/segment_lenght;

      while segments_index <= macro_lenght loop
         segment_temp := new Segment_T(macro_lanes);
         LR.Append(LR_box, segment_temp);
         segments_index := segments_index + 1;
      end loop;

      segments_index := 1;
      main_loop_index := main_loop_index + 4;--skip to next macro segment

      -- track macro segments
      while main_loop_index <= MacroSegments_total loop
         get(To_String(MacroSegments(main_loop_index)),macro_lenght,last);
         get(To_String(MacroSegments(main_loop_index+3)),macro_lanes,last);

         macro_lenght := macro_lenght/segment_lenght;

         while segments_index <= macro_lenght loop
            segment_temp := new Segment_T(macro_lanes);
            LR.Append(LR_track, segment_temp);
            segments_index := segments_index + 1;
         end loop;

         segments_index := 1;
         main_loop_index := main_loop_index + 4;--skip to next macro segment

      end loop;

      Segments_total := Integer(LR.length(LR_track));

   end build_track;

   task body Circuit is
      use CosNaming;
      use CosNaming.NamingContext;
      use CosNaming.NamingContextExt;
      use Ada.Strings.Unbounded;
      use Text_IO;

         Argv 		: CORBA.ORB.Arg_List := CORBA.ORB.Command_Line_Arguments;
         Root_POA 	: PortableServer.POA.Local_Ref;

         -- the NamingService
         rootCxtExt	: CosNaming.NamingContext.Ref;
         IOR	 	: Ada.Strings.Unbounded.Unbounded_String;

         --the object to be published
         Obj 		: constant CORBA.Impl.Object_Ptr := new RI.circuit_RI.Impl.Object;
         Ref 		: CORBA.Object.Ref;
         obj_name 	: CosNaming.Name;


      begin

         Text_IO.put_line("Circuit started");
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
        	  Put_Line ("circuit : cannot locate NameService");
    	end if;
      	put("NameService IOR: ok ");new_line;

        --  Bind in Name Service
	Append (obj_name, NameComponent'(Id => To_CORBA_String ("Circuit"),
                                         Kind => To_CORBA_String ("")));

         bind(rootCxtExt, obj_name, Ref);
         put_line("Circuit Remote Inderface bound in Name Service");


         --  Launch the server
      CORBA.ORB.Run;

      put_line("Race ended.");

      --  Unbind from Name Service
      unbind(rootCxtExt, obj_name);

      end Circuit;

end Race.Circuit;
