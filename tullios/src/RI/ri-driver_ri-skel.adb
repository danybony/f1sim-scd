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
with RI.driver_RI.Impl;
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

package body RI.driver_RI.Skel is

   init_Arg_Name_params_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("params");

   init_Arg_Name_position_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("position");

   init_Arg_Name_track_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("track");

   init_Arg_Name_box_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("box");

   init_Arg_Name_laps_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("laps");

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
            = "init")
         then
            declare
               Argument_params_� : RI.StringArray;
               pragma Warnings (Off, Argument_params_�);
               Arg_CC_params_� : aliased PolyORB.Any.Content'Class :=
                 RI.Helper.Internals.Wrap
                    (Argument_params_�'Unrestricted_Access);
               Arg_Any_params_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (RI.Helper.TC_StringArray,
                     Arg_CC_params_�'Unchecked_Access);
               Argument_position_� : CORBA.Short;
               pragma Warnings (Off, Argument_position_�);
               Arg_CC_position_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_position_�'Unrestricted_Access);
               Arg_Any_position_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Short,
                     Arg_CC_position_�'Unchecked_Access);
               Argument_track_� : RI.LPtrack;
               pragma Warnings (Off, Argument_track_�);
               Arg_CC_track_� : aliased PolyORB.Any.Content'Class :=
                 RI.Helper.Internals.Wrap
                    (RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence
                       (Argument_track_�)'Unrestricted_Access);
               Arg_Any_track_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (RI.Helper.TC_LPtrack,
                     Arg_CC_track_�'Unchecked_Access);
               Argument_box_� : RI.LPtrack;
               pragma Warnings (Off, Argument_box_�);
               Arg_CC_box_� : aliased PolyORB.Any.Content'Class :=
                 RI.Helper.Internals.Wrap
                    (RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence
                       (Argument_box_�)'Unrestricted_Access);
               Arg_Any_box_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (RI.Helper.TC_LPtrack,
                     Arg_CC_box_�'Unchecked_Access);
               Argument_laps_� : CORBA.Short;
               pragma Warnings (Off, Argument_laps_�);
               Arg_CC_laps_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_laps_�'Unrestricted_Access);
               Arg_Any_laps_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Short,
                     Arg_CC_laps_�'Unchecked_Access);
            begin
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  init_Arg_Name_params_�,
                  Arg_Any_params_�,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  init_Arg_Name_position_�,
                  Arg_Any_position_�,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  init_Arg_Name_track_�,
                  Arg_Any_track_�,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  init_Arg_Name_box_�,
                  Arg_Any_box_�,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  init_Arg_Name_laps_�,
                  Arg_Any_laps_�,
                  CORBA.ARG_IN);
               --  Processing request
               CORBA.ServerRequest.Arguments
                 (Request,
                  Argument_List_�);
               --  Call Implementation
               RI.driver_RI.Impl.init
                 (RI.driver_RI.Impl.Object'Class
                    (Self.all)'Access,
                  Argument_params_�,
                  Argument_position_�,
                  Argument_track_�,
                  Argument_box_�,
                  Argument_laps_�);
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
         in RI.driver_RI.Impl.Object'Class);
   end Servant_Is_A;

   -----------------------------
   -- Deferred_Initialization --
   -----------------------------

   procedure Deferred_Initialization is
   begin
      PortableServer.Internals.Register_Skeleton
        (RI.driver_RI.Repository_Id,
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
           (Name => +"RI.driver_RI.Skel",
            Conflicts => PolyORB.Utils.Strings.Lists.Empty,
            Depends => PolyORB.Utils.Strings.Lists.Empty,
            Provides => PolyORB.Utils.Strings.Lists.Empty,
            Implicit => False,
            Init => Deferred_Initialization'Access,
            Shutdown => null));
   end;
end RI.driver_RI.Skel;
