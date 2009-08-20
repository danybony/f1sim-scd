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

   enter_Arg_Name_segment_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("segment");

   enter_Arg_Name_speed_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("speed");

   enter_Arg_Name_lane_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("lane");

   enter_Result_Name_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   --------------------
   -- enter_Result_Ü --
   --------------------

   function enter_Result_Ü return PolyORB.Any.NamedValue is
      pragma Inline (enter_Result_Ü);
   begin
      return (Name => enter_Result_Name_Ü,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end enter_Result_Ü;

   -----------
   -- enter --
   -----------

   procedure enter
     (Self : Ref;
      segment : CORBA.Long;
      speed : in out CORBA.Float;
      lane : in out CORBA.Short)
   is
      Argument_List_Ü : PolyORB.Any.NVList.Ref;
      Arg_CC_segment_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (segment'Unrestricted_Access);
      Arg_Any_segment_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_segment_Ü'Unchecked_Access);
      Arg_CC_speed_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (speed'Unrestricted_Access);
      Arg_Any_speed_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Float,
            Arg_CC_speed_Ü'Unchecked_Access);
      Arg_CC_lane_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (lane'Unrestricted_Access);
      Arg_Any_lane_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Short,
            Arg_CC_lane_Ü'Unchecked_Access);
      Request_Ü : PolyORB.Requests.Request_Access;
      Result_Nv_Ü : PolyORB.Any.NamedValue :=
        enter_Result_Ü;
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
        (Argument_List_Ü);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         enter_Arg_Name_segment_Ü,
         PolyORB.Any.Any
           (Arg_Any_segment_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         enter_Arg_Name_speed_Ü,
         PolyORB.Any.Any
           (Arg_Any_speed_Ü),
         PolyORB.Any.ARG_INOUT);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         enter_Arg_Name_lane_Ü,
         PolyORB.Any.Any
           (Arg_Any_lane_Ü),
         PolyORB.Any.ARG_INOUT);
      --  Creating the request
      PolyORB.Requests.Create_Request
        (Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "enter",
         Arg_List => Argument_List_Ü,
         Result => Result_Nv_Ü,
         Req => Request_Ü);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_Ü);
      PolyORB.Requests.Destroy_Request
        (Request_Ü);
   end enter;

   leave_Arg_Name_segment_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("segment");

   leave_Arg_Name_lane_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("lane");

   leave_Result_Name_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   --------------------
   -- leave_Result_Ü --
   --------------------

   function leave_Result_Ü return PolyORB.Any.NamedValue is
      pragma Inline (leave_Result_Ü);
   begin
      return (Name => leave_Result_Name_Ü,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end leave_Result_Ü;

   -----------
   -- leave --
   -----------

   procedure leave
     (Self : Ref;
      segment : CORBA.Long;
      lane : in out CORBA.Short)
   is
      Argument_List_Ü : PolyORB.Any.NVList.Ref;
      Arg_CC_segment_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (segment'Unrestricted_Access);
      Arg_Any_segment_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_segment_Ü'Unchecked_Access);
      Arg_CC_lane_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (lane'Unrestricted_Access);
      Arg_Any_lane_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Short,
            Arg_CC_lane_Ü'Unchecked_Access);
      Request_Ü : PolyORB.Requests.Request_Access;
      Result_Nv_Ü : PolyORB.Any.NamedValue :=
        leave_Result_Ü;
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
        (Argument_List_Ü);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         leave_Arg_Name_segment_Ü,
         PolyORB.Any.Any
           (Arg_Any_segment_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         leave_Arg_Name_lane_Ü,
         PolyORB.Any.Any
           (Arg_Any_lane_Ü),
         PolyORB.Any.ARG_INOUT);
      --  Creating the request
      PolyORB.Requests.Create_Request
        (Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "leave",
         Arg_List => Argument_List_Ü,
         Result => Result_Nv_Ü,
         Req => Request_Ü);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_Ü);
      PolyORB.Requests.Destroy_Request
        (Request_Ü);
   end leave;

   enter_Box_Arg_Name_segment_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("segment");

   enter_Box_Arg_Name_speed_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("speed");

   enter_Box_Arg_Name_lane_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("lane");

   enter_Box_Result_Name_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   ------------------------
   -- enter_Box_Result_Ü --
   ------------------------

   function enter_Box_Result_Ü return PolyORB.Any.NamedValue is
      pragma Inline (enter_Box_Result_Ü);
   begin
      return (Name => enter_Box_Result_Name_Ü,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end enter_Box_Result_Ü;

   ---------------
   -- enter_Box --
   ---------------

   procedure enter_Box
     (Self : Ref;
      segment : CORBA.Long;
      speed : in out CORBA.Float;
      lane : in out CORBA.Short)
   is
      Argument_List_Ü : PolyORB.Any.NVList.Ref;
      Arg_CC_segment_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (segment'Unrestricted_Access);
      Arg_Any_segment_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_segment_Ü'Unchecked_Access);
      Arg_CC_speed_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (speed'Unrestricted_Access);
      Arg_Any_speed_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Float,
            Arg_CC_speed_Ü'Unchecked_Access);
      Arg_CC_lane_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (lane'Unrestricted_Access);
      Arg_Any_lane_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Short,
            Arg_CC_lane_Ü'Unchecked_Access);
      Request_Ü : PolyORB.Requests.Request_Access;
      Result_Nv_Ü : PolyORB.Any.NamedValue :=
        enter_Box_Result_Ü;
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
        (Argument_List_Ü);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         enter_Box_Arg_Name_segment_Ü,
         PolyORB.Any.Any
           (Arg_Any_segment_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         enter_Box_Arg_Name_speed_Ü,
         PolyORB.Any.Any
           (Arg_Any_speed_Ü),
         PolyORB.Any.ARG_INOUT);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         enter_Box_Arg_Name_lane_Ü,
         PolyORB.Any.Any
           (Arg_Any_lane_Ü),
         PolyORB.Any.ARG_INOUT);
      --  Creating the request
      PolyORB.Requests.Create_Request
        (Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "enter_Box",
         Arg_List => Argument_List_Ü,
         Result => Result_Nv_Ü,
         Req => Request_Ü);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_Ü);
      PolyORB.Requests.Destroy_Request
        (Request_Ü);
   end enter_Box;

   leave_Box_Arg_Name_segment_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("segment");

   leave_Box_Arg_Name_lane_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("lane");

   leave_Box_Result_Name_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   ------------------------
   -- leave_Box_Result_Ü --
   ------------------------

   function leave_Box_Result_Ü return PolyORB.Any.NamedValue is
      pragma Inline (leave_Box_Result_Ü);
   begin
      return (Name => leave_Box_Result_Name_Ü,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end leave_Box_Result_Ü;

   ---------------
   -- leave_Box --
   ---------------

   procedure leave_Box
     (Self : Ref;
      segment : CORBA.Long;
      lane : in out CORBA.Short)
   is
      Argument_List_Ü : PolyORB.Any.NVList.Ref;
      Arg_CC_segment_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (segment'Unrestricted_Access);
      Arg_Any_segment_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_segment_Ü'Unchecked_Access);
      Arg_CC_lane_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (lane'Unrestricted_Access);
      Arg_Any_lane_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Short,
            Arg_CC_lane_Ü'Unchecked_Access);
      Request_Ü : PolyORB.Requests.Request_Access;
      Result_Nv_Ü : PolyORB.Any.NamedValue :=
        leave_Box_Result_Ü;
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
        (Argument_List_Ü);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         leave_Box_Arg_Name_segment_Ü,
         PolyORB.Any.Any
           (Arg_Any_segment_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         leave_Box_Arg_Name_lane_Ü,
         PolyORB.Any.Any
           (Arg_Any_lane_Ü),
         PolyORB.Any.ARG_INOUT);
      --  Creating the request
      PolyORB.Requests.Create_Request
        (Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "leave_Box",
         Arg_List => Argument_List_Ü,
         Result => Result_Nv_Ü,
         Req => Request_Ü);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_Ü);
      PolyORB.Requests.Destroy_Request
        (Request_Ü);
   end leave_Box;

   build_track_Arg_Name_MacroSegments_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("MacroSegments");

   build_track_Arg_Name_MacroSegments_total_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("MacroSegments_total");

   build_track_Arg_Name_Segments_total_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Segments_total");

   build_track_Result_Name_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   --------------------------
   -- build_track_Result_Ü --
   --------------------------

   function build_track_Result_Ü return PolyORB.Any.NamedValue is
      pragma Inline (build_track_Result_Ü);
   begin
      return (Name => build_track_Result_Name_Ü,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end build_track_Result_Ü;

   -----------------
   -- build_track --
   -----------------

   procedure build_track
     (Self : Ref;
      MacroSegments : RI.StringSequence;
      MacroSegments_total : CORBA.Long;
      Segments_total : out CORBA.Long)
   is
      Argument_List_Ü : PolyORB.Any.NVList.Ref;
      Arg_CC_MacroSegments_Ü : aliased PolyORB.Any.Content'Class :=
        RI.Helper.Internals.Wrap
           (RI.IDL_SEQUENCE_string.Sequence
              (MacroSegments)'Unrestricted_Access);
      Arg_Any_MacroSegments_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (RI.Helper.TC_StringSequence,
            Arg_CC_MacroSegments_Ü'Unchecked_Access);
      Arg_CC_MacroSegments_total_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (MacroSegments_total'Unrestricted_Access);
      Arg_Any_MacroSegments_total_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_MacroSegments_total_Ü'Unchecked_Access);
      Arg_CC_Segments_total_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (Segments_total'Unrestricted_Access);
      Arg_Any_Segments_total_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_Segments_total_Ü'Unchecked_Access);
      pragma Warnings (Off, Segments_total);
      Request_Ü : PolyORB.Requests.Request_Access;
      Result_Nv_Ü : PolyORB.Any.NamedValue :=
        build_track_Result_Ü;
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
        (Argument_List_Ü);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         build_track_Arg_Name_MacroSegments_Ü,
         PolyORB.Any.Any
           (Arg_Any_MacroSegments_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         build_track_Arg_Name_MacroSegments_total_Ü,
         PolyORB.Any.Any
           (Arg_Any_MacroSegments_total_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         build_track_Arg_Name_Segments_total_Ü,
         PolyORB.Any.Any
           (Arg_Any_Segments_total_Ü),
         PolyORB.Any.ARG_OUT);
      --  Creating the request
      PolyORB.Requests.Create_Request
        (Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "build_track",
         Arg_List => Argument_List_Ü,
         Result => Result_Nv_Ü,
         Req => Request_Ü);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_Ü);
      PolyORB.Requests.Destroy_Request
        (Request_Ü);
   end build_track;

   endRace_Result_Name_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   ----------------------
   -- endRace_Result_Ü --
   ----------------------

   function endRace_Result_Ü return PolyORB.Any.NamedValue is
      pragma Inline (endRace_Result_Ü);
   begin
      return (Name => endRace_Result_Name_Ü,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end endRace_Result_Ü;

   -------------
   -- endRace --
   -------------

   procedure endRace
     (Self : Ref)
   is
      Argument_List_Ü : PolyORB.Any.NVList.Ref;
      Request_Ü : PolyORB.Requests.Request_Access;
      Result_Nv_Ü : PolyORB.Any.NamedValue :=
        endRace_Result_Ü;
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
        (Argument_List_Ü);
      --  Creating the request
      PolyORB.Requests.Create_Request
        (Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "endRace",
         Arg_List => Argument_List_Ü,
         Result => Result_Nv_Ü,
         Req => Request_Ü,
         Req_Flags => PolyORB.Requests.Sync_With_Transport);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_Ü);
      PolyORB.Requests.Destroy_Request
        (Request_Ü);
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
