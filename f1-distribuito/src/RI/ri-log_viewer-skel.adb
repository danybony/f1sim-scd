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
with RI.Log_viewer.Impl;
with CORBA;
pragma Elaborate_All (CORBA);
with PortableServer;
pragma Elaborate_All (PortableServer);
with PolyORB.CORBA_P.Exceptions;

package body RI.Log_viewer.Skel is

   --  Skeleton subprograms

   function Servant_Is_A
     (Obj : PortableServer.Servant)
     return Boolean;

   function Servant_Is_A
     (Obj : PortableServer.Servant)
     return Boolean is
   begin
      return Obj.all in RI.Log_viewer.Impl.Object'Class;
   end Servant_Is_A;

   Is_A_Arg_Name_�_Type_Id : constant CORBA.Identifier
   := CORBA.To_CORBA_String ("Type_Id");

   setEnvironment_Arg_Name_�_Drivers : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("Drivers");
   setEnvironment_Arg_Name_�_segmentsNumber : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("segmentsNumber");
   setEnvironment_Arg_Name_�_T1 : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("T1");
   setEnvironment_Arg_Name_�_T2 : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("T2");
   setEnvironment_Arg_Name_�_RaceLaps : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("RaceLaps");

   updateLog_Arg_Name_�_Driver_ID : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("Driver_ID");
   updateLog_Arg_Name_�_Segment : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("Segment");
   updateLog_Arg_Name_�_Speed : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("Speed");
   updateLog_Arg_Name_�_box : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("box");

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

               Result_� := RI.Log_viewer.Is_A
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

      elsif Operation = "setEnvironment" then

         declare
            Argument_�_Drivers       : RI.StringSequence;
            pragma Warnings (Off, Argument_�_Drivers);
            Arg_CC_�_Drivers         : aliased PolyORB.Any.Content'Class :=
               RI.Helper.Wrap (RI.IDL_SEQUENCE_string.Sequence (Argument_�_Drivers)'Unrestricted_Access);
            Arg_Any_�_Drivers        : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (RI.Helper.TC_StringSequence, Arg_CC_�_Drivers'Unchecked_Access);

            Argument_�_segmentsNumber : CORBA.Long;
            pragma Warnings (Off, Argument_�_segmentsNumber);
            Arg_CC_�_segmentsNumber  : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_segmentsNumber'Unrestricted_Access);
            Arg_Any_�_segmentsNumber : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_�_segmentsNumber'Unchecked_Access);

            Argument_�_T1            : CORBA.Short;
            pragma Warnings (Off, Argument_�_T1);
            Arg_CC_�_T1              : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_T1'Unrestricted_Access);
            Arg_Any_�_T1             : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_�_T1'Unchecked_Access);

            Argument_�_T2            : CORBA.Short;
            pragma Warnings (Off, Argument_�_T2);
            Arg_CC_�_T2              : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_T2'Unrestricted_Access);
            Arg_Any_�_T2             : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_�_T2'Unchecked_Access);

            Argument_�_RaceLaps      : CORBA.Short;
            pragma Warnings (Off, Argument_�_RaceLaps);
            Arg_CC_�_RaceLaps        : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_RaceLaps'Unrestricted_Access);
            Arg_Any_�_RaceLaps       : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_�_RaceLaps'Unchecked_Access);

         begin
            CORBA.NVList.Add_Item
              (Arg_List_�,
               setEnvironment_Arg_Name_�_Drivers,
               Arg_Any_�_Drivers,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_�,
               setEnvironment_Arg_Name_�_segmentsNumber,
               Arg_Any_�_segmentsNumber,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_�,
               setEnvironment_Arg_Name_�_T1,
               Arg_Any_�_T1,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_�,
               setEnvironment_Arg_Name_�_T2,
               Arg_Any_�_T2,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_�,
               setEnvironment_Arg_Name_�_RaceLaps,
               Arg_Any_�_RaceLaps,
               CORBA.ARG_IN);

            CORBA.ServerRequest.Arguments (Request, Arg_List_�);

            begin
               RI.Log_viewer.Impl.setEnvironment
                 (RI.Log_viewer.Impl.Object'Class (Self.all)'Access,
                  Argument_�_Drivers,
                  Argument_�_segmentsNumber,
                  Argument_�_T1,
                  Argument_�_T2,
                  Argument_�_RaceLaps);
            end;
            return;
         end;

      elsif Operation = "updateLog" then

         declare
            Argument_�_Driver_ID : CORBA.Short;
            pragma Warnings (Off, Argument_�_Driver_ID);
            Arg_CC_�_Driver_ID  : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_Driver_ID'Unrestricted_Access);
            Arg_Any_�_Driver_ID : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_�_Driver_ID'Unchecked_Access);

            Argument_�_Segment  : CORBA.Long;
            pragma Warnings (Off, Argument_�_Segment);
            Arg_CC_�_Segment    : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_Segment'Unrestricted_Access);
            Arg_Any_�_Segment   : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_�_Segment'Unchecked_Access);

            Argument_�_Speed    : CORBA.Float;
            pragma Warnings (Off, Argument_�_Speed);
            Arg_CC_�_Speed      : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_Speed'Unrestricted_Access);
            Arg_Any_�_Speed     : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Float, Arg_CC_�_Speed'Unchecked_Access);

            Argument_�_box      : CORBA.Boolean;
            pragma Warnings (Off, Argument_�_box);
            Arg_CC_�_box        : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_box'Unrestricted_Access);
            Arg_Any_�_box       : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Boolean, Arg_CC_�_box'Unchecked_Access);

         begin
            CORBA.NVList.Add_Item
              (Arg_List_�,
               updateLog_Arg_Name_�_Driver_ID,
               Arg_Any_�_Driver_ID,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_�,
               updateLog_Arg_Name_�_Segment,
               Arg_Any_�_Segment,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_�,
               updateLog_Arg_Name_�_Speed,
               Arg_Any_�_Speed,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_�,
               updateLog_Arg_Name_�_box,
               Arg_Any_�_box,
               CORBA.ARG_IN);

            CORBA.ServerRequest.Arguments (Request, Arg_List_�);

            begin
               RI.Log_viewer.Impl.updateLog
                 (RI.Log_viewer.Impl.Object'Class (Self.all)'Access,
                  Argument_�_Driver_ID,
                  Argument_�_Segment,
                  Argument_�_Speed,
                  Argument_�_box);
            end;
            return;
         end;

      elsif Operation = "endRace" then
         begin

            CORBA.ServerRequest.Arguments (Request, Arg_List_�);

            begin
               RI.Log_viewer.Impl.endRace
                 (RI.Log_viewer.Impl.Object'Class (Self.all)'Access);
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
        (RI.Log_viewer.Repository_Id,
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
         (Name      => +"RI.Log_viewer.Skel",
          Conflicts => PolyORB.Initialization.String_Lists.Empty,
          Depends   =>
                  PolyORB.Initialization.String_Lists.Empty
          ,
          Provides  => PolyORB.Initialization.String_Lists.Empty,
          Implicit  => False,
          Init      => Deferred_Initialization'Access,
          Shutdown  => null));
   end;

end RI.Log_viewer.Skel;
