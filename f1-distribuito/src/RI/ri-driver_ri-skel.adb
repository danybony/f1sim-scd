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

   Is_A_Arg_Name_Ü_Type_Id : constant CORBA.Identifier
   := CORBA.To_CORBA_String ("Type_Id");

   init_Arg_Name_Ü_params : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("params");
   init_Arg_Name_Ü_position : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("position");
   init_Arg_Name_Ü_track : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("track");
   init_Arg_Name_Ü_box : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("box");
   init_Arg_Name_Ü_laps : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("laps");

   procedure Invoke
     (Self : PortableServer.Servant;
      Request : CORBA.ServerRequest.Object_Ptr)
   is
      Operation : constant PolyORB.Std.String
         := CORBA.To_Standard_String
              (CORBA.ServerRequest.Operation
               (Request.all));
      Arg_List_Ü : CORBA.NVList.Ref;
   begin
      CORBA.ORB.Create_List (0, Arg_List_Ü);
      if Operation = "_is_a" then
         declare
            Type_Id : CORBA.String;
            Arg_Any_Ü_Type_Id : constant CORBA.Any := CORBA.To_Any (Type_Id);

            Result_Ü : CORBA.Boolean;
         begin
            CORBA.NVList.Add_Item
            (Arg_List_Ü,
            Is_A_Arg_Name_Ü_Type_Id,
            Arg_Any_Ü_Type_Id,
            CORBA.ARG_IN);

            CORBA.ServerRequest.Arguments (Request, Arg_List_Ü);

            begin
               --  Convert arguments from their Any

               Type_Id :=
                 CORBA.From_Any (Arg_Any_Ü_Type_Id);

               --  Call implementation

               Result_Ü := RI.driver_RI.Is_A
                 (CORBA.To_Standard_String (Type_Id));
            end;

            -- Set Result

            CORBA.ServerRequest.Set_Result
            (Request,
            CORBA.To_Any (Result_Ü));
         end;

      elsif Operation = "_non_existent"
        or else Operation = "_not_existent"
      then

         CORBA.ServerRequest.Arguments (Request, Arg_List_Ü);

         CORBA.ServerRequest.Set_Result
           (Request,
            CORBA.To_Any (CORBA.Boolean'(False)));

      elsif Operation = "_interface" then

         CORBA.ServerRequest.Arguments (Request, Arg_List_Ü);

         CORBA.ServerRequest.Set_Result
           (Request,
            CORBA.Object.Helper.To_Any
            (CORBA.Object.Ref
             (PolyORB.CORBA_P.IR_Hooks.Get_Interface_Definition
              (CORBA.To_CORBA_String (Repository_Id)))));

      elsif Operation = "_domain_managers" then

         CORBA.ServerRequest.Arguments (Request, Arg_List_Ü);

         CORBA.ServerRequest.Set_Result
           (Request,
            PolyORB.CORBA_P.Domain_Management.Get_Domain_Managers
            (Self));

      elsif Operation = "init" then

         declare
            Argument_Ü_params  : RI.StringArray;
            pragma Warnings (Off, Argument_Ü_params);
            Arg_CC_Ü_params    : aliased PolyORB.Any.Content'Class :=
               RI.Helper.Wrap (Argument_Ü_params'Unrestricted_Access);
            Arg_Any_Ü_params   : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (RI.Helper.TC_StringArray, Arg_CC_Ü_params'Unchecked_Access);

            Argument_Ü_position : CORBA.Short;
            pragma Warnings (Off, Argument_Ü_position);
            Arg_CC_Ü_position  : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_Ü_position'Unrestricted_Access);
            Arg_Any_Ü_position : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_Ü_position'Unchecked_Access);

            Argument_Ü_track   : RI.LPtrack;
            pragma Warnings (Off, Argument_Ü_track);
            Arg_CC_Ü_track     : aliased PolyORB.Any.Content'Class :=
               RI.Helper.Wrap (RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence (Argument_Ü_track)'Unrestricted_Access);
            Arg_Any_Ü_track    : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (RI.Helper.TC_LPtrack, Arg_CC_Ü_track'Unchecked_Access);

            Argument_Ü_box     : RI.LPtrack;
            pragma Warnings (Off, Argument_Ü_box);
            Arg_CC_Ü_box       : aliased PolyORB.Any.Content'Class :=
               RI.Helper.Wrap (RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence (Argument_Ü_box)'Unrestricted_Access);
            Arg_Any_Ü_box      : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (RI.Helper.TC_LPtrack, Arg_CC_Ü_box'Unchecked_Access);

            Argument_Ü_laps    : CORBA.Short;
            pragma Warnings (Off, Argument_Ü_laps);
            Arg_CC_Ü_laps      : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_Ü_laps'Unrestricted_Access);
            Arg_Any_Ü_laps     : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_Ü_laps'Unchecked_Access);

         begin
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               init_Arg_Name_Ü_params,
               Arg_Any_Ü_params,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               init_Arg_Name_Ü_position,
               Arg_Any_Ü_position,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               init_Arg_Name_Ü_track,
               Arg_Any_Ü_track,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               init_Arg_Name_Ü_box,
               Arg_Any_Ü_box,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               init_Arg_Name_Ü_laps,
               Arg_Any_Ü_laps,
               CORBA.ARG_IN);

            CORBA.ServerRequest.Arguments (Request, Arg_List_Ü);

            begin
               RI.driver_RI.Impl.init
                 (RI.driver_RI.Impl.Object'Class (Self.all)'Access,
                  Argument_Ü_params,
                  Argument_Ü_position,
                  Argument_Ü_track,
                  Argument_Ü_box,
                  Argument_Ü_laps);
            end;
            CORBA.NVList.Internals.Clone_Out_Args (Arg_List_Ü);
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
