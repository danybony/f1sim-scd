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

   Is_A_Arg_Name_Ü_Type_Id : constant CORBA.Identifier
   := CORBA.To_CORBA_String ("Type_Id");

   enter_Arg_Name_Ü_segment : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("segment");
   enter_Arg_Name_Ü_speed : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("speed");
   enter_Arg_Name_Ü_lane : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("lane");

   leave_Arg_Name_Ü_segment : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("segment");
   leave_Arg_Name_Ü_lane : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("lane");

   enter_Box_Arg_Name_Ü_segment : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("segment");
   enter_Box_Arg_Name_Ü_speed : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("speed");
   enter_Box_Arg_Name_Ü_lane : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("lane");

   leave_Box_Arg_Name_Ü_segment : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("segment");
   leave_Box_Arg_Name_Ü_lane : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("lane");

   build_track_Arg_Name_Ü_MacroSegments : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("MacroSegments");
   build_track_Arg_Name_Ü_MacroSegments_total : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("MacroSegments_total");
   build_track_Arg_Name_Ü_Segments_total : constant CORBA.Identifier :=
     CORBA.To_CORBA_String ("Segments_total");

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

               Result_Ü := RI.circuit_RI.Is_A
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

      elsif Operation = "enter" then

         declare
            Argument_Ü_segment : CORBA.Long;
            pragma Warnings (Off, Argument_Ü_segment);
            Arg_CC_Ü_segment  : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_Ü_segment'Unrestricted_Access);
            Arg_Any_Ü_segment : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_Ü_segment'Unchecked_Access);

            Argument_Ü_speed  : CORBA.Float;
            pragma Warnings (Off, Argument_Ü_speed);
            Arg_CC_Ü_speed    : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_Ü_speed'Unrestricted_Access);
            Arg_Any_Ü_speed   : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Float, Arg_CC_Ü_speed'Unchecked_Access);

            Argument_Ü_lane   : CORBA.Short;
            pragma Warnings (Off, Argument_Ü_lane);
            Arg_CC_Ü_lane     : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_Ü_lane'Unrestricted_Access);
            Arg_Any_Ü_lane    : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_Ü_lane'Unchecked_Access);

         begin
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               enter_Arg_Name_Ü_segment,
               Arg_Any_Ü_segment,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               enter_Arg_Name_Ü_speed,
               Arg_Any_Ü_speed,
               CORBA.ARG_INOUT);
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               enter_Arg_Name_Ü_lane,
               Arg_Any_Ü_lane,
               CORBA.ARG_INOUT);

            CORBA.ServerRequest.Arguments (Request, Arg_List_Ü);

            begin
               RI.circuit_RI.Impl.enter
                 (RI.circuit_RI.Impl.Object'Class (Self.all)'Access,
                  Argument_Ü_segment,
                  Argument_Ü_speed,
                  Argument_Ü_lane);
            end;
            CORBA.NVList.Internals.Clone_Out_Args (Arg_List_Ü);
            return;
         end;

      elsif Operation = "leave" then

         declare
            Argument_Ü_segment : CORBA.Long;
            pragma Warnings (Off, Argument_Ü_segment);
            Arg_CC_Ü_segment  : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_Ü_segment'Unrestricted_Access);
            Arg_Any_Ü_segment : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_Ü_segment'Unchecked_Access);

            Argument_Ü_lane   : CORBA.Short;
            pragma Warnings (Off, Argument_Ü_lane);
            Arg_CC_Ü_lane     : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_Ü_lane'Unrestricted_Access);
            Arg_Any_Ü_lane    : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_Ü_lane'Unchecked_Access);

         begin
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               leave_Arg_Name_Ü_segment,
               Arg_Any_Ü_segment,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               leave_Arg_Name_Ü_lane,
               Arg_Any_Ü_lane,
               CORBA.ARG_INOUT);

            CORBA.ServerRequest.Arguments (Request, Arg_List_Ü);

            begin
               RI.circuit_RI.Impl.leave
                 (RI.circuit_RI.Impl.Object'Class (Self.all)'Access,
                  Argument_Ü_segment,
                  Argument_Ü_lane);
            end;
            CORBA.NVList.Internals.Clone_Out_Args (Arg_List_Ü);
            return;
         end;

      elsif Operation = "enter_Box" then

         declare
            Argument_Ü_segment : CORBA.Long;
            pragma Warnings (Off, Argument_Ü_segment);
            Arg_CC_Ü_segment  : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_Ü_segment'Unrestricted_Access);
            Arg_Any_Ü_segment : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_Ü_segment'Unchecked_Access);

            Argument_Ü_speed  : CORBA.Float;
            pragma Warnings (Off, Argument_Ü_speed);
            Arg_CC_Ü_speed    : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_Ü_speed'Unrestricted_Access);
            Arg_Any_Ü_speed   : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Float, Arg_CC_Ü_speed'Unchecked_Access);

            Argument_Ü_lane   : CORBA.Short;
            pragma Warnings (Off, Argument_Ü_lane);
            Arg_CC_Ü_lane     : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_Ü_lane'Unrestricted_Access);
            Arg_Any_Ü_lane    : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_Ü_lane'Unchecked_Access);

         begin
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               enter_Box_Arg_Name_Ü_segment,
               Arg_Any_Ü_segment,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               enter_Box_Arg_Name_Ü_speed,
               Arg_Any_Ü_speed,
               CORBA.ARG_INOUT);
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               enter_Box_Arg_Name_Ü_lane,
               Arg_Any_Ü_lane,
               CORBA.ARG_INOUT);

            CORBA.ServerRequest.Arguments (Request, Arg_List_Ü);

            begin
               RI.circuit_RI.Impl.enter_Box
                 (RI.circuit_RI.Impl.Object'Class (Self.all)'Access,
                  Argument_Ü_segment,
                  Argument_Ü_speed,
                  Argument_Ü_lane);
            end;
            CORBA.NVList.Internals.Clone_Out_Args (Arg_List_Ü);
            return;
         end;

      elsif Operation = "leave_Box" then

         declare
            Argument_Ü_segment : CORBA.Long;
            pragma Warnings (Off, Argument_Ü_segment);
            Arg_CC_Ü_segment  : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_Ü_segment'Unrestricted_Access);
            Arg_Any_Ü_segment : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_Ü_segment'Unchecked_Access);

            Argument_Ü_lane   : CORBA.Short;
            pragma Warnings (Off, Argument_Ü_lane);
            Arg_CC_Ü_lane     : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_Ü_lane'Unrestricted_Access);
            Arg_Any_Ü_lane    : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_Ü_lane'Unchecked_Access);

         begin
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               leave_Box_Arg_Name_Ü_segment,
               Arg_Any_Ü_segment,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               leave_Box_Arg_Name_Ü_lane,
               Arg_Any_Ü_lane,
               CORBA.ARG_INOUT);

            CORBA.ServerRequest.Arguments (Request, Arg_List_Ü);

            begin
               RI.circuit_RI.Impl.leave_Box
                 (RI.circuit_RI.Impl.Object'Class (Self.all)'Access,
                  Argument_Ü_segment,
                  Argument_Ü_lane);
            end;
            CORBA.NVList.Internals.Clone_Out_Args (Arg_List_Ü);
            return;
         end;

      elsif Operation = "build_track" then

         declare
            Argument_Ü_MacroSegments      : RI.StringSequence;
            pragma Warnings (Off, Argument_Ü_MacroSegments);
            Arg_CC_Ü_MacroSegments        : aliased PolyORB.Any.Content'Class :=
               RI.Helper.Wrap (RI.IDL_SEQUENCE_string.Sequence (Argument_Ü_MacroSegments)'Unrestricted_Access);
            Arg_Any_Ü_MacroSegments       : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (RI.Helper.TC_StringSequence, Arg_CC_Ü_MacroSegments'Unchecked_Access);

            Argument_Ü_MacroSegments_total : CORBA.Long;
            pragma Warnings (Off, Argument_Ü_MacroSegments_total);
            Arg_CC_Ü_MacroSegments_total  : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_Ü_MacroSegments_total'Unrestricted_Access);
            Arg_Any_Ü_MacroSegments_total : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_Ü_MacroSegments_total'Unchecked_Access);

            Argument_Ü_Segments_total     : CORBA.Long;
            pragma Warnings (Off, Argument_Ü_Segments_total);
            Arg_CC_Ü_Segments_total       : aliased PolyORB.Any.Content'Class :=
               CORBA.Wrap (Argument_Ü_Segments_total'Unrestricted_Access);
            Arg_Any_Ü_Segments_total      : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_Ü_Segments_total'Unchecked_Access);

         begin
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               build_track_Arg_Name_Ü_MacroSegments,
               Arg_Any_Ü_MacroSegments,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               build_track_Arg_Name_Ü_MacroSegments_total,
               Arg_Any_Ü_MacroSegments_total,
               CORBA.ARG_IN);
            CORBA.NVList.Add_Item
              (Arg_List_Ü,
               build_track_Arg_Name_Ü_Segments_total,
               Arg_Any_Ü_Segments_total,
               CORBA.ARG_OUT);

            CORBA.ServerRequest.Arguments (Request, Arg_List_Ü);

            begin
               RI.circuit_RI.Impl.build_track
                 (RI.circuit_RI.Impl.Object'Class (Self.all)'Access,
                  Argument_Ü_MacroSegments,
                  Argument_Ü_MacroSegments_total,
                  Argument_Ü_Segments_total);
            end;
            CORBA.NVList.Internals.Clone_Out_Args (Arg_List_Ü);
            return;
         end;

      elsif Operation = "endRace" then
         begin

            CORBA.ServerRequest.Arguments (Request, Arg_List_Ü);

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
