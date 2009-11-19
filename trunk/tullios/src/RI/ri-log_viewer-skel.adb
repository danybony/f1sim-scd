pragma Style_Checks ("NM32766");
---------------------------------------------------
--  This file has been generated automatically from
--  src/RI/RI.idl
--  by IAC (IDL to Ada Compiler) GPL 2009-20090519 (rev. 144248).
---------------------------------------------------
--  Do NOT hand-modify this file, as your
--  changes will be lost when you re-run the
--  IDL to Ada compiler.
---------------------------------------------------
with RI.Log_viewer.Impl;
with CORBA;
pragma Elaborate_All (CORBA);
with RI.Helper;
with PolyORB.Any;
with CORBA.NVList;
with CORBA.ServerRequest;
with PolyORB.CORBA_P.IR_Hooks;
with CORBA.Object;
with CORBA.Object.Helper;
with PolyORB.CORBA_P.Domain_Management;
with PortableServer;
with PolyORB.Std;
with CORBA.ORB;
with PolyORB.CORBA_P.Exceptions;
with PolyORB.Qos.Exception_Informations;
with PolyORB.Utils.Strings;
with PolyORB.Utils.Strings.Lists;
with PolyORB.Initialization;

package body RI.Log_viewer.Skel is

   setEnvironment_Arg_Name_Drivers_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("Drivers");

   setEnvironment_Arg_Name_segmentsNumber_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("segmentsNumber");

   setEnvironment_Arg_Name_RaceLaps_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("RaceLaps");

   updateLog_Arg_Name_Driver_ID_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("Driver_ID");

   updateLog_Arg_Name_Segment_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("Segment");

   updateLog_Arg_Name_Speed_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("Speed");

   updateLog_Arg_Name_box_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("box");

   endRace_Arg_Name_Driver_ID_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("Driver_ID");

   endRace_Arg_Name_reason_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("reason");

   procedure Invoke
     (Self : PortableServer.Servant;
      Request : CORBA.ServerRequest.Object_Ptr);

   ------------
   -- Invoke --
   ------------

   procedure Invoke
     (Self : PortableServer.Servant;
      Request : CORBA.ServerRequest.Object_Ptr)
   is
      Operation_Ü : constant PolyORB.Std.String :=
        CORBA.To_Standard_String
           (CORBA.ServerRequest.Operation
              (Request.all));
      Argument_List_Ü : CORBA.NVList.Ref;
   begin
      CORBA.ORB.Create_List
        (0,
         Argument_List_Ü);
      begin
         if (Operation_Ü
            = "_is_a")
         then
            declare
               Type_Id_Ü : CORBA.String;
               Arg_Name_Type_Id_Ü : constant CORBA.Identifier :=
                 CORBA.To_CORBA_String
                    ("Type_Id_Ü");
               Argument_Type_Id_Ü : constant CORBA.Any :=
                 CORBA.To_Any
                    (Type_Id_Ü);
               Result_Ü : CORBA.Boolean;
            begin
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  Arg_Name_Type_Id_Ü,
                  Argument_Type_Id_Ü,
                  CORBA.ARG_IN);
               CORBA.ServerRequest.Arguments
                 (Request,
                  Argument_List_Ü);
               Type_Id_Ü :=
                 CORBA.From_Any
                    (Argument_Type_Id_Ü);
               Result_Ü :=
                 Is_A
                    (CORBA.To_Standard_String
                       (Type_Id_Ü));
               CORBA.ServerRequest.Set_Result
                 (Request,
                  CORBA.To_Any
                    (Result_Ü));
            end;
         elsif (Operation_Ü
            = "setEnvironment")
         then
            declare
               Argument_Drivers_Ü : RI.StringSequence;
               pragma Warnings (Off, Argument_Drivers_Ü);
               Arg_CC_Drivers_Ü : aliased PolyORB.Any.Content'Class :=
                 RI.Helper.Internals.Wrap
                    (RI.IDL_SEQUENCE_string.Sequence
                       (Argument_Drivers_Ü)'Unrestricted_Access);
               Arg_Any_Drivers_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (RI.Helper.TC_StringSequence,
                     Arg_CC_Drivers_Ü'Unchecked_Access);
               Argument_segmentsNumber_Ü : CORBA.Long;
               pragma Warnings (Off, Argument_segmentsNumber_Ü);
               Arg_CC_segmentsNumber_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_segmentsNumber_Ü'Unrestricted_Access);
               Arg_Any_segmentsNumber_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Long,
                     Arg_CC_segmentsNumber_Ü'Unchecked_Access);
               Argument_RaceLaps_Ü : CORBA.Short;
               pragma Warnings (Off, Argument_RaceLaps_Ü);
               Arg_CC_RaceLaps_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_RaceLaps_Ü'Unrestricted_Access);
               Arg_Any_RaceLaps_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Short,
                     Arg_CC_RaceLaps_Ü'Unchecked_Access);
               Result_Ü : CORBA.Boolean;
               pragma Warnings (Off, Result_Ü);
               Arg_CC_Result_Ü_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Result_Ü'Unrestricted_Access);
               Arg_Any_Result_Ü_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Boolean,
                     Arg_CC_Result_Ü_Ü'Unchecked_Access);
            begin
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  setEnvironment_Arg_Name_Drivers_Ü,
                  Arg_Any_Drivers_Ü,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  setEnvironment_Arg_Name_segmentsNumber_Ü,
                  Arg_Any_segmentsNumber_Ü,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  setEnvironment_Arg_Name_RaceLaps_Ü,
                  Arg_Any_RaceLaps_Ü,
                  CORBA.ARG_IN);
               --  Processing request
               CORBA.ServerRequest.Arguments
                 (Request,
                  Argument_List_Ü);
               --  Call Implementation
               Result_Ü :=
                 RI.Log_viewer.Impl.setEnvironment
                    (RI.Log_viewer.Impl.Object'Class
                       (Self.all)'Access,
                     Argument_Drivers_Ü,
                     Argument_segmentsNumber_Ü,
                     Argument_RaceLaps_Ü);
               --  Setting the result
               CORBA.ServerRequest.Set_Result
                 (Request,
                  Arg_Any_Result_Ü_Ü);
               CORBA.NVList.Internals.Clone_Out_Args
                 (Argument_List_Ü);
            end;
         elsif (Operation_Ü
            = "updateLog")
         then
            declare
               Argument_Driver_ID_Ü : CORBA.Short;
               pragma Warnings (Off, Argument_Driver_ID_Ü);
               Arg_CC_Driver_ID_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_Driver_ID_Ü'Unrestricted_Access);
               Arg_Any_Driver_ID_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Short,
                     Arg_CC_Driver_ID_Ü'Unchecked_Access);
               Argument_Segment_Ü : CORBA.Long;
               pragma Warnings (Off, Argument_Segment_Ü);
               Arg_CC_Segment_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_Segment_Ü'Unrestricted_Access);
               Arg_Any_Segment_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Long,
                     Arg_CC_Segment_Ü'Unchecked_Access);
               Argument_Speed_Ü : CORBA.Float;
               pragma Warnings (Off, Argument_Speed_Ü);
               Arg_CC_Speed_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_Speed_Ü'Unrestricted_Access);
               Arg_Any_Speed_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Float,
                     Arg_CC_Speed_Ü'Unchecked_Access);
               Argument_box_Ü : CORBA.Boolean;
               pragma Warnings (Off, Argument_box_Ü);
               Arg_CC_box_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_box_Ü'Unrestricted_Access);
               Arg_Any_box_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Boolean,
                     Arg_CC_box_Ü'Unchecked_Access);
            begin
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  updateLog_Arg_Name_Driver_ID_Ü,
                  Arg_Any_Driver_ID_Ü,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  updateLog_Arg_Name_Segment_Ü,
                  Arg_Any_Segment_Ü,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  updateLog_Arg_Name_Speed_Ü,
                  Arg_Any_Speed_Ü,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  updateLog_Arg_Name_box_Ü,
                  Arg_Any_box_Ü,
                  CORBA.ARG_IN);
               --  Processing request
               CORBA.ServerRequest.Arguments
                 (Request,
                  Argument_List_Ü);
               --  Call Implementation
               RI.Log_viewer.Impl.updateLog
                 (RI.Log_viewer.Impl.Object'Class
                    (Self.all)'Access,
                  Argument_Driver_ID_Ü,
                  Argument_Segment_Ü,
                  Argument_Speed_Ü,
                  Argument_box_Ü);
               CORBA.NVList.Internals.Clone_Out_Args
                 (Argument_List_Ü);
            end;
         elsif (Operation_Ü
            = "endRace")
         then
            declare
               Argument_Driver_ID_Ü : CORBA.Short;
               pragma Warnings (Off, Argument_Driver_ID_Ü);
               Arg_CC_Driver_ID_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_Driver_ID_Ü'Unrestricted_Access);
               Arg_Any_Driver_ID_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Short,
                     Arg_CC_Driver_ID_Ü'Unchecked_Access);
               Argument_reason_Ü : CORBA.Short;
               pragma Warnings (Off, Argument_reason_Ü);
               Arg_CC_reason_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_reason_Ü'Unrestricted_Access);
               Arg_Any_reason_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Short,
                     Arg_CC_reason_Ü'Unchecked_Access);
            begin
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  endRace_Arg_Name_Driver_ID_Ü,
                  Arg_Any_Driver_ID_Ü,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  endRace_Arg_Name_reason_Ü,
                  Arg_Any_reason_Ü,
                  CORBA.ARG_IN);
               --  Processing request
               CORBA.ServerRequest.Arguments
                 (Request,
                  Argument_List_Ü);
               --  Call Implementation
               RI.Log_viewer.Impl.endRace
                 (RI.Log_viewer.Impl.Object'Class
                    (Self.all)'Access,
                  Argument_Driver_ID_Ü,
                  Argument_reason_Ü);
               CORBA.NVList.Internals.Clone_Out_Args
                 (Argument_List_Ü);
            end;
         elsif (Operation_Ü
            = "_interface")
         then
            CORBA.ServerRequest.Arguments
              (Request,
               Argument_List_Ü);
            CORBA.ServerRequest.Set_Result
              (Request,
               CORBA.Object.Helper.To_Any
                 (CORBA.Object.Ref
                    (PolyORB.CORBA_P.IR_Hooks.Get_Interface_Definition
                       (CORBA.To_CORBA_String
                          (Repository_Id)))));

         elsif (Operation_Ü
            = "_domain_managers")
         then
            CORBA.ServerRequest.Arguments
              (Request,
               Argument_List_Ü);
            CORBA.ServerRequest.Set_Result
              (Request,
               PolyORB.CORBA_P.Domain_Management.Get_Domain_Managers
                 (Self));

         elsif ((Operation_Ü
            = "_non_existent")
            or else (Operation_Ü
               = "_non_existent"))
         then
            CORBA.ServerRequest.Arguments
              (Request,
               Argument_List_Ü);
            CORBA.ServerRequest.Set_Result
              (Request,
               CORBA.To_Any
                 (CORBA.Boolean'
                    (False)));

         else
            CORBA.Raise_Bad_Operation
              (CORBA.Default_Sys_Member);
         end if;
      exception
         when E : others =>
            CORBA.ServerRequest.Set_Exception
              (Request,
               PolyORB.CORBA_P.Exceptions.System_Exception_To_Any
                 (E));
            PolyORB.Qos.Exception_Informations.Set_Exception_Information
              (Request,
               E);
      end;
   end Invoke;

   function Servant_Is_A
     (Obj : PortableServer.Servant)
     return Boolean;

   ------------------
   -- Servant_Is_A --
   ------------------

   function Servant_Is_A
     (Obj : PortableServer.Servant)
     return Boolean
   is
   begin
      return (Obj.all
         in RI.Log_viewer.Impl.Object'Class);
   end Servant_Is_A;

   -----------------------------
   -- Deferred_Initialization --
   -----------------------------

   procedure Deferred_Initialization is
   begin
      PortableServer.Internals.Register_Skeleton
        (RI.Log_viewer.Repository_Id,
         Servant_Is_A'Access,
         Is_A'Access,
         Invoke'Access);
   end Deferred_Initialization;

begin
   declare
      use PolyORB.Utils.Strings;
      use PolyORB.Utils.Strings.Lists;
   begin
      PolyORB.Initialization.Register_Module
        (PolyORB.Initialization.Module_Info'
           (Name => +"RI.Log_viewer.Skel",
            Conflicts => PolyORB.Utils.Strings.Lists.Empty,
            Depends => PolyORB.Utils.Strings.Lists.Empty,
            Provides => PolyORB.Utils.Strings.Lists.Empty,
            Implicit => False,
            Init => Deferred_Initialization'Access,
            Shutdown => null));
   end;
end RI.Log_viewer.Skel;
