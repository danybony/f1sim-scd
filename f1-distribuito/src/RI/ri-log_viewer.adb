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

package body RI.Log_viewer is

   Result_Name_� : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("Result");

   setEnvironment_Arg_Name_�_Drivers : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("Drivers");

   setEnvironment_Arg_Name_�_segmentsNumber : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("segmentsNumber");

   setEnvironment_Arg_Name_�_T1 : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("T1");

   setEnvironment_Arg_Name_�_T2 : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("T2");

   setEnvironment_Arg_Name_�_RaceLaps : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("RaceLaps");

   procedure setEnvironment
     (Self : Ref;
      Drivers : RI.StringSequence;
      segmentsNumber : CORBA.Long;
      T1 : CORBA.Short;
      T2 : CORBA.Short;
      RaceLaps : CORBA.Short)
   is
      Arg_CC_�_Drivers : aliased PolyORB.Any.Content'Class :=
         RI.Helper.Wrap (RI.IDL_SEQUENCE_string.Sequence (Drivers)'Unrestricted_Access);
      Arg_Any_�_Drivers : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (RI.Helper.TC_StringSequence, Arg_CC_�_Drivers'Unchecked_Access);
      Arg_CC_�_segmentsNumber : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (segmentsNumber'Unrestricted_Access);
      Arg_Any_�_segmentsNumber : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_�_segmentsNumber'Unchecked_Access);
      Arg_CC_�_T1 : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (T1'Unrestricted_Access);
      Arg_Any_�_T1 : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_�_T1'Unchecked_Access);
      Arg_CC_�_T2 : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (T2'Unrestricted_Access);
      Arg_Any_�_T2 : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_�_T2'Unchecked_Access);
      Arg_CC_�_RaceLaps : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (RaceLaps'Unrestricted_Access);
      Arg_Any_�_RaceLaps : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_�_RaceLaps'Unchecked_Access);

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
         setEnvironment_Arg_Name_�_Drivers,
         PolyORB.Any.Copy_Any (PolyORB.Any.Any (Arg_Any_�_Drivers)),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_�,
         setEnvironment_Arg_Name_�_segmentsNumber,
         PolyORB.Any.Copy_Any (PolyORB.Any.Any (Arg_Any_�_segmentsNumber)),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_�,
         setEnvironment_Arg_Name_�_T1,
         PolyORB.Any.Copy_Any (PolyORB.Any.Any (Arg_Any_�_T1)),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_�,
         setEnvironment_Arg_Name_�_T2,
         PolyORB.Any.Copy_Any (PolyORB.Any.Any (Arg_Any_�_T2)),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_�,
         setEnvironment_Arg_Name_�_RaceLaps,
         PolyORB.Any.Copy_Any (PolyORB.Any.Any (Arg_Any_�_RaceLaps)),
         PolyORB.Any.ARG_IN);

      --  Set result type (maybe void)

      Result_�_NV :=
       (Name     => Result_Name_�,
        Argument =>
         CORBA.Internals.Get_Empty_Any (CORBA.TC_Void),
         Arg_Modes => 0);

      PolyORB.Requests.Create_Request
        (Target    => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref (Self)),
         Operation => "setEnvironment",
         Arg_List  => Arg_List_�,
         Result    => Result_�_NV,
         Req       => Request_�,
         Req_Flags => PolyORB.Requests.Sync_With_Transport);

      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�, PolyORB.Requests.Flags (0));
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence (Request_�);
      PolyORB.Requests.Destroy_Request (Request_�);
   end setEnvironment;

   updateLog_Arg_Name_�_Driver_ID : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("Driver_ID");

   updateLog_Arg_Name_�_Segment : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("Segment");

   updateLog_Arg_Name_�_Speed : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("Speed");

   updateLog_Arg_Name_�_box : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("box");

   procedure updateLog
     (Self : Ref;
      Driver_ID : CORBA.Short;
      Segment : CORBA.Long;
      Speed : CORBA.Float;
      box : CORBA.Boolean)
   is
      Arg_CC_�_Driver_ID : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (Driver_ID'Unrestricted_Access);
      Arg_Any_�_Driver_ID : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_�_Driver_ID'Unchecked_Access);
      Arg_CC_�_Segment : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (Segment'Unrestricted_Access);
      Arg_Any_�_Segment : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_�_Segment'Unchecked_Access);
      Arg_CC_�_Speed : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (Speed'Unrestricted_Access);
      Arg_Any_�_Speed : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Float, Arg_CC_�_Speed'Unchecked_Access);
      Arg_CC_�_box : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (box'Unrestricted_Access);
      Arg_Any_�_box : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Boolean, Arg_CC_�_box'Unchecked_Access);

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
         updateLog_Arg_Name_�_Driver_ID,
         PolyORB.Any.Copy_Any (PolyORB.Any.Any (Arg_Any_�_Driver_ID)),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_�,
         updateLog_Arg_Name_�_Segment,
         PolyORB.Any.Copy_Any (PolyORB.Any.Any (Arg_Any_�_Segment)),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_�,
         updateLog_Arg_Name_�_Speed,
         PolyORB.Any.Copy_Any (PolyORB.Any.Any (Arg_Any_�_Speed)),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_�,
         updateLog_Arg_Name_�_box,
         PolyORB.Any.Copy_Any (PolyORB.Any.Any (Arg_Any_�_box)),
         PolyORB.Any.ARG_IN);

      --  Set result type (maybe void)

      Result_�_NV :=
       (Name     => Result_Name_�,
        Argument =>
         CORBA.Internals.Get_Empty_Any (CORBA.TC_Void),
         Arg_Modes => 0);

      PolyORB.Requests.Create_Request
        (Target    => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref (Self)),
         Operation => "updateLog",
         Arg_List  => Arg_List_�,
         Result    => Result_�_NV,
         Req       => Request_�,
         Req_Flags => PolyORB.Requests.Sync_With_Transport);

      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�, PolyORB.Requests.Flags (0));
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence (Request_�);
      PolyORB.Requests.Destroy_Request (Request_�);
   end updateLog;

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
         RI.Log_viewer.Repository_Id)
        or else CORBA.Is_Equivalent
          (Logical_Type_Id,
           "IDL:omg.org/CORBA/Object:1.0")
        or else False;

   end Is_A;

end RI.Log_viewer;
