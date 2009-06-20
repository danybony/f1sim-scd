-------------------------------------------------
--  This file has been generated automatically
--  by IDLAC version 2.4.0-20080521.
--
--  Do NOT hand-modify this file, as your
--  changes will be lost when you re-run the
--  IDL to Ada compiler.
-------------------------------------------------
pragma Style_Checks ("NM32766");

with PolyORB.Utils.Strings;
with PolyORB.Initialization;
pragma Elaborate_All (PolyORB.Initialization);
with PolyORB.QoS.Exception_Informations;
with RI.Helper;
with PolyORB.Any;
with PolyORB.CORBA_P.Domain_Management;
with PolyORB.CORBA_P.IR_Hooks;
with CORBA.Object.Helper;
with CORBA.ORB;
with CORBA.NVList;
with PolyORB.Std;
with CORBA.ServerRequest;
with RI.driver_RI.Impl;
with CORBA;
pragma Elaborate_All (CORBA);
with PortableServer;
pragma Elaborate_All (PortableServer);
with PolyORB.CORBA_P.Exceptions;

package body RI.driver_RI.Skel is

   --  Skeleton subprograms

   function Servant_Is_A
     (Obj : PortableServer.Servant)
     return Boolean;

   function Servant_Is_A
     (Obj : PortableServer.Servant)
     return Boolean is
   begin
      return Obj.all in RI.driver_RI.Impl.Object'Class;
   end Servant_Is_A;

   Is_A_Arg_Name_�_Type_Id : constant CORBA.Identifier
   := CORBA.To_CORBA_String ("Type_Id");

   init_Arg_Name_�_params : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("params");
   init_Arg_Name_�_position : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("position");
   init_Arg_Name_�_track : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("track");
   init_Arg_Name_�_box : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("box");
   init_Arg_Name_�_laps : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("laps");

   procedure Invoke
     (Self : PortableServer.Servant;
      Request : CORBA.ServerRequest.Object_Ptr)
   is
      Operation : constant PolyORB.Std.String
         := CORBA.To_Standard_String
              (CORBA.ServerRequest.Operation
               (Request.all));
      Arg_List_� : CORBA.NVList.Ref;
   begin
      CORBA.ORB.Create_List (0, Arg_List_�);
      if Operation = "_is_a" then
         declare
            Type_Id : CORBA.String;
            Arg_Any_�_Type_Id : constant CORBA.Any := CORBA.To_Any (Type_Id);

            Result_� : CORBA.Boolean;
         begin
            CORBA.NVList.Add_Item
            (Arg_List_�,
            Is_A_Arg_Name_�_Type_Id,
            Arg_Any_�_Type_Id,
            CORBA.ARG_IN);

            CORBA.ServerRequest.Arguments (Request, Arg_List_�);

            begin
               --  Convert arguments from their Any

               Type_Id :=
                 CORBA.From_Any (Arg_Any_�_Type_Id);

               --  Call implementation

               Result_� := RI.driver_RI.Is_A
                 (CORBA.To_Standard_String (Type_Id));
            end;

            -- Set Result

            CORBA.ServerRequest.Set_Result
            (Request,
            CORBA.To_Any (Result_�));
         end;

      elsif Operation = "_non_existent"
        or else Operation = "_not_existent"
      then

         CORBA.ServerRequest.Arguments (Request, Arg_List_�);

         CORBA.ServerRequest.Set_Result
           (Request,
            CORBA.To_Any (CORBA.Boolean'(False)));

      elsif Operation = "_interface" then

         CORBA.ServerRequest.Arguments (Request, Arg_List_�);

         CORBA.ServerRequest.Set_Result
           (Request,
            CORBA.Object.Helper.To_Any
            (CORBA.Object.Ref
             (PolyORB.CORBA_P.IR_Hooks.Get_Interface_Definition
              (CORBA.To_CORBA_String (Repository_Id)))));

      elsif Operation = "_domain_managers" then

         CORBA.ServerRequest.Arguments (Request, Arg_List_�);

         CORBA.ServerRequest.Set_Result
           (Request,
            PolyORB.CORBA_P.Domain_Management.Get_Domain_Managers
            (Self));

      elsif Operation = "init" then

         declare
            Argument_�_params  : RI.StringArray;
            pragma Warnings (Off, Argument_�_params);
            Arg_CC_�_params    : aliased PolyORB.Any.Content'Class :=
               RI.Helper.Wrap (Argument_�_params'Unrestricted_Access);
            Arg_Any_�_params   : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (RI.Helper.TC_StringArray, Arg_CC_�_params'Unchecked_Access);

            Argument_�_position : CORBA.Short;
            pragma Warnings (Off, Argument_�_position);
            Arg_CC_�_position  : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_position'Unrestricted_Access);
            Arg_Any_�_position : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_�_position'Unchecked_Access);

            Argument_�_track   : RI.LPtrack;
            pragma Warnings (Off, Argument_�_track);
            Arg_CC_�_track     : aliased PolyORB.Any.Content'Class :=
               RI.Helper.Wrap (RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence (Argument_�_track)'Unrestricted_Access);
            Arg_Any_�_track    : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (RI.Helper.TC_LPtrack, Arg_CC_�_track'Unchecked_Access);

            Argument_�_box     : RI.LPtrack;
            pragma Warnings (Off, Argument_�_box);
            Arg_CC_�_box       : aliased PolyORB.Any.Content'Class :=
               RI.Helper.Wrap (RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence (Argument_�_box)'Unrestricted_Access);
            Arg_Any_�_box      : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (RI.Helper.TC_LPtrack, Arg_CC_�_box'Unchecked_Access);

            Argument_�_laps    : CORBA.Short;
            pragma Warnings (Off, Argument_�_laps);
            Arg_CC_�_laps      : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_laps'Unrestricted_Access);
            Arg_Any_�_laps     : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_�_laps'Unchecked_Access);

         begin
            CORBA.NVList.Add_Item
              (Arg_List_�,
               init_Arg_Name_�_params,
               Arg_Any_�_params,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_�,
               init_Arg_Name_�_position,
               Arg_Any_�_position,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_�,
               init_Arg_Name_�_track,
               Arg_Any_�_track,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_�,
               init_Arg_Name_�_box,
               Arg_Any_�_box,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_�,
               init_Arg_Name_�_laps,
               Arg_Any_�_laps,
               CORBA.ARG_IN);

            CORBA.ServerRequest.Arguments (Request, Arg_List_�);

            begin
               RI.driver_RI.Impl.init
                 (RI.driver_RI.Impl.Object'Class (Self.all)'Access,
                  Argument_�_params,
                  Argument_�_position,
                  Argument_�_track,
                  Argument_�_box,
                  Argument_�_laps);
            end;
            CORBA.NVList.Internals.Clone_Out_Args (Arg_List_�);
            return;
         end;

      else
         CORBA.Raise_Bad_Operation (CORBA.Default_Sys_Member);
      end if;
   exception
      when E : others =>
         CORBA.ServerRequest.Set_Exception
           (Request,
            PolyORB.CORBA_P.Exceptions.System_Exception_To_Any (E));
         PolyORB.QoS.Exception_Informations.Set_Exception_Information
           (Request, E);
   end Invoke;

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
      use PolyORB.Initialization;
      use PolyORB.Initialization.String_Lists;
      use PolyORB.Utils.Strings;
   begin
      Register_Module
        (Module_Info'
         (Name      => +"RI.driver_RI.Skel",
          Conflicts => PolyORB.Initialization.String_Lists.Empty,
          Depends   =>
                  PolyORB.Initialization.String_Lists.Empty
          ,
          Provides  => PolyORB.Initialization.String_Lists.Empty,
          Implicit  => False,
          Init      => Deferred_Initialization'Access,
          Shutdown  => null));
   end;

end RI.driver_RI.Skel;
