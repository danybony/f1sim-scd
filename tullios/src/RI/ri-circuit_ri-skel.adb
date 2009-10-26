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
with RI.circuit_RI.Impl;
with CORBA;
pragma Elaborate_All (CORBA);
with PolyORB.Any;
with CORBA.NVList;
with CORBA.ServerRequest;
with RI.Helper;
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

package body RI.circuit_RI.Skel is

   enter_Arg_Name_segment_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("segment");

   enter_Arg_Name_speed_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("speed");

   enter_Arg_Name_lane_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("lane");

   leave_Arg_Name_segment_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("segment");

   leave_Arg_Name_lane_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("lane");

   enter_Box_Arg_Name_segment_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("segment");

   enter_Box_Arg_Name_speed_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("speed");

   enter_Box_Arg_Name_lane_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("lane");

   leave_Box_Arg_Name_segment_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("segment");

   leave_Box_Arg_Name_lane_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("lane");

   build_track_Arg_Name_MacroSegments_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("MacroSegments");

   build_track_Arg_Name_MacroSegments_total_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("MacroSegments_total");

   build_track_Arg_Name_Segments_total_� : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("Segments_total");

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
            = "enter")
         then
            declare
               Argument_segment_� : CORBA.Long;
               pragma Warnings (Off, Argument_segment_�);
               Arg_CC_segment_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_segment_�'Unrestricted_Access);
               Arg_Any_segment_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Long,
                     Arg_CC_segment_�'Unchecked_Access);
               Argument_speed_� : CORBA.Float;
               pragma Warnings (Off, Argument_speed_�);
               Arg_CC_speed_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_speed_�'Unrestricted_Access);
               Arg_Any_speed_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Float,
                     Arg_CC_speed_�'Unchecked_Access);
               Argument_lane_� : CORBA.Short;
               pragma Warnings (Off, Argument_lane_�);
               Arg_CC_lane_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_lane_�'Unrestricted_Access);
               Arg_Any_lane_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Short,
                     Arg_CC_lane_�'Unchecked_Access);
            begin
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  enter_Arg_Name_segment_�,
                  Arg_Any_segment_�,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  enter_Arg_Name_speed_�,
                  Arg_Any_speed_�,
                  CORBA.ARG_INOUT);
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  enter_Arg_Name_lane_�,
                  Arg_Any_lane_�,
                  CORBA.ARG_INOUT);
               --  Processing request
               CORBA.ServerRequest.Arguments
                 (Request,
                  Argument_List_�);
               --  Call Implementation
               RI.circuit_RI.Impl.enter
                 (RI.circuit_RI.Impl.Object'Class
                    (Self.all)'Access,
                  Argument_segment_�,
                  Argument_speed_�,
                  Argument_lane_�);
               CORBA.NVList.Internals.Clone_Out_Args
                 (Argument_List_�);
            end;
         elsif (Operation_�
            = "leave")
         then
            declare
               Argument_segment_� : CORBA.Long;
               pragma Warnings (Off, Argument_segment_�);
               Arg_CC_segment_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_segment_�'Unrestricted_Access);
               Arg_Any_segment_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Long,
                     Arg_CC_segment_�'Unchecked_Access);
               Argument_lane_� : CORBA.Short;
               pragma Warnings (Off, Argument_lane_�);
               Arg_CC_lane_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_lane_�'Unrestricted_Access);
               Arg_Any_lane_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Short,
                     Arg_CC_lane_�'Unchecked_Access);
            begin
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  leave_Arg_Name_segment_�,
                  Arg_Any_segment_�,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  leave_Arg_Name_lane_�,
                  Arg_Any_lane_�,
                  CORBA.ARG_INOUT);
               --  Processing request
               CORBA.ServerRequest.Arguments
                 (Request,
                  Argument_List_�);
               --  Call Implementation
               RI.circuit_RI.Impl.leave
                 (RI.circuit_RI.Impl.Object'Class
                    (Self.all)'Access,
                  Argument_segment_�,
                  Argument_lane_�);
               CORBA.NVList.Internals.Clone_Out_Args
                 (Argument_List_�);
            end;
         elsif (Operation_�
            = "enter_Box")
         then
            declare
               Argument_segment_� : CORBA.Long;
               pragma Warnings (Off, Argument_segment_�);
               Arg_CC_segment_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_segment_�'Unrestricted_Access);
               Arg_Any_segment_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Long,
                     Arg_CC_segment_�'Unchecked_Access);
               Argument_speed_� : CORBA.Float;
               pragma Warnings (Off, Argument_speed_�);
               Arg_CC_speed_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_speed_�'Unrestricted_Access);
               Arg_Any_speed_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Float,
                     Arg_CC_speed_�'Unchecked_Access);
               Argument_lane_� : CORBA.Short;
               pragma Warnings (Off, Argument_lane_�);
               Arg_CC_lane_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_lane_�'Unrestricted_Access);
               Arg_Any_lane_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Short,
                     Arg_CC_lane_�'Unchecked_Access);
            begin
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  enter_Box_Arg_Name_segment_�,
                  Arg_Any_segment_�,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  enter_Box_Arg_Name_speed_�,
                  Arg_Any_speed_�,
                  CORBA.ARG_INOUT);
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  enter_Box_Arg_Name_lane_�,
                  Arg_Any_lane_�,
                  CORBA.ARG_INOUT);
               --  Processing request
               CORBA.ServerRequest.Arguments
                 (Request,
                  Argument_List_�);
               --  Call Implementation
               RI.circuit_RI.Impl.enter_Box
                 (RI.circuit_RI.Impl.Object'Class
                    (Self.all)'Access,
                  Argument_segment_�,
                  Argument_speed_�,
                  Argument_lane_�);
               CORBA.NVList.Internals.Clone_Out_Args
                 (Argument_List_�);
            end;
         elsif (Operation_�
            = "leave_Box")
         then
            declare
               Argument_segment_� : CORBA.Long;
               pragma Warnings (Off, Argument_segment_�);
               Arg_CC_segment_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_segment_�'Unrestricted_Access);
               Arg_Any_segment_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Long,
                     Arg_CC_segment_�'Unchecked_Access);
               Argument_lane_� : CORBA.Short;
               pragma Warnings (Off, Argument_lane_�);
               Arg_CC_lane_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_lane_�'Unrestricted_Access);
               Arg_Any_lane_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Short,
                     Arg_CC_lane_�'Unchecked_Access);
            begin
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  leave_Box_Arg_Name_segment_�,
                  Arg_Any_segment_�,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  leave_Box_Arg_Name_lane_�,
                  Arg_Any_lane_�,
                  CORBA.ARG_INOUT);
               --  Processing request
               CORBA.ServerRequest.Arguments
                 (Request,
                  Argument_List_�);
               --  Call Implementation
               RI.circuit_RI.Impl.leave_Box
                 (RI.circuit_RI.Impl.Object'Class
                    (Self.all)'Access,
                  Argument_segment_�,
                  Argument_lane_�);
               CORBA.NVList.Internals.Clone_Out_Args
                 (Argument_List_�);
            end;
         elsif (Operation_�
            = "build_track")
         then
            declare
               Argument_MacroSegments_� : RI.StringSequence;
               pragma Warnings (Off, Argument_MacroSegments_�);
               Arg_CC_MacroSegments_� : aliased PolyORB.Any.Content'Class :=
                 RI.Helper.Internals.Wrap
                    (RI.IDL_SEQUENCE_string.Sequence
                       (Argument_MacroSegments_�)'Unrestricted_Access);
               Arg_Any_MacroSegments_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (RI.Helper.TC_StringSequence,
                     Arg_CC_MacroSegments_�'Unchecked_Access);
               Argument_MacroSegments_total_� : CORBA.Long;
               pragma Warnings (Off, Argument_MacroSegments_total_�);
               Arg_CC_MacroSegments_total_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_MacroSegments_total_�'Unrestricted_Access);
               Arg_Any_MacroSegments_total_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Long,
                     Arg_CC_MacroSegments_total_�'Unchecked_Access);
               Argument_Segments_total_� : CORBA.Long;
               pragma Warnings (Off, Argument_Segments_total_�);
               Arg_CC_Segments_total_� : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_Segments_total_�'Unrestricted_Access);
               Arg_Any_Segments_total_� : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Long,
                     Arg_CC_Segments_total_�'Unchecked_Access);
            begin
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  build_track_Arg_Name_MacroSegments_�,
                  Arg_Any_MacroSegments_�,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  build_track_Arg_Name_MacroSegments_total_�,
                  Arg_Any_MacroSegments_total_�,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_�,
                  build_track_Arg_Name_Segments_total_�,
                  Arg_Any_Segments_total_�,
                  CORBA.ARG_OUT);
               --  Processing request
               CORBA.ServerRequest.Arguments
                 (Request,
                  Argument_List_�);
               --  Call Implementation
               RI.circuit_RI.Impl.build_track
                 (RI.circuit_RI.Impl.Object'Class
                    (Self.all)'Access,
                  Argument_MacroSegments_�,
                  Argument_MacroSegments_total_�,
                  Argument_Segments_total_�);
               CORBA.NVList.Internals.Clone_Out_Args
                 (Argument_List_�);
            end;
         elsif (Operation_�
            = "endRace")
         then
            --  Processing request
            CORBA.ServerRequest.Arguments
              (Request,
               Argument_List_�);
            --  Call Implementation
            RI.circuit_RI.Impl.endRace
              (RI.circuit_RI.Impl.Object'Class
                 (Self.all)'Access);
            CORBA.NVList.Internals.Clone_Out_Args
              (Argument_List_�);

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
         in RI.circuit_RI.Impl.Object'Class);
   end Servant_Is_A;

   -----------------------------
   -- Deferred_Initialization --
   -----------------------------

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
      use PolyORB.Utils.Strings;
      use PolyORB.Utils.Strings.Lists;
   begin
      PolyORB.Initialization.Register_Module
        (PolyORB.Initialization.Module_Info'
           (Name => +"RI.circuit_RI.Skel",
            Conflicts => PolyORB.Utils.Strings.Lists.Empty,
            Depends => PolyORB.Utils.Strings.Lists.Empty,
            Provides => PolyORB.Utils.Strings.Lists.Empty,
            Implicit => False,
            Init => Deferred_Initialization'Access,
            Shutdown => null));
   end;
end RI.circuit_RI.Skel;
