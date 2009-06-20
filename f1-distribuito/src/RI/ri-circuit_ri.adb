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

   Result_Name_Ü : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("Result");

   enter_Arg_Name_Ü_segment : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("segment");

   enter_Arg_Name_Ü_speed : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("speed");

   enter_Arg_Name_Ü_lane : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("lane");

   procedure enter
     (Self : Ref;
      segment : CORBA.Long;
      speed : in out CORBA.Float;
      lane : in out CORBA.Short)
   is
      Arg_CC_Ü_segment : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (segment'Unrestricted_Access);
      Arg_Any_Ü_segment : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_Ü_segment'Unchecked_Access);
      Arg_CC_Ü_speed : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (speed'Unrestricted_Access);
      Arg_Any_Ü_speed : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Float, Arg_CC_Ü_speed'Unchecked_Access);
      pragma Warnings (Off, speed);
      Arg_CC_Ü_lane : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (lane'Unrestricted_Access);
      Arg_Any_Ü_lane : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_Ü_lane'Unchecked_Access);
      pragma Warnings (Off, lane);

      Request_Ü : PolyORB.Requests.Request_Access;
      Arg_List_Ü : PolyORB.Any.NVList.Ref;
      Result_Ü_NV : PolyORB.Any.NamedValue;
   begin

      if Is_Nil (Self) then
         CORBA.Raise_Inv_Objref (Default_Sys_Member);
      end if;

      --  Create argument list

      PolyORB.Any.NVList.Create
        (Arg_List_Ü);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_Ü,
         enter_Arg_Name_Ü_segment,
         PolyORB.Any.Any (Arg_Any_Ü_segment),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_Ü,
         enter_Arg_Name_Ü_speed,
         PolyORB.Any.Any (Arg_Any_Ü_speed),
         PolyORB.Any.ARG_INOUT);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_Ü,
         enter_Arg_Name_Ü_lane,
         PolyORB.Any.Any (Arg_Any_Ü_lane),
         PolyORB.Any.ARG_INOUT);

      --  Set result type (maybe void)

      Result_Ü_NV :=
       (Name     => Result_Name_Ü,
        Argument =>
         CORBA.Internals.Get_Empty_Any (CORBA.TC_Void),
         Arg_Modes => 0);

      PolyORB.Requests.Create_Request
        (Target    => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref (Self)),
         Operation => "enter",
         Arg_List  => Arg_List_Ü,
         Result    => Result_Ü_NV,
         Req       => Request_Ü);

      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü, PolyORB.Requests.Flags (0));
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence (Request_Ü);
      PolyORB.Requests.Destroy_Request (Request_Ü);

      --  Request has been synchronously invoked

   end enter;

   leave_Arg_Name_Ü_segment : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("segment");

   leave_Arg_Name_Ü_lane : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("lane");

   procedure leave
     (Self : Ref;
      segment : CORBA.Long;
      lane : in out CORBA.Short)
   is
      Arg_CC_Ü_segment : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (segment'Unrestricted_Access);
      Arg_Any_Ü_segment : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_Ü_segment'Unchecked_Access);
      Arg_CC_Ü_lane : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (lane'Unrestricted_Access);
      Arg_Any_Ü_lane : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_Ü_lane'Unchecked_Access);
      pragma Warnings (Off, lane);

      Request_Ü : PolyORB.Requests.Request_Access;
      Arg_List_Ü : PolyORB.Any.NVList.Ref;
      Result_Ü_NV : PolyORB.Any.NamedValue;
   begin

      if Is_Nil (Self) then
         CORBA.Raise_Inv_Objref (Default_Sys_Member);
      end if;

      --  Create argument list

      PolyORB.Any.NVList.Create
        (Arg_List_Ü);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_Ü,
         leave_Arg_Name_Ü_segment,
         PolyORB.Any.Any (Arg_Any_Ü_segment),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_Ü,
         leave_Arg_Name_Ü_lane,
         PolyORB.Any.Any (Arg_Any_Ü_lane),
         PolyORB.Any.ARG_INOUT);

      --  Set result type (maybe void)

      Result_Ü_NV :=
       (Name     => Result_Name_Ü,
        Argument =>
         CORBA.Internals.Get_Empty_Any (CORBA.TC_Void),
         Arg_Modes => 0);

      PolyORB.Requests.Create_Request
        (Target    => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref (Self)),
         Operation => "leave",
         Arg_List  => Arg_List_Ü,
         Result    => Result_Ü_NV,
         Req       => Request_Ü);

      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü, PolyORB.Requests.Flags (0));
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence (Request_Ü);
      PolyORB.Requests.Destroy_Request (Request_Ü);

      --  Request has been synchronously invoked

   end leave;

   enter_Box_Arg_Name_Ü_segment : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("segment");

   enter_Box_Arg_Name_Ü_speed : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("speed");

   enter_Box_Arg_Name_Ü_lane : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("lane");

   procedure enter_Box
     (Self : Ref;
      segment : CORBA.Long;
      speed : in out CORBA.Float;
      lane : in out CORBA.Short)
   is
      Arg_CC_Ü_segment : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (segment'Unrestricted_Access);
      Arg_Any_Ü_segment : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_Ü_segment'Unchecked_Access);
      Arg_CC_Ü_speed : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (speed'Unrestricted_Access);
      Arg_Any_Ü_speed : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Float, Arg_CC_Ü_speed'Unchecked_Access);
      pragma Warnings (Off, speed);
      Arg_CC_Ü_lane : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (lane'Unrestricted_Access);
      Arg_Any_Ü_lane : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_Ü_lane'Unchecked_Access);
      pragma Warnings (Off, lane);

      Request_Ü : PolyORB.Requests.Request_Access;
      Arg_List_Ü : PolyORB.Any.NVList.Ref;
      Result_Ü_NV : PolyORB.Any.NamedValue;
   begin

      if Is_Nil (Self) then
         CORBA.Raise_Inv_Objref (Default_Sys_Member);
      end if;

      --  Create argument list

      PolyORB.Any.NVList.Create
        (Arg_List_Ü);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_Ü,
         enter_Box_Arg_Name_Ü_segment,
         PolyORB.Any.Any (Arg_Any_Ü_segment),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_Ü,
         enter_Box_Arg_Name_Ü_speed,
         PolyORB.Any.Any (Arg_Any_Ü_speed),
         PolyORB.Any.ARG_INOUT);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_Ü,
         enter_Box_Arg_Name_Ü_lane,
         PolyORB.Any.Any (Arg_Any_Ü_lane),
         PolyORB.Any.ARG_INOUT);

      --  Set result type (maybe void)

      Result_Ü_NV :=
       (Name     => Result_Name_Ü,
        Argument =>
         CORBA.Internals.Get_Empty_Any (CORBA.TC_Void),
         Arg_Modes => 0);

      PolyORB.Requests.Create_Request
        (Target    => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref (Self)),
         Operation => "enter_Box",
         Arg_List  => Arg_List_Ü,
         Result    => Result_Ü_NV,
         Req       => Request_Ü);

      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü, PolyORB.Requests.Flags (0));
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence (Request_Ü);
      PolyORB.Requests.Destroy_Request (Request_Ü);

      --  Request has been synchronously invoked

   end enter_Box;

   leave_Box_Arg_Name_Ü_segment : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("segment");

   leave_Box_Arg_Name_Ü_lane : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("lane");

   procedure leave_Box
     (Self : Ref;
      segment : CORBA.Long;
      lane : in out CORBA.Short)
   is
      Arg_CC_Ü_segment : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (segment'Unrestricted_Access);
      Arg_Any_Ü_segment : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_Ü_segment'Unchecked_Access);
      Arg_CC_Ü_lane : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (lane'Unrestricted_Access);
      Arg_Any_Ü_lane : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_Ü_lane'Unchecked_Access);
      pragma Warnings (Off, lane);

      Request_Ü : PolyORB.Requests.Request_Access;
      Arg_List_Ü : PolyORB.Any.NVList.Ref;
      Result_Ü_NV : PolyORB.Any.NamedValue;
   begin

      if Is_Nil (Self) then
         CORBA.Raise_Inv_Objref (Default_Sys_Member);
      end if;

      --  Create argument list

      PolyORB.Any.NVList.Create
        (Arg_List_Ü);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_Ü,
         leave_Box_Arg_Name_Ü_segment,
         PolyORB.Any.Any (Arg_Any_Ü_segment),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_Ü,
         leave_Box_Arg_Name_Ü_lane,
         PolyORB.Any.Any (Arg_Any_Ü_lane),
         PolyORB.Any.ARG_INOUT);

      --  Set result type (maybe void)

      Result_Ü_NV :=
       (Name     => Result_Name_Ü,
        Argument =>
         CORBA.Internals.Get_Empty_Any (CORBA.TC_Void),
         Arg_Modes => 0);

      PolyORB.Requests.Create_Request
        (Target    => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref (Self)),
         Operation => "leave_Box",
         Arg_List  => Arg_List_Ü,
         Result    => Result_Ü_NV,
         Req       => Request_Ü);

      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü, PolyORB.Requests.Flags (0));
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence (Request_Ü);
      PolyORB.Requests.Destroy_Request (Request_Ü);

      --  Request has been synchronously invoked

   end leave_Box;

   build_track_Arg_Name_Ü_MacroSegments : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("MacroSegments");

   build_track_Arg_Name_Ü_MacroSegments_total : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("MacroSegments_total");

   build_track_Arg_Name_Ü_Segments_total : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("Segments_total");

   procedure build_track
     (Self : Ref;
      MacroSegments : RI.StringSequence;
      MacroSegments_total : CORBA.Long;
      Segments_total : out CORBA.Long)
   is
      Arg_CC_Ü_MacroSegments : aliased PolyORB.Any.Content'Class :=
         RI.Helper.Wrap (RI.IDL_SEQUENCE_string.Sequence (MacroSegments)'Unrestricted_Access);
      Arg_Any_Ü_MacroSegments : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (RI.Helper.TC_StringSequence, Arg_CC_Ü_MacroSegments'Unchecked_Access);
      Arg_CC_Ü_MacroSegments_total : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (MacroSegments_total'Unrestricted_Access);
      Arg_Any_Ü_MacroSegments_total : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_Ü_MacroSegments_total'Unchecked_Access);
      Arg_CC_Ü_Segments_total : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (Segments_total'Unrestricted_Access);
      Arg_Any_Ü_Segments_total : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_Ü_Segments_total'Unchecked_Access);
      pragma Warnings (Off, Segments_total);

      Request_Ü : PolyORB.Requests.Request_Access;
      Arg_List_Ü : PolyORB.Any.NVList.Ref;
      Result_Ü_NV : PolyORB.Any.NamedValue;
   begin

      if Is_Nil (Self) then
         CORBA.Raise_Inv_Objref (Default_Sys_Member);
      end if;

      --  Create argument list

      PolyORB.Any.NVList.Create
        (Arg_List_Ü);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_Ü,
         build_track_Arg_Name_Ü_MacroSegments,
         PolyORB.Any.Any (Arg_Any_Ü_MacroSegments),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_Ü,
         build_track_Arg_Name_Ü_MacroSegments_total,
         PolyORB.Any.Any (Arg_Any_Ü_MacroSegments_total),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_Ü,
         build_track_Arg_Name_Ü_Segments_total,
         PolyORB.Any.Any (Arg_Any_Ü_Segments_total),
         PolyORB.Any.ARG_OUT);

      --  Set result type (maybe void)

      Result_Ü_NV :=
       (Name     => Result_Name_Ü,
        Argument =>
         CORBA.Internals.Get_Empty_Any (CORBA.TC_Void),
         Arg_Modes => 0);

      PolyORB.Requests.Create_Request
        (Target    => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref (Self)),
         Operation => "build_track",
         Arg_List  => Arg_List_Ü,
         Result    => Result_Ü_NV,
         Req       => Request_Ü);

      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü, PolyORB.Requests.Flags (0));
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence (Request_Ü);
      PolyORB.Requests.Destroy_Request (Request_Ü);

      --  Request has been synchronously invoked

   end build_track;

   procedure endRace
     (Self : Ref)
   is

      Request_Ü : PolyORB.Requests.Request_Access;
      Arg_List_Ü : PolyORB.Any.NVList.Ref;
      Result_Ü_NV : PolyORB.Any.NamedValue;
   begin

      if Is_Nil (Self) then
         CORBA.Raise_Inv_Objref (Default_Sys_Member);
      end if;

      --  Create argument list

      PolyORB.Any.NVList.Create
        (Arg_List_Ü);

      --  Set result type (maybe void)

      Result_Ü_NV :=
       (Name     => Result_Name_Ü,
        Argument =>
         CORBA.Internals.Get_Empty_Any (CORBA.TC_Void),
         Arg_Modes => 0);

      PolyORB.Requests.Create_Request
        (Target    => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref (Self)),
         Operation => "endRace",
         Arg_List  => Arg_List_Ü,
         Result    => Result_Ü_NV,
         Req       => Request_Ü,
         Req_Flags => PolyORB.Requests.Sync_With_Transport);

      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü, PolyORB.Requests.Flags (0));
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence (Request_Ü);
      PolyORB.Requests.Destroy_Request (Request_Ü);
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
