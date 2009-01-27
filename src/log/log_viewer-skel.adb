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
with PolyORB.Any;
with PolyORB.CORBA_P.Domain_Management;
with PolyORB.CORBA_P.IR_Hooks;
with CORBA.Object.Helper;
with CORBA.ORB;
with CORBA.NVList;
with PolyORB.Std;
with CORBA.ServerRequest;
with Log_viewer.Impl;
with CORBA;
pragma Elaborate_All (CORBA);
with PortableServer;
pragma Elaborate_All (PortableServer);
with PolyORB.CORBA_P.Exceptions;

package body Log_viewer.Skel is

   --  Skeleton subprograms

   function Servant_Is_A
     (Obj : PortableServer.Servant)
     return Boolean;

   function Servant_Is_A
     (Obj : PortableServer.Servant)
     return Boolean is
   begin
      return Obj.all in Log_viewer.Impl.Object'Class;
   end Servant_Is_A;

   Is_A_Arg_Name_Ü_Type_Id : constant CORBA.Identifier
   := CORBA.To_CORBA_String ("Type_Id");

   updateLog_Arg_Name_Ü_Driver_ID : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("Driver_ID");
   updateLog_Arg_Name_Ü_Segment : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("Segment");
   updateLog_Arg_Name_Ü_Speed : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("Speed");

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

               Result_Ü := Log_viewer.Is_A
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

      elsif Operation = "updateLog" then

         declare
            Argument_Ü_Driver_ID : CORBA.Long;
            pragma Warnings (Off, Argument_Ü_Driver_ID);
            Arg_CC_Ü_Driver_ID  : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_Ü_Driver_ID'Unrestricted_Access);
            Arg_Any_Ü_Driver_ID : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_Ü_Driver_ID'Unchecked_Access);

            Argument_Ü_Segment  : CORBA.Long;
            pragma Warnings (Off, Argument_Ü_Segment);
            Arg_CC_Ü_Segment    : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_Ü_Segment'Unrestricted_Access);
            Arg_Any_Ü_Segment   : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_Ü_Segment'Unchecked_Access);

            Argument_Ü_Speed    : CORBA.Long;
            pragma Warnings (Off, Argument_Ü_Speed);
            Arg_CC_Ü_Speed      : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_Ü_Speed'Unrestricted_Access);
            Arg_Any_Ü_Speed     : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_Ü_Speed'Unchecked_Access);

         begin
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               updateLog_Arg_Name_Ü_Driver_ID,
               Arg_Any_Ü_Driver_ID,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               updateLog_Arg_Name_Ü_Segment,
               Arg_Any_Ü_Segment,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               updateLog_Arg_Name_Ü_Speed,
               Arg_Any_Ü_Speed,
               CORBA.ARG_IN);

            CORBA.ServerRequest.Arguments (Request, Arg_List_Ü);

            begin
               Log_viewer.Impl.updateLog
                 (Log_viewer.Impl.Object'Class (Self.all)'Access,
                  Argument_Ü_Driver_ID,
                  Argument_Ü_Segment,
                  Argument_Ü_Speed);
            end;
            return;
         end;

      elsif Operation = "endRace" then
         begin

            CORBA.ServerRequest.Arguments (Request, Arg_List_Ü);

            begin
               Log_viewer.Impl.endRace
                 (Log_viewer.Impl.Object'Class (Self.all)'Access);
            end;
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
        (Log_viewer.Repository_Id,
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
         (Name      => +"Log_viewer.Skel",
          Conflicts => PolyORB.Initialization.String_Lists.Empty,
          Depends   =>
                  PolyORB.Initialization.String_Lists.Empty
          ,
          Provides  => PolyORB.Initialization.String_Lists.Empty,
          Implicit  => False,
          Init      => Deferred_Initialization'Access,
          Shutdown  => null));
   end;

end Log_viewer.Skel;
