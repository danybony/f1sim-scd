-------------------------------------------------
--  This file has been generated automatically
--  by IDLAC version 2.4.0-20080521.
--
--  Do NOT hand-modify this file, as your
--  changes will be lost when you re-run the
--  IDL to Ada compiler.
-------------------------------------------------
pragma Style_Checks ("NM32766");

with PolyORB.Requests;
with PolyORB.Any.NVList;
with PolyORB.CORBA_P.Interceptors_Hooks;
with PolyORB.CORBA_P.Exceptions;
with CORBA;
 use CORBA;
pragma Elaborate_All (CORBA);
with PolyORB.Types;

package body Log_viewer is

   Result_Name_� : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("Result");

   updateLog_Arg_Name_�_Driver_ID : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("Driver_ID");

   updateLog_Arg_Name_�_Segment : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("Segment");

   updateLog_Arg_Name_�_Speed : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("Speed");

   procedure updateLog
     (Self : Ref;
      Driver_ID : CORBA.Long;
      Segment : CORBA.Long;
      Speed : CORBA.Long)
   is
      Arg_CC_�_Driver_ID : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (Driver_ID'Unrestricted_Access);
      Arg_Any_�_Driver_ID : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_�_Driver_ID'Unchecked_Access);
      Arg_CC_�_Segment : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (Segment'Unrestricted_Access);
      Arg_Any_�_Segment : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_�_Segment'Unchecked_Access);
      Arg_CC_�_Speed : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (Speed'Unrestricted_Access);
      Arg_Any_�_Speed : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Long, Arg_CC_�_Speed'Unchecked_Access);

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
         Log_viewer.Repository_Id)
        or else CORBA.Is_Equivalent
          (Logical_Type_Id,
           "IDL:omg.org/CORBA/Object:1.0")
        or else False;

   end Is_A;

end Log_viewer;
