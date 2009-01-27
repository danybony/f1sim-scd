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

          
          with Ada.Command_Line;
          with Ada.Text_IO;
          with CORBA.ORB;
          
          with Log_viewer;
          
          with PolyORB.Setup.Client;
          pragma Warnings (Off, PolyORB.Setup.Client);
          
          with PolyORB.Utils.Report;
          
          procedure Client is
             use Ada.Command_Line;
             use Ada.Text_IO;
             use PolyORB.Utils.Report;
          
             remoteLog_viewer : Log_viewer.Ref;
          
          begin
             New_Test ("Logger client");
          
             CORBA.ORB.Initialize ("ORB");
             if Argument_Count /= 1 then
                Put_Line ("usage : client <IOR_string_from_server>|-i");
                return;
             end if;
          
             --  Getting the CORBA.Object
          
             CORBA.ORB.String_To_Object
               (CORBA.To_CORBA_String (Ada.Command_Line.Argument (1)), remoteLog_viewer);
          
             --  Checking if it worked
          
             if Log_viewer.Is_Nil (remoteLog_viewer) then
                Put_Line ("main : cannot invoke on a nil reference");
                return;
             end if;
          
             --  Sending message
          
             Log_viewer.updateLog (remoteLog_viewer, 1,10,300);
          
             --  Printing result
          
             Put_Line ("Messaggio mandato");
	     
	     Log_viewer.endRace (remoteLog_viewer);

             Put_Line ("ORB spento");
          
             End_Report;
          
          exception
             when E : CORBA.Transient =>
                declare
                   Memb : CORBA.System_Exception_Members;
                begin
                   CORBA.Get_Members (E, Memb);
                   Put ("received exception transient, minor");
                   Put (CORBA.Unsigned_Long'Image (Memb.Minor));
                   Put (", completion status: ");
                   Put_Line (CORBA.Completion_Status'Image (Memb.Completed));
          
                   End_Report;
                end;
          end Client;
 
