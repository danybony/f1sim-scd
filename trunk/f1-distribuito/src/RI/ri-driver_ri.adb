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

package body RI.driver_RI is

   Result_Name_Ü : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("Result");

   init_Arg_Name_Ü_params : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("params");

   init_Arg_Name_Ü_position : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("position");

   init_Arg_Name_Ü_track : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("track");

   init_Arg_Name_Ü_box : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("box");

   init_Arg_Name_Ü_laps : constant PolyORB.Types.Identifier
     := PolyORB.Types.To_PolyORB_String ("laps");

   procedure init
     (Self : Ref;
      params : RI.StringArray;
      position : CORBA.Short;
      track : RI.LPtrack;
      box : RI.LPtrack;
      laps : CORBA.Short)
   is
      Arg_CC_Ü_params : aliased PolyORB.Any.Content'Class :=
         RI.Helper.Wrap (params'Unrestricted_Access);
      Arg_Any_Ü_params : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (RI.Helper.TC_StringArray, Arg_CC_Ü_params'Unchecked_Access);
      Arg_CC_Ü_position : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (position'Unrestricted_Access);
      Arg_Any_Ü_position : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_Ü_position'Unchecked_Access);
      Arg_CC_Ü_track : aliased PolyORB.Any.Content'Class :=
         RI.Helper.Wrap (RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence (track)'Unrestricted_Access);
      Arg_Any_Ü_track : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (RI.Helper.TC_LPtrack, Arg_CC_Ü_track'Unchecked_Access);
      Arg_CC_Ü_box : aliased PolyORB.Any.Content'Class :=
         RI.Helper.Wrap (RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence (box)'Unrestricted_Access);
      Arg_Any_Ü_box : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (RI.Helper.TC_LPtrack, Arg_CC_Ü_box'Unchecked_Access);
      Arg_CC_Ü_laps : aliased PolyORB.Any.Content'Class :=
         CORBA.Wrap (laps'Unrestricted_Access);
      Arg_Any_Ü_laps : constant CORBA.Any := CORBA.Internals.Get_Wrapper_Any (CORBA.TC_Short, Arg_CC_Ü_laps'Unchecked_Access);

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
         init_Arg_Name_Ü_params,
         PolyORB.Any.Any (Arg_Any_Ü_params),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_Ü,
         init_Arg_Name_Ü_position,
         PolyORB.Any.Any (Arg_Any_Ü_position),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_Ü,
         init_Arg_Name_Ü_track,
         PolyORB.Any.Any (Arg_Any_Ü_track),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_Ü,
         init_Arg_Name_Ü_box,
         PolyORB.Any.Any (Arg_Any_Ü_box),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Arg_List_Ü,
         init_Arg_Name_Ü_laps,
         PolyORB.Any.Any (Arg_Any_Ü_laps),
         PolyORB.Any.ARG_IN);

      --  Set result type (maybe void)

      Result_Ü_NV :=
       (Name     => Result_Name_Ü,
        Argument =>
         CORBA.Internals.Get_Empty_Any (CORBA.TC_Void),
         Arg_Modes => 0);

      PolyORB.Requests.Create_Request
        (Target    => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref (Self)),
         Operation => "init",
         Arg_List  => Arg_List_Ü,
         Result    => Result_Ü_NV,
         Req       => Request_Ü);

      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü, PolyORB.Requests.Flags (0));
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence (Request_Ü);
      PolyORB.Requests.Destroy_Request (Request_Ü);

      --  Request has been synchronously invoked

   end init;

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
         RI.driver_RI.Repository_Id)
        or else CORBA.Is_Equivalent
          (Logical_Type_Id,
           "IDL:omg.org/CORBA/Object:1.0")
        or else False;

   end Is_A;

end RI.driver_RI;
