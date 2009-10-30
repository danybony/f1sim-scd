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

   enter_Arg_Name_segment_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("segment");

   enter_Arg_Name_speed_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("speed");

   enter_Arg_Name_lane_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("lane");

   leave_Arg_Name_segment_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("segment");

   leave_Arg_Name_lane_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("lane");

   enter_Box_Arg_Name_segment_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("segment");

   enter_Box_Arg_Name_speed_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("speed");

   enter_Box_Arg_Name_lane_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("lane");

   leave_Box_Arg_Name_segment_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("segment");

   leave_Box_Arg_Name_lane_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("lane");

   build_track_Arg_Name_MacroSegments_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("MacroSegments");

   build_track_Arg_Name_MacroSegments_total_Ü : constant CORBA.Identifier :=
     CORBA.To_CORBA_String
        ("MacroSegments_total");

   build_track_Arg_Name_Segments_total_Ü : constant CORBA.Identifier :=
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
            = "enter")
         then
            declare
               Argument_segment_Ü : CORBA.Long;
               pragma Warnings (Off, Argument_segment_Ü);
               Arg_CC_segment_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_segment_Ü'Unrestricted_Access);
               Arg_Any_segment_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Long,
                     Arg_CC_segment_Ü'Unchecked_Access);
               Argument_speed_Ü : CORBA.Float;
               pragma Warnings (Off, Argument_speed_Ü);
               Arg_CC_speed_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_speed_Ü'Unrestricted_Access);
               Arg_Any_speed_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Float,
                     Arg_CC_speed_Ü'Unchecked_Access);
               Argument_lane_Ü : CORBA.Short;
               pragma Warnings (Off, Argument_lane_Ü);
               Arg_CC_lane_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_lane_Ü'Unrestricted_Access);
               Arg_Any_lane_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Short,
                     Arg_CC_lane_Ü'Unchecked_Access);
            begin
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  enter_Arg_Name_segment_Ü,
                  Arg_Any_segment_Ü,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  enter_Arg_Name_speed_Ü,
                  Arg_Any_speed_Ü,
                  CORBA.ARG_INOUT);
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  enter_Arg_Name_lane_Ü,
                  Arg_Any_lane_Ü,
                  CORBA.ARG_INOUT);
               --  Processing request
               CORBA.ServerRequest.Arguments
                 (Request,
                  Argument_List_Ü);
               --  Call Implementation
               RI.circuit_RI.Impl.enter
                 (RI.circuit_RI.Impl.Object'Class
                    (Self.all)'Access,
                  Argument_segment_Ü,
                  Argument_speed_Ü,
                  Argument_lane_Ü);
               CORBA.NVList.Internals.Clone_Out_Args
                 (Argument_List_Ü);
            end;
         elsif (Operation_Ü
            = "leave")
         then
            declare
               Argument_segment_Ü : CORBA.Long;
               pragma Warnings (Off, Argument_segment_Ü);
               Arg_CC_segment_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_segment_Ü'Unrestricted_Access);
               Arg_Any_segment_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Long,
                     Arg_CC_segment_Ü'Unchecked_Access);
               Argument_lane_Ü : CORBA.Short;
               pragma Warnings (Off, Argument_lane_Ü);
               Arg_CC_lane_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_lane_Ü'Unrestricted_Access);
               Arg_Any_lane_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Short,
                     Arg_CC_lane_Ü'Unchecked_Access);
            begin
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  leave_Arg_Name_segment_Ü,
                  Arg_Any_segment_Ü,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  leave_Arg_Name_lane_Ü,
                  Arg_Any_lane_Ü,
                  CORBA.ARG_INOUT);
               --  Processing request
               CORBA.ServerRequest.Arguments
                 (Request,
                  Argument_List_Ü);
               --  Call Implementation
               RI.circuit_RI.Impl.leave
                 (RI.circuit_RI.Impl.Object'Class
                    (Self.all)'Access,
                  Argument_segment_Ü,
                  Argument_lane_Ü);
               CORBA.NVList.Internals.Clone_Out_Args
                 (Argument_List_Ü);
            end;
         elsif (Operation_Ü
            = "enter_Box")
         then
            declare
               Argument_segment_Ü : CORBA.Long;
               pragma Warnings (Off, Argument_segment_Ü);
               Arg_CC_segment_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_segment_Ü'Unrestricted_Access);
               Arg_Any_segment_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Long,
                     Arg_CC_segment_Ü'Unchecked_Access);
               Argument_speed_Ü : CORBA.Float;
               pragma Warnings (Off, Argument_speed_Ü);
               Arg_CC_speed_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_speed_Ü'Unrestricted_Access);
               Arg_Any_speed_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Float,
                     Arg_CC_speed_Ü'Unchecked_Access);
               Argument_lane_Ü : CORBA.Short;
               pragma Warnings (Off, Argument_lane_Ü);
               Arg_CC_lane_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_lane_Ü'Unrestricted_Access);
               Arg_Any_lane_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Short,
                     Arg_CC_lane_Ü'Unchecked_Access);
            begin
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  enter_Box_Arg_Name_segment_Ü,
                  Arg_Any_segment_Ü,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  enter_Box_Arg_Name_speed_Ü,
                  Arg_Any_speed_Ü,
                  CORBA.ARG_INOUT);
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  enter_Box_Arg_Name_lane_Ü,
                  Arg_Any_lane_Ü,
                  CORBA.ARG_INOUT);
               --  Processing request
               CORBA.ServerRequest.Arguments
                 (Request,
                  Argument_List_Ü);
               --  Call Implementation
               RI.circuit_RI.Impl.enter_Box
                 (RI.circuit_RI.Impl.Object'Class
                    (Self.all)'Access,
                  Argument_segment_Ü,
                  Argument_speed_Ü,
                  Argument_lane_Ü);
               CORBA.NVList.Internals.Clone_Out_Args
                 (Argument_List_Ü);
            end;
         elsif (Operation_Ü
            = "leave_Box")
         then
            declare
               Argument_segment_Ü : CORBA.Long;
               pragma Warnings (Off, Argument_segment_Ü);
               Arg_CC_segment_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_segment_Ü'Unrestricted_Access);
               Arg_Any_segment_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Long,
                     Arg_CC_segment_Ü'Unchecked_Access);
               Argument_lane_Ü : CORBA.Short;
               pragma Warnings (Off, Argument_lane_Ü);
               Arg_CC_lane_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_lane_Ü'Unrestricted_Access);
               Arg_Any_lane_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Short,
                     Arg_CC_lane_Ü'Unchecked_Access);
            begin
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  leave_Box_Arg_Name_segment_Ü,
                  Arg_Any_segment_Ü,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  leave_Box_Arg_Name_lane_Ü,
                  Arg_Any_lane_Ü,
                  CORBA.ARG_INOUT);
               --  Processing request
               CORBA.ServerRequest.Arguments
                 (Request,
                  Argument_List_Ü);
               --  Call Implementation
               RI.circuit_RI.Impl.leave_Box
                 (RI.circuit_RI.Impl.Object'Class
                    (Self.all)'Access,
                  Argument_segment_Ü,
                  Argument_lane_Ü);
               CORBA.NVList.Internals.Clone_Out_Args
                 (Argument_List_Ü);
            end;
         elsif (Operation_Ü
            = "build_track")
         then
            declare
               Argument_MacroSegments_Ü : RI.StringSequence;
               pragma Warnings (Off, Argument_MacroSegments_Ü);
               Arg_CC_MacroSegments_Ü : aliased PolyORB.Any.Content'Class :=
                 RI.Helper.Internals.Wrap
                    (RI.IDL_SEQUENCE_string.Sequence
                       (Argument_MacroSegments_Ü)'Unrestricted_Access);
               Arg_Any_MacroSegments_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (RI.Helper.TC_StringSequence,
                     Arg_CC_MacroSegments_Ü'Unchecked_Access);
               Argument_MacroSegments_total_Ü : CORBA.Long;
               pragma Warnings (Off, Argument_MacroSegments_total_Ü);
               Arg_CC_MacroSegments_total_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_MacroSegments_total_Ü'Unrestricted_Access);
               Arg_Any_MacroSegments_total_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Long,
                     Arg_CC_MacroSegments_total_Ü'Unchecked_Access);
               Argument_Segments_total_Ü : CORBA.Long;
               pragma Warnings (Off, Argument_Segments_total_Ü);
               Arg_CC_Segments_total_Ü : aliased PolyORB.Any.Content'Class :=
                 CORBA.Wrap
                    (Argument_Segments_total_Ü'Unrestricted_Access);
               Arg_Any_Segments_total_Ü : constant CORBA.Any :=
                 CORBA.Internals.Get_Wrapper_Any
                    (CORBA.TC_Long,
                     Arg_CC_Segments_total_Ü'Unchecked_Access);
            begin
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  build_track_Arg_Name_MacroSegments_Ü,
                  Arg_Any_MacroSegments_Ü,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  build_track_Arg_Name_MacroSegments_total_Ü,
                  Arg_Any_MacroSegments_total_Ü,
                  CORBA.ARG_IN);
               CORBA.NVList.Add_Item
                 (Argument_List_Ü,
                  build_track_Arg_Name_Segments_total_Ü,
                  Arg_Any_Segments_total_Ü,
                  CORBA.ARG_OUT);
               --  Processing request
               CORBA.ServerRequest.Arguments
                 (Request,
                  Argument_List_Ü);
               --  Call Implementation
               RI.circuit_RI.Impl.build_track
                 (RI.circuit_RI.Impl.Object'Class
                    (Self.all)'Access,
                  Argument_MacroSegments_Ü,
                  Argument_MacroSegments_total_Ü,
                  Argument_Segments_total_Ü);
               CORBA.NVList.Internals.Clone_Out_Args
                 (Argument_List_Ü);
            end;
         elsif (Operation_Ü
            = "endRace")
         then
            --  Processing request
            CORBA.ServerRequest.Arguments
              (Request,
               Argument_List_Ü);
            --  Call Implementation
            RI.circuit_RI.Impl.endRace
              (RI.circuit_RI.Impl.Object'Class
                 (Self.all)'Access);
            CORBA.NVList.Internals.Clone_Out_Args
              (Argument_List_Ü);

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
