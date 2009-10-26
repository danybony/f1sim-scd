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
with PolyORB.Any.NVList;
with PolyORB.Types;
with PolyORB.Any;
with PolyORB.Requests;
with PolyORB.CORBA_P.Interceptors_Hooks;
with PolyORB.CORBA_P.Exceptions;
with RI.Helper;

package body RI.circuit_RI is

   enter_Arg_Name_segment_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("segment");

   enter_Arg_Name_speed_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("speed");

   enter_Arg_Name_lane_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("lane");

   enter_Result_Name_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   --------------------
   -- enter_Result_� --
   --------------------

   function enter_Result_� return PolyORB.Any.NamedValue is
      pragma Inline (enter_Result_�);
   begin
      return (Name => enter_Result_Name_�,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end enter_Result_�;

   -----------
   -- enter --
   -----------

   procedure enter
     (Self : Ref;
      segment : CORBA.Long;
      speed : in out CORBA.Float;
      lane : in out CORBA.Short)
   is
      Argument_List_� : PolyORB.Any.NVList.Ref;
      Arg_CC_segment_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (segment'Unrestricted_Access);
      Arg_Any_segment_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_segment_�'Unchecked_Access);
      Arg_CC_speed_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (speed'Unrestricted_Access);
      Arg_Any_speed_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Float,
            Arg_CC_speed_�'Unchecked_Access);
      Arg_CC_lane_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (lane'Unrestricted_Access);
      Arg_Any_lane_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Short,
            Arg_CC_lane_�'Unchecked_Access);
      Request_� : PolyORB.Requests.Request_Access;
      Result_Nv_� : PolyORB.Any.NamedValue :=
        enter_Result_�;
   begin
      if CORBA.Object.Is_Nil
        (CORBA.Object.Ref
           (Self))
      then
         CORBA.Raise_Inv_Objref
           (CORBA.Default_Sys_Member);
      end if;
      --  Create the Argument list
      PolyORB.Any.NVList.Create
        (Argument_List_�);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         enter_Arg_Name_segment_�,
         PolyORB.Any.Any
           (Arg_Any_segment_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         enter_Arg_Name_speed_�,
         PolyORB.Any.Any
           (Arg_Any_speed_�),
         PolyORB.Any.ARG_INOUT);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         enter_Arg_Name_lane_�,
         PolyORB.Any.Any
           (Arg_Any_lane_�),
         PolyORB.Any.ARG_INOUT);
      --  Creating the request
      PolyORB.Requests.Create_Request
        (Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "enter",
         Arg_List => Argument_List_�,
         Result => Result_Nv_�,
         Req => Request_�);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_�);
      PolyORB.Requests.Destroy_Request
        (Request_�);
   end enter;

   leave_Arg_Name_segment_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("segment");

   leave_Arg_Name_lane_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("lane");

   leave_Result_Name_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   --------------------
   -- leave_Result_� --
   --------------------

   function leave_Result_� return PolyORB.Any.NamedValue is
      pragma Inline (leave_Result_�);
   begin
      return (Name => leave_Result_Name_�,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end leave_Result_�;

   -----------
   -- leave --
   -----------

   procedure leave
     (Self : Ref;
      segment : CORBA.Long;
      lane : in out CORBA.Short)
   is
      Argument_List_� : PolyORB.Any.NVList.Ref;
      Arg_CC_segment_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (segment'Unrestricted_Access);
      Arg_Any_segment_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_segment_�'Unchecked_Access);
      Arg_CC_lane_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (lane'Unrestricted_Access);
      Arg_Any_lane_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Short,
            Arg_CC_lane_�'Unchecked_Access);
      Request_� : PolyORB.Requests.Request_Access;
      Result_Nv_� : PolyORB.Any.NamedValue :=
        leave_Result_�;
   begin
      if CORBA.Object.Is_Nil
        (CORBA.Object.Ref
           (Self))
      then
         CORBA.Raise_Inv_Objref
           (CORBA.Default_Sys_Member);
      end if;
      --  Create the Argument list
      PolyORB.Any.NVList.Create
        (Argument_List_�);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         leave_Arg_Name_segment_�,
         PolyORB.Any.Any
           (Arg_Any_segment_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         leave_Arg_Name_lane_�,
         PolyORB.Any.Any
           (Arg_Any_lane_�),
         PolyORB.Any.ARG_INOUT);
      --  Creating the request
      PolyORB.Requests.Create_Request
        (Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "leave",
         Arg_List => Argument_List_�,
         Result => Result_Nv_�,
         Req => Request_�);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_�);
      PolyORB.Requests.Destroy_Request
        (Request_�);
   end leave;

   enter_Box_Arg_Name_segment_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("segment");

   enter_Box_Arg_Name_speed_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("speed");

   enter_Box_Arg_Name_lane_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("lane");

   enter_Box_Result_Name_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   ------------------------
   -- enter_Box_Result_� --
   ------------------------

   function enter_Box_Result_� return PolyORB.Any.NamedValue is
      pragma Inline (enter_Box_Result_�);
   begin
      return (Name => enter_Box_Result_Name_�,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end enter_Box_Result_�;

   ---------------
   -- enter_Box --
   ---------------

   procedure enter_Box
     (Self : Ref;
      segment : CORBA.Long;
      speed : in out CORBA.Float;
      lane : in out CORBA.Short)
   is
      Argument_List_� : PolyORB.Any.NVList.Ref;
      Arg_CC_segment_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (segment'Unrestricted_Access);
      Arg_Any_segment_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_segment_�'Unchecked_Access);
      Arg_CC_speed_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (speed'Unrestricted_Access);
      Arg_Any_speed_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Float,
            Arg_CC_speed_�'Unchecked_Access);
      Arg_CC_lane_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (lane'Unrestricted_Access);
      Arg_Any_lane_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Short,
            Arg_CC_lane_�'Unchecked_Access);
      Request_� : PolyORB.Requests.Request_Access;
      Result_Nv_� : PolyORB.Any.NamedValue :=
        enter_Box_Result_�;
   begin
      if CORBA.Object.Is_Nil
        (CORBA.Object.Ref
           (Self))
      then
         CORBA.Raise_Inv_Objref
           (CORBA.Default_Sys_Member);
      end if;
      --  Create the Argument list
      PolyORB.Any.NVList.Create
        (Argument_List_�);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         enter_Box_Arg_Name_segment_�,
         PolyORB.Any.Any
           (Arg_Any_segment_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         enter_Box_Arg_Name_speed_�,
         PolyORB.Any.Any
           (Arg_Any_speed_�),
         PolyORB.Any.ARG_INOUT);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         enter_Box_Arg_Name_lane_�,
         PolyORB.Any.Any
           (Arg_Any_lane_�),
         PolyORB.Any.ARG_INOUT);
      --  Creating the request
      PolyORB.Requests.Create_Request
        (Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "enter_Box",
         Arg_List => Argument_List_�,
         Result => Result_Nv_�,
         Req => Request_�);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_�);
      PolyORB.Requests.Destroy_Request
        (Request_�);
   end enter_Box;

   leave_Box_Arg_Name_segment_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("segment");

   leave_Box_Arg_Name_lane_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("lane");

   leave_Box_Result_Name_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   ------------------------
   -- leave_Box_Result_� --
   ------------------------

   function leave_Box_Result_� return PolyORB.Any.NamedValue is
      pragma Inline (leave_Box_Result_�);
   begin
      return (Name => leave_Box_Result_Name_�,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end leave_Box_Result_�;

   ---------------
   -- leave_Box --
   ---------------

   procedure leave_Box
     (Self : Ref;
      segment : CORBA.Long;
      lane : in out CORBA.Short)
   is
      Argument_List_� : PolyORB.Any.NVList.Ref;
      Arg_CC_segment_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (segment'Unrestricted_Access);
      Arg_Any_segment_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_segment_�'Unchecked_Access);
      Arg_CC_lane_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (lane'Unrestricted_Access);
      Arg_Any_lane_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Short,
            Arg_CC_lane_�'Unchecked_Access);
      Request_� : PolyORB.Requests.Request_Access;
      Result_Nv_� : PolyORB.Any.NamedValue :=
        leave_Box_Result_�;
   begin
      if CORBA.Object.Is_Nil
        (CORBA.Object.Ref
           (Self))
      then
         CORBA.Raise_Inv_Objref
           (CORBA.Default_Sys_Member);
      end if;
      --  Create the Argument list
      PolyORB.Any.NVList.Create
        (Argument_List_�);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         leave_Box_Arg_Name_segment_�,
         PolyORB.Any.Any
           (Arg_Any_segment_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         leave_Box_Arg_Name_lane_�,
         PolyORB.Any.Any
           (Arg_Any_lane_�),
         PolyORB.Any.ARG_INOUT);
      --  Creating the request
      PolyORB.Requests.Create_Request
        (Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "leave_Box",
         Arg_List => Argument_List_�,
         Result => Result_Nv_�,
         Req => Request_�);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_�);
      PolyORB.Requests.Destroy_Request
        (Request_�);
   end leave_Box;

   build_track_Arg_Name_MacroSegments_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("MacroSegments");

   build_track_Arg_Name_MacroSegments_total_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("MacroSegments_total");

   build_track_Arg_Name_Segments_total_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Segments_total");

   build_track_Result_Name_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   --------------------------
   -- build_track_Result_� --
   --------------------------

   function build_track_Result_� return PolyORB.Any.NamedValue is
      pragma Inline (build_track_Result_�);
   begin
      return (Name => build_track_Result_Name_�,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end build_track_Result_�;

   -----------------
   -- build_track --
   -----------------

   procedure build_track
     (Self : Ref;
      MacroSegments : RI.StringSequence;
      MacroSegments_total : CORBA.Long;
      Segments_total : out CORBA.Long)
   is
      Argument_List_� : PolyORB.Any.NVList.Ref;
      Arg_CC_MacroSegments_� : aliased PolyORB.Any.Content'Class :=
        RI.Helper.Internals.Wrap
           (RI.IDL_SEQUENCE_string.Sequence
              (MacroSegments)'Unrestricted_Access);
      Arg_Any_MacroSegments_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (RI.Helper.TC_StringSequence,
            Arg_CC_MacroSegments_�'Unchecked_Access);
      Arg_CC_MacroSegments_total_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (MacroSegments_total'Unrestricted_Access);
      Arg_Any_MacroSegments_total_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_MacroSegments_total_�'Unchecked_Access);
      Arg_CC_Segments_total_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (Segments_total'Unrestricted_Access);
      Arg_Any_Segments_total_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_Segments_total_�'Unchecked_Access);
      pragma Warnings (Off, Segments_total);
      Request_� : PolyORB.Requests.Request_Access;
      Result_Nv_� : PolyORB.Any.NamedValue :=
        build_track_Result_�;
   begin
      if CORBA.Object.Is_Nil
        (CORBA.Object.Ref
           (Self))
      then
         CORBA.Raise_Inv_Objref
           (CORBA.Default_Sys_Member);
      end if;
      --  Create the Argument list
      PolyORB.Any.NVList.Create
        (Argument_List_�);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         build_track_Arg_Name_MacroSegments_�,
         PolyORB.Any.Any
           (Arg_Any_MacroSegments_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         build_track_Arg_Name_MacroSegments_total_�,
         PolyORB.Any.Any
           (Arg_Any_MacroSegments_total_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         build_track_Arg_Name_Segments_total_�,
         PolyORB.Any.Any
           (Arg_Any_Segments_total_�),
         PolyORB.Any.ARG_OUT);
      --  Creating the request
      PolyORB.Requests.Create_Request
        (Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "build_track",
         Arg_List => Argument_List_�,
         Result => Result_Nv_�,
         Req => Request_�);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_�);
      PolyORB.Requests.Destroy_Request
        (Request_�);
   end build_track;

   endRace_Result_Name_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   ----------------------
   -- endRace_Result_� --
   ----------------------

   function endRace_Result_� return PolyORB.Any.NamedValue is
      pragma Inline (endRace_Result_�);
   begin
      return (Name => endRace_Result_Name_�,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end endRace_Result_�;

   -------------
   -- endRace --
   -------------

   procedure endRace
     (Self : Ref)
   is
      Argument_List_� : PolyORB.Any.NVList.Ref;
      Request_� : PolyORB.Requests.Request_Access;
      Result_Nv_� : PolyORB.Any.NamedValue :=
        endRace_Result_�;
   begin
      if CORBA.Object.Is_Nil
        (CORBA.Object.Ref
           (Self))
      then
         CORBA.Raise_Inv_Objref
           (CORBA.Default_Sys_Member);
      end if;
      --  Create the Argument list
      PolyORB.Any.NVList.Create
        (Argument_List_�);
      --  Creating the request
      PolyORB.Requests.Create_Request
        (Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "endRace",
         Arg_List => Argument_List_�,
         Result => Result_Nv_�,
         Req => Request_�,
         Req_Flags => PolyORB.Requests.Sync_With_Transport);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_�);
      PolyORB.Requests.Destroy_Request
        (Request_�);
   end endRace;

   ----------
   -- Is_A --
   ----------

   function Is_A
     (Self : Ref;
      Logical_Type_Id : PolyORB.Std.String)
     return CORBA.Boolean
   is
   begin
      return (False
         or else (Is_A
           (Logical_Type_Id)
            or else CORBA.Object.Is_A
              (CORBA.Object.Ref
                 (Self),
               Logical_Type_Id)));
   end Is_A;

   ----------
   -- Is_A --
   ----------

   function Is_A
     (Logical_Type_Id : PolyORB.Std.String)
     return CORBA.Boolean
   is
   begin
      return ((CORBA.Is_Equivalent
        (Logical_Type_Id,
         RI.circuit_RI.Repository_Id)
         or else CORBA.Is_Equivalent
           (Logical_Type_Id,
            "IDL:omg.org/CORBA/Object:1.0"))
         or else False);
   end Is_A;

end RI.circuit_RI;
