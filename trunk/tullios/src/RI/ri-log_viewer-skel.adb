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

   setEnvironment_Arg_Name_Drivers_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("Drivers");

   setEnvironment_Arg_Name_segmentsNumber_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("segmentsNumber");

   setEnvironment_Arg_Name_RaceLaps_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("RaceLaps");

   updateLog_Arg_Name_Driver_ID_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("Driver_ID");

   updateLog_Arg_Name_Segment_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("Segment");

   updateLog_Arg_Name_Speed_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("Speed");

   updateLog_Arg_Name_box_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("box");

   endRace_Arg_Name_Driver_ID_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("Driver_ID");

   endRace_Arg_Name_reason_� : constant CORBA.Identifier :=
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
      Operation_� : constant PolyORB.Std.String :=
        CORBA.To_Standard_String
           (CORBA.ServerRequest.Operation
              (Request.all));
      Argument_List_� : CORBA.NVList.Ref;
   begin
      CORBA.ORB.Create_List
        (0,
         Argument_List_�);
      begin
         if (Operation_�
            = "_is_a")
         then
            declare
               Type_Id_� : CORBA.String;
               Arg_Name_Type_Id_� : constant CORBA.Identifier :=
                 CORBA.To_CORBA_String
                    ("Type_Id_�");
               Argument_Type_Id_� : constant CORBA.Any :=
                 CORBA.To_Any
                    (Type_Id_�);
               Result_� : CORBA.Boolean;
            begin
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  Arg_Name_Type_Id_�,
                  Argument_Type_Id_�,
                  CORBA.ARG_IN);
               CORBA.ServerRequest.Arguments
                 (Request,
                  Argument_List_�);
               Type_Id_� :=
                 CORBA.From_Any
                    (Argument_Type_Id_�);
               Result_� :=
                 Is_A
                    (CORBA.To_Standard_String
                       (Type_Id_�));
               CORBA.ServerRequest.Set_Result
                 (Request,
                  CORBA.To_Any
                    (Result_�));
            end;
         elsif (Operation_�
            = "setEnvironment")
         then
            declare
               Argument_Drivers_� : RI.StringSequence;
               pragma Warnings (Off, Argument_Drivers_�);
               Arg_CC_Drivers_� : aliased PolyORB.Any.Content'Class :=
                 RI.Helper.Internals.Wrap
                    (RI.IDL_SEQUENCE_string.Sequence
                       (Argument_Drivers_�)'Unrestricted_Access);
               Arg_Any_Drivers_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (RI.Helper.TC_StringSequence,
                     Arg_CC_Drivers_�'Unchecked_Access);
               Argument_segmentsNumber_� : CORBA.Long;
               pragma Warnings (Off, Argument_segmentsNumber_�);
               Arg_CC_segmentsNumber_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_segmentsNumber_�'Unrestricted_Access);
               Arg_Any_segmentsNumber_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Long,
                     Arg_CC_segmentsNumber_�'Unchecked_Access);
               Argument_RaceLaps_� : CORBA.Short;
               pragma Warnings (Off, Argument_RaceLaps_�);
               Arg_CC_RaceLaps_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_RaceLaps_�'Unrestricted_Access);
               Arg_Any_RaceLaps_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Short,
                     Arg_CC_RaceLaps_�'Unchecked_Access);
               Result_� : CORBA.Boolean;
               pragma Warnings (Off, Result_�);
               Arg_CC_Result_�_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Result_�'Unrestricted_Access);
               Arg_Any_Result_�_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Boolean,
                     Arg_CC_Result_�_�'Unchecked_Access);
            begin
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  setEnvironment_Arg_Name_Drivers_�,
                  Arg_Any_Drivers_�,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  setEnvironment_Arg_Name_segmentsNumber_�,
                  Arg_Any_segmentsNumber_�,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  setEnvironment_Arg_Name_RaceLaps_�,
                  Arg_Any_RaceLaps_�,
                  CORBA.ARG_IN);
               --  Processing request
               CORBA.ServerRequest.Arguments
                 (Request,
                  Argument_List_�);
               --  Call Implementation
               Result_� :=
                 RI.Log_viewer.Impl.setEnvironment
                    (RI.Log_viewer.Impl.Object'Class
                       (Self.all)'Access,
                     Argument_Drivers_�,
                     Argument_segmentsNumber_�,
                     Argument_RaceLaps_�);
               --  Setting the result
               CORBA.ServerRequest.Set_Result
                 (Request,
                  Arg_Any_Result_�_�);
               CORBA.NVList.Internals.Clone_Out_Args
                 (Argument_List_�);
            end;
         elsif (Operation_�
            = "updateLog")
         then
            declare
               Argument_Driver_ID_� : CORBA.Short;
               pragma Warnings (Off, Argument_Driver_ID_�);
               Arg_CC_Driver_ID_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_Driver_ID_�'Unrestricted_Access);
               Arg_Any_Driver_ID_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Short,
                     Arg_CC_Driver_ID_�'Unchecked_Access);
               Argument_Segment_� : CORBA.Long;
               pragma Warnings (Off, Argument_Segment_�);
               Arg_CC_Segment_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_Segment_�'Unrestricted_Access);
               Arg_Any_Segment_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Long,
                     Arg_CC_Segment_�'Unchecked_Access);
               Argument_Speed_� : CORBA.Float;
               pragma Warnings (Off, Argument_Speed_�);
               Arg_CC_Speed_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_Speed_�'Unrestricted_Access);
               Arg_Any_Speed_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Float,
                     Arg_CC_Speed_�'Unchecked_Access);
               Argument_box_� : CORBA.Boolean;
               pragma Warnings (Off, Argument_box_�);
               Arg_CC_box_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_box_�'Unrestricted_Access);
               Arg_Any_box_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Boolean,
                     Arg_CC_box_�'Unchecked_Access);
            begin
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  updateLog_Arg_Name_Driver_ID_�,
                  Arg_Any_Driver_ID_�,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  updateLog_Arg_Name_Segment_�,
                  Arg_Any_Segment_�,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  updateLog_Arg_Name_Speed_�,
                  Arg_Any_Speed_�,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  updateLog_Arg_Name_box_�,
                  Arg_Any_box_�,
                  CORBA.ARG_IN);
               --  Processing request
               CORBA.ServerRequest.Arguments
                 (Request,
                  Argument_List_�);
               --  Call Implementation
               RI.Log_viewer.Impl.updateLog
                 (RI.Log_viewer.Impl.Object'Class
                    (Self.all)'Access,
                  Argument_Driver_ID_�,
                  Argument_Segment_�,
                  Argument_Speed_�,
                  Argument_box_�);
               CORBA.NVList.Internals.Clone_Out_Args
                 (Argument_List_�);
            end;
         elsif (Operation_�
            = "endRace")
         then
            declare
               Argument_Driver_ID_� : CORBA.Short;
               pragma Warnings (Off, Argument_Driver_ID_�);
               Arg_CC_Driver_ID_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_Driver_ID_�'Unrestricted_Access);
               Arg_Any_Driver_ID_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Short,
                     Arg_CC_Driver_ID_�'Unchecked_Access);
               Argument_reason_� : CORBA.Short;
               pragma Warnings (Off, Argument_reason_�);
               Arg_CC_reason_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_reason_�'Unrestricted_Access);
               Arg_Any_reason_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Short,
                     Arg_CC_reason_�'Unchecked_Access);
            begin
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  endRace_Arg_Name_Driver_ID_�,
                  Arg_Any_Driver_ID_�,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  endRace_Arg_Name_reason_�,
                  Arg_Any_reason_�,
                  CORBA.ARG_IN);
               --  Processing request
               CORBA.ServerRequest.Arguments
                 (Request,
                  Argument_List_�);
               --  Call Implementation
               RI.Log_viewer.Impl.endRace
                 (RI.Log_viewer.Impl.Object'Class
                    (Self.all)'Access,
                  Argument_Driver_ID_�,
                  Argument_reason_�);
               CORBA.NVList.Internals.Clone_Out_Args
                 (Argument_List_�);
            end;
         elsif (Operation_�
            = "_interface")
         then
            CORBA.ServerRequest.Arguments
              (Request,
               Argument_List_�);
            CORBA.ServerRequest.Set_Result
              (Request,
               CORBA.Object.Helper.To_Any
                 (CORBA.Object.Ref
                    (PolyORB.CORBA_P.IR_Hooks.Get_Interface_Definition
                       (CORBA.To_CORBA_String
                          (Repository_Id)))));

         elsif (Operation_�
            = "_domain_managers")
         then
            CORBA.ServerRequest.Arguments
              (Request,
               Argument_List_�);
            CORBA.ServerRequest.Set_Result
              (Request,
               PolyORB.CORBA_P.Domain_Management.Get_Domain_Managers
                 (Self));

         elsif ((Operation_�
            = "_non_existent")
            or else (Operation_�
               = "_non_existent"))
         then
            CORBA.ServerRequest.Arguments
              (Request,
               Argument_List_�);
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
