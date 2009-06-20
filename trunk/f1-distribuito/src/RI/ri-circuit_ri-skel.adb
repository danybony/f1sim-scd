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
with RI.circuit_RI.Impl;
with CORBA;
pragma Elaborate_All (CORBA);
with PortableServer;
pragma Elaborate_All (PortableServer);
with PolyORB.CORBA_P.Exceptions;

package body RI.circuit_RI.Skel is

   --  Skeleton subprograms

   function Servant_Is_A
     (Obj : PortableServer.Servant)
     return Boolean;

   function Servant_Is_A
     (Obj : PortableServer.Servant)
     return Boolean is
   begin
      return Obj.all in RI.circuit_RI.Impl.Object'Class;
   end Servant_Is_A;

   Is_A_Arg_Name_�_Type_Id : constant CORBA.Identifier
   := CORBA.To_CORBA_String ("Type_Id");

   enter_Arg_Name_�_segment : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("segment");
   enter_Arg_Name_�_speed : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("speed");
   enter_Arg_Name_�_lane : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("lane");

   leave_Arg_Name_�_segment : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("segment");
   leave_Arg_Name_�_lane : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("lane");

   enter_Box_Arg_Name_�_segment : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("segment");
   enter_Box_Arg_Name_�_speed : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("speed");
   enter_Box_Arg_Name_�_lane : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("lane");

   leave_Box_Arg_Name_�_segment : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("segment");
   leave_Box_Arg_Name_�_lane : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("lane");

   build_track_Arg_Name_�_MacroSegments : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("MacroSegments");
   build_track_Arg_Name_�_MacroSegments_total : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("MacroSegments_total");
   build_track_Arg_Name_�_Segments_total : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("Segments_total");

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

               Result_� := RI.circuit_RI.Is_A
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

      elsif Operation = "enter" then

         declare
            Argument_�_segment : CORBA.Long;
            pragma Warnings (Off, Argument_�_segment);
            Arg_CC_�_segment  : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_segment'Unrestricted_Access);
            Arg_Any_�_segment : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_�_segment'Unchecked_Access);

            Argument_�_speed  : CORBA.Float;
            pragma Warnings (Off, Argument_�_speed);
            Arg_CC_�_speed    : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_speed'Unrestricted_Access);
            Arg_Any_�_speed   : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Float, Arg_CC_�_speed'Unchecked_Access);

            Argument_�_lane   : CORBA.Short;
            pragma Warnings (Off, Argument_�_lane);
            Arg_CC_�_lane     : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_lane'Unrestricted_Access);
            Arg_Any_�_lane    : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_�_lane'Unchecked_Access);

         begin
            CORBA.NVList.Add_Item
              (Arg_List_�,
               enter_Arg_Name_�_segment,
               Arg_Any_�_segment,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_�,
               enter_Arg_Name_�_speed,
               Arg_Any_�_speed,
               CORBA.ARG_INOUT);
            CORBA.NVList.Add_Item
              (Arg_List_�,
               enter_Arg_Name_�_lane,
               Arg_Any_�_lane,
               CORBA.ARG_INOUT);

            CORBA.ServerRequest.Arguments (Request, Arg_List_�);

            begin
               RI.circuit_RI.Impl.enter
                 (RI.circuit_RI.Impl.Object'Class (Self.all)'Access,
                  Argument_�_segment,
                  Argument_�_speed,
                  Argument_�_lane);
            end;
            CORBA.NVList.Internals.Clone_Out_Args (Arg_List_�);
            return;
         end;

      elsif Operation = "leave" then

         declare
            Argument_�_segment : CORBA.Long;
            pragma Warnings (Off, Argument_�_segment);
            Arg_CC_�_segment  : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_segment'Unrestricted_Access);
            Arg_Any_�_segment : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_�_segment'Unchecked_Access);

            Argument_�_lane   : CORBA.Short;
            pragma Warnings (Off, Argument_�_lane);
            Arg_CC_�_lane     : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_lane'Unrestricted_Access);
            Arg_Any_�_lane    : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_�_lane'Unchecked_Access);

         begin
            CORBA.NVList.Add_Item
              (Arg_List_�,
               leave_Arg_Name_�_segment,
               Arg_Any_�_segment,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_�,
               leave_Arg_Name_�_lane,
               Arg_Any_�_lane,
               CORBA.ARG_INOUT);

            CORBA.ServerRequest.Arguments (Request, Arg_List_�);

            begin
               RI.circuit_RI.Impl.leave
                 (RI.circuit_RI.Impl.Object'Class (Self.all)'Access,
                  Argument_�_segment,
                  Argument_�_lane);
            end;
            CORBA.NVList.Internals.Clone_Out_Args (Arg_List_�);
            return;
         end;

      elsif Operation = "enter_Box" then

         declare
            Argument_�_segment : CORBA.Long;
            pragma Warnings (Off, Argument_�_segment);
            Arg_CC_�_segment  : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_segment'Unrestricted_Access);
            Arg_Any_�_segment : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_�_segment'Unchecked_Access);

            Argument_�_speed  : CORBA.Float;
            pragma Warnings (Off, Argument_�_speed);
            Arg_CC_�_speed    : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_speed'Unrestricted_Access);
            Arg_Any_�_speed   : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Float, Arg_CC_�_speed'Unchecked_Access);

            Argument_�_lane   : CORBA.Short;
            pragma Warnings (Off, Argument_�_lane);
            Arg_CC_�_lane     : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_lane'Unrestricted_Access);
            Arg_Any_�_lane    : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_�_lane'Unchecked_Access);

         begin
            CORBA.NVList.Add_Item
              (Arg_List_�,
               enter_Box_Arg_Name_�_segment,
               Arg_Any_�_segment,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_�,
               enter_Box_Arg_Name_�_speed,
               Arg_Any_�_speed,
               CORBA.ARG_INOUT);
            CORBA.NVList.Add_Item
              (Arg_List_�,
               enter_Box_Arg_Name_�_lane,
               Arg_Any_�_lane,
               CORBA.ARG_INOUT);

            CORBA.ServerRequest.Arguments (Request, Arg_List_�);

            begin
               RI.circuit_RI.Impl.enter_Box
                 (RI.circuit_RI.Impl.Object'Class (Self.all)'Access,
                  Argument_�_segment,
                  Argument_�_speed,
                  Argument_�_lane);
            end;
            CORBA.NVList.Internals.Clone_Out_Args (Arg_List_�);
            return;
         end;

      elsif Operation = "leave_Box" then

         declare
            Argument_�_segment : CORBA.Long;
            pragma Warnings (Off, Argument_�_segment);
            Arg_CC_�_segment  : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_segment'Unrestricted_Access);
            Arg_Any_�_segment : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_�_segment'Unchecked_Access);

            Argument_�_lane   : CORBA.Short;
            pragma Warnings (Off, Argument_�_lane);
            Arg_CC_�_lane     : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_lane'Unrestricted_Access);
            Arg_Any_�_lane    : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_�_lane'Unchecked_Access);

         begin
            CORBA.NVList.Add_Item
              (Arg_List_�,
               leave_Box_Arg_Name_�_segment,
               Arg_Any_�_segment,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_�,
               leave_Box_Arg_Name_�_lane,
               Arg_Any_�_lane,
               CORBA.ARG_INOUT);

            CORBA.ServerRequest.Arguments (Request, Arg_List_�);

            begin
               RI.circuit_RI.Impl.leave_Box
                 (RI.circuit_RI.Impl.Object'Class (Self.all)'Access,
                  Argument_�_segment,
                  Argument_�_lane);
            end;
            CORBA.NVList.Internals.Clone_Out_Args (Arg_List_�);
            return;
         end;

      elsif Operation = "build_track" then

         declare
            Argument_�_MacroSegments      : RI.StringSequence;
            pragma Warnings (Off, Argument_�_MacroSegments);
            Arg_CC_�_MacroSegments        : aliased PolyORB.Any.Content'Class :=
               RI.Helper.Wrap (RI.IDL_SEQUENCE_string.Sequence (Argument_�_MacroSegments)'Unrestricted_Access);
            Arg_Any_�_MacroSegments       : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (RI.Helper.TC_StringSequence, Arg_CC_�_MacroSegments'Unchecked_Access);

            Argument_�_MacroSegments_total : CORBA.Long;
            pragma Warnings (Off, Argument_�_MacroSegments_total);
            Arg_CC_�_MacroSegments_total  : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_MacroSegments_total'Unrestricted_Access);
            Arg_Any_�_MacroSegments_total : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_�_MacroSegments_total'Unchecked_Access);

            Argument_�_Segments_total     : CORBA.Long;
            pragma Warnings (Off, Argument_�_Segments_total);
            Arg_CC_�_Segments_total       : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_�_Segments_total'Unrestricted_Access);
            Arg_Any_�_Segments_total      : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_�_Segments_total'Unchecked_Access);

         begin
            CORBA.NVList.Add_Item
              (Arg_List_�,
               build_track_Arg_Name_�_MacroSegments,
               Arg_Any_�_MacroSegments,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_�,
               build_track_Arg_Name_�_MacroSegments_total,
               Arg_Any_�_MacroSegments_total,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_�,
               build_track_Arg_Name_�_Segments_total,
               Arg_Any_�_Segments_total,
               CORBA.ARG_OUT);

            CORBA.ServerRequest.Arguments (Request, Arg_List_�);

            begin
               RI.circuit_RI.Impl.build_track
                 (RI.circuit_RI.Impl.Object'Class (Self.all)'Access,
                  Argument_�_MacroSegments,
                  Argument_�_MacroSegments_total,
                  Argument_�_Segments_total);
            end;
            CORBA.NVList.Internals.Clone_Out_Args (Arg_List_�);
            return;
         end;

      elsif Operation = "endRace" then
         begin

            CORBA.ServerRequest.Arguments (Request, Arg_List_�);

            begin
               RI.circuit_RI.Impl.endRace
                 (RI.circuit_RI.Impl.Object'Class (Self.all)'Access);
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
        (RI.circuit_RI.Repository_Id,
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
         (Name      => +"RI.circuit_RI.Skel",
          Conflicts => PolyORB.Initialization.String_Lists.Empty,
          Depends   =>
                  PolyORB.Initialization.String_Lists.Empty
          ,
          Provides  => PolyORB.Initialization.String_Lists.Empty,
          Implicit  => False,
          Init      => Deferred_Initialization'Access,
          Shutdown  => null));
   end;

end RI.circuit_RI.Skel;
