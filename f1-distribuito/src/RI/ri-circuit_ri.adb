-------------------------------------------------
--  This file has been generated automatically
--  by IDLAC version 2.4.0-20080521.
--
--  Do NOT hand-modify this file, as your
--  changes will be lost when you re-run the
--  IDL to Ada compiler.
-------------------------------------------------
pragma Style_Checks ("NM32766");

with RI.Helper;
with PolyORB.Requests;
with PolyORB.Any.NVList;
with PolyORB.CORBA_P.Interceptors_Hooks;
with PolyORB.CORBA_P.Exceptions;
with CORBA;
 use CORBA;
pragma Elaborate_All (CORBA);
with PolyORB.Types;

package body RI.circuit_RI is

   Result_Name_� : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("Result");

   enter_Arg_Name_�_segment : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("segment");

   enter_Arg_Name_�_speed : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("speed");

   enter_Arg_Name_�_lane : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("lane");

   procedure enter
     (Self : Ref;
      segment : CORBA.Long;
      speed : in out CORBA.Float;
      lane : in out CORBA.Short)
   is
      Arg_CC_�_segment : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (segment'Unrestricted_Access);
      Arg_Any_�_segment : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_�_segment'Unchecked_Access);
      Arg_CC_�_speed : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (speed'Unrestricted_Access);
      Arg_Any_�_speed : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Float, Arg_CC_�_speed'Unchecked_Access);
      pragma Warnings (Off, speed);
      Arg_CC_�_lane : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (lane'Unrestricted_Access);
      Arg_Any_�_lane : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_�_lane'Unchecked_Access);
      pragma Warnings (Off, lane);

      Request_� : PolyORB.Requests.Request_Access;
      Arg_List_� : PolyORB.Any.NVList.Ref;
      Result_�_NV : PolyORB.Any.NamedValue;
   begin

      if Is_Nil (Self) then
         CORBA.Raise_Inv_Objref (Default_Sys_Member);
      end if;

      --  Create argument list

      PolyORB.Any.NVList.Create
        (Arg_List_�);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_�,
         enter_Arg_Name_�_segment,
         PolyORB.Any.Any (Arg_Any_�_segment),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_�,
         enter_Arg_Name_�_speed,
         PolyORB.Any.Any (Arg_Any_�_speed),
         PolyORB.Any.ARG_INOUT);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_�,
         enter_Arg_Name_�_lane,
         PolyORB.Any.Any (Arg_Any_�_lane),
         PolyORB.Any.ARG_INOUT);

      --  Set result type (maybe void)

      Result_�_NV :=
       (Name     => Result_Name_�,
        Argument =>
         CORBA.Internals.Get_Empty_Any (CORBA.TC_Void),
         Arg_Modes => 0);

      PolyORB.Requests.Create_Request
        (Target    => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref (Self)),
         Operation => "enter",
         Arg_List  => Arg_List_�,
         Result    => Result_�_NV,
         Req       => Request_�);

      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�, PolyORB.Requests.Flags (0));
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence (Request_�);
      PolyORB.Requests.Destroy_Request (Request_�);

      --  Request has been synchronously invoked

   end enter;

   leave_Arg_Name_�_segment : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("segment");

   leave_Arg_Name_�_lane : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("lane");

   procedure leave
     (Self : Ref;
      segment : CORBA.Long;
      lane : in out CORBA.Short)
   is
      Arg_CC_�_segment : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (segment'Unrestricted_Access);
      Arg_Any_�_segment : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_�_segment'Unchecked_Access);
      Arg_CC_�_lane : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (lane'Unrestricted_Access);
      Arg_Any_�_lane : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_�_lane'Unchecked_Access);
      pragma Warnings (Off, lane);

      Request_� : PolyORB.Requests.Request_Access;
      Arg_List_� : PolyORB.Any.NVList.Ref;
      Result_�_NV : PolyORB.Any.NamedValue;
   begin

      if Is_Nil (Self) then
         CORBA.Raise_Inv_Objref (Default_Sys_Member);
      end if;

      --  Create argument list

      PolyORB.Any.NVList.Create
        (Arg_List_�);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_�,
         leave_Arg_Name_�_segment,
         PolyORB.Any.Any (Arg_Any_�_segment),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_�,
         leave_Arg_Name_�_lane,
         PolyORB.Any.Any (Arg_Any_�_lane),
         PolyORB.Any.ARG_INOUT);

      --  Set result type (maybe void)

      Result_�_NV :=
       (Name     => Result_Name_�,
        Argument =>
         CORBA.Internals.Get_Empty_Any (CORBA.TC_Void),
         Arg_Modes => 0);

      PolyORB.Requests.Create_Request
        (Target    => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref (Self)),
         Operation => "leave",
         Arg_List  => Arg_List_�,
         Result    => Result_�_NV,
         Req       => Request_�);

      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�, PolyORB.Requests.Flags (0));
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence (Request_�);
      PolyORB.Requests.Destroy_Request (Request_�);

      --  Request has been synchronously invoked

   end leave;

   enter_Box_Arg_Name_�_segment : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("segment");

   enter_Box_Arg_Name_�_speed : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("speed");

   enter_Box_Arg_Name_�_lane : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("lane");

   procedure enter_Box
     (Self : Ref;
      segment : CORBA.Long;
      speed : in out CORBA.Float;
      lane : in out CORBA.Short)
   is
      Arg_CC_�_segment : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (segment'Unrestricted_Access);
      Arg_Any_�_segment : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_�_segment'Unchecked_Access);
      Arg_CC_�_speed : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (speed'Unrestricted_Access);
      Arg_Any_�_speed : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Float, Arg_CC_�_speed'Unchecked_Access);
      pragma Warnings (Off, speed);
      Arg_CC_�_lane : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (lane'Unrestricted_Access);
      Arg_Any_�_lane : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_�_lane'Unchecked_Access);
      pragma Warnings (Off, lane);

      Request_� : PolyORB.Requests.Request_Access;
      Arg_List_� : PolyORB.Any.NVList.Ref;
      Result_�_NV : PolyORB.Any.NamedValue;
   begin

      if Is_Nil (Self) then
         CORBA.Raise_Inv_Objref (Default_Sys_Member);
      end if;

      --  Create argument list

      PolyORB.Any.NVList.Create
        (Arg_List_�);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_�,
         enter_Box_Arg_Name_�_segment,
         PolyORB.Any.Any (Arg_Any_�_segment),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_�,
         enter_Box_Arg_Name_�_speed,
         PolyORB.Any.Any (Arg_Any_�_speed),
         PolyORB.Any.ARG_INOUT);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_�,
         enter_Box_Arg_Name_�_lane,
         PolyORB.Any.Any (Arg_Any_�_lane),
         PolyORB.Any.ARG_INOUT);

      --  Set result type (maybe void)

      Result_�_NV :=
       (Name     => Result_Name_�,
        Argument =>
         CORBA.Internals.Get_Empty_Any (CORBA.TC_Void),
         Arg_Modes => 0);

      PolyORB.Requests.Create_Request
        (Target    => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref (Self)),
         Operation => "enter_Box",
         Arg_List  => Arg_List_�,
         Result    => Result_�_NV,
         Req       => Request_�);

      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�, PolyORB.Requests.Flags (0));
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence (Request_�);
      PolyORB.Requests.Destroy_Request (Request_�);

      --  Request has been synchronously invoked

   end enter_Box;

   leave_Box_Arg_Name_�_segment : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("segment");

   leave_Box_Arg_Name_�_lane : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("lane");

   procedure leave_Box
     (Self : Ref;
      segment : CORBA.Long;
      lane : in out CORBA.Short)
   is
      Arg_CC_�_segment : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (segment'Unrestricted_Access);
      Arg_Any_�_segment : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_�_segment'Unchecked_Access);
      Arg_CC_�_lane : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (lane'Unrestricted_Access);
      Arg_Any_�_lane : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_�_lane'Unchecked_Access);
      pragma Warnings (Off, lane);

      Request_� : PolyORB.Requests.Request_Access;
      Arg_List_� : PolyORB.Any.NVList.Ref;
      Result_�_NV : PolyORB.Any.NamedValue;
   begin

      if Is_Nil (Self) then
         CORBA.Raise_Inv_Objref (Default_Sys_Member);
      end if;

      --  Create argument list

      PolyORB.Any.NVList.Create
        (Arg_List_�);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_�,
         leave_Box_Arg_Name_�_segment,
         PolyORB.Any.Any (Arg_Any_�_segment),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_�,
         leave_Box_Arg_Name_�_lane,
         PolyORB.Any.Any (Arg_Any_�_lane),
         PolyORB.Any.ARG_INOUT);

      --  Set result type (maybe void)

      Result_�_NV :=
       (Name     => Result_Name_�,
        Argument =>
         CORBA.Internals.Get_Empty_Any (CORBA.TC_Void),
         Arg_Modes => 0);

      PolyORB.Requests.Create_Request
        (Target    => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref (Self)),
         Operation => "leave_Box",
         Arg_List  => Arg_List_�,
         Result    => Result_�_NV,
         Req       => Request_�);

      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�, PolyORB.Requests.Flags (0));
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence (Request_�);
      PolyORB.Requests.Destroy_Request (Request_�);

      --  Request has been synchronously invoked

   end leave_Box;

   build_track_Arg_Name_�_MacroSegments : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("MacroSegments");

   build_track_Arg_Name_�_MacroSegments_total : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("MacroSegments_total");

   build_track_Arg_Name_�_Segments_total : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("Segments_total");

   procedure build_track
     (Self : Ref;
      MacroSegments : RI.StringSequence;
      MacroSegments_total : CORBA.Long;
      Segments_total : out CORBA.Long)
   is
      Arg_CC_�_MacroSegments : aliased PolyORB.Any.Content'Class :=
         RI.Helper.Wrap (RI.IDL_SEQUENCE_string.Sequence (MacroSegments)'Unrestricted_Access);
      Arg_Any_�_MacroSegments : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (RI.Helper.TC_StringSequence, Arg_CC_�_MacroSegments'Unchecked_Access);
      Arg_CC_�_MacroSegments_total : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (MacroSegments_total'Unrestricted_Access);
      Arg_Any_�_MacroSegments_total : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_�_MacroSegments_total'Unchecked_Access);
      Arg_CC_�_Segments_total : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (Segments_total'Unrestricted_Access);
      Arg_Any_�_Segments_total : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_�_Segments_total'Unchecked_Access);
      pragma Warnings (Off, Segments_total);

      Request_� : PolyORB.Requests.Request_Access;
      Arg_List_� : PolyORB.Any.NVList.Ref;
      Result_�_NV : PolyORB.Any.NamedValue;
   begin

      if Is_Nil (Self) then
         CORBA.Raise_Inv_Objref (Default_Sys_Member);
      end if;

      --  Create argument list

      PolyORB.Any.NVList.Create
        (Arg_List_�);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_�,
         build_track_Arg_Name_�_MacroSegments,
         PolyORB.Any.Any (Arg_Any_�_MacroSegments),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_�,
         build_track_Arg_Name_�_MacroSegments_total,
         PolyORB.Any.Any (Arg_Any_�_MacroSegments_total),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_�,
         build_track_Arg_Name_�_Segments_total,
         PolyORB.Any.Any (Arg_Any_�_Segments_total),
         PolyORB.Any.ARG_OUT);

      --  Set result type (maybe void)

      Result_�_NV :=
       (Name     => Result_Name_�,
        Argument =>
         CORBA.Internals.Get_Empty_Any (CORBA.TC_Void),
         Arg_Modes => 0);

      PolyORB.Requests.Create_Request
        (Target    => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref (Self)),
         Operation => "build_track",
         Arg_List  => Arg_List_�,
         Result    => Result_�_NV,
         Req       => Request_�);

      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�, PolyORB.Requests.Flags (0));
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence (Request_�);
      PolyORB.Requests.Destroy_Request (Request_�);

      --  Request has been synchronously invoked

   end build_track;

   procedure endRace
     (Self : Ref)
   is

      Request_� : PolyORB.Requests.Request_Access;
      Arg_List_� : PolyORB.Any.NVList.Ref;
      Result_�_NV : PolyORB.Any.NamedValue;
   begin

      if Is_Nil (Self) then
         CORBA.Raise_Inv_Objref (Default_Sys_Member);
      end if;

      --  Create argument list

      PolyORB.Any.NVList.Create
        (Arg_List_�);

      --  Set result type (maybe void)

      Result_�_NV :=
       (Name     => Result_Name_�,
        Argument =>
         CORBA.Internals.Get_Empty_Any (CORBA.TC_Void),
         Arg_Modes => 0);

      PolyORB.Requests.Create_Request
        (Target    => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref (Self)),
         Operation => "endRace",
         Arg_List  => Arg_List_�,
         Result    => Result_�_NV,
         Req       => Request_�,
         Req_Flags => PolyORB.Requests.Sync_With_Transport);

      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�, PolyORB.Requests.Flags (0));
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence (Request_�);
      PolyORB.Requests.Destroy_Request (Request_�);
   end endRace;

   --  The visible Is_A object reference
   --  operation (a dispatching operation
   --  of all object reference types).

   function Is_A
     (Self : Ref;
      Logical_Type_Id : PolyORB.Std.String)
     return CORBA.Boolean
   is
   begin
      return False
         --  Locally check class membership for this interface

        or else Is_A (Logical_Type_Id)
         --  Fall back to a remote membership check (may involve
         --  an actual request invocation on Self).

           or else CORBA.Object.Is_A
                    (CORBA.Object.Ref (Self), Logical_Type_Id);

   end Is_A;

   --  The internal Is_A implementation for
   --  this interface.

   function Is_A
     (Logical_Type_Id : PolyORB.Std.String)
     return CORBA.Boolean
   is
   begin
      return CORBA.Is_Equivalent
        (Logical_Type_Id,
         RI.circuit_RI.Repository_Id)
        or else CORBA.Is_Equivalent
          (Logical_Type_Id,
           "IDL:omg.org/CORBA/Object:1.0")
        or else False;

   end Is_A;

end RI.circuit_RI;
