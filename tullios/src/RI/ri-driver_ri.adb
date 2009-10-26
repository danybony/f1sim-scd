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
with RI.Helper;
with PolyORB.Any;
with PolyORB.Requests;
with PolyORB.CORBA_P.Interceptors_Hooks;
with PolyORB.CORBA_P.Exceptions;

package body RI.driver_RI is

   init_Arg_Name_params_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("params");

   init_Arg_Name_position_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("position");

   init_Arg_Name_track_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("track");

   init_Arg_Name_box_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("box");

   init_Arg_Name_laps_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("laps");

   init_Result_Name_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   -------------------
   -- init_Result_� --
   -------------------

   function init_Result_� return PolyORB.Any.NamedValue is
      pragma Inline (init_Result_�);
   begin
      return (Name => init_Result_Name_�,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end init_Result_�;

   ----------
   -- init --
   ----------

   procedure init
     (Self : Ref;
      params : RI.StringArray;
      position : CORBA.Short;
      track : RI.LPtrack;
      box : RI.LPtrack;
      laps : CORBA.Short)
   is
      Argument_List_� : PolyORB.Any.NVList.Ref;
      Arg_CC_params_� : aliased PolyORB.Any.Content'Class :=
        RI.Helper.Internals.Wrap
           (params'Unrestricted_Access);
      Arg_Any_params_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (RI.Helper.TC_StringArray,
            Arg_CC_params_�'Unchecked_Access);
      Arg_CC_position_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (position'Unrestricted_Access);
      Arg_Any_position_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Short,
            Arg_CC_position_�'Unchecked_Access);
      Arg_CC_track_� : aliased PolyORB.Any.Content'Class :=
        RI.Helper.Internals.Wrap
           (RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence
              (track)'Unrestricted_Access);
      Arg_Any_track_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (RI.Helper.TC_LPtrack,
            Arg_CC_track_�'Unchecked_Access);
      Arg_CC_box_� : aliased PolyORB.Any.Content'Class :=
        RI.Helper.Internals.Wrap
           (RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence
              (box)'Unrestricted_Access);
      Arg_Any_box_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (RI.Helper.TC_LPtrack,
            Arg_CC_box_�'Unchecked_Access);
      Arg_CC_laps_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (laps'Unrestricted_Access);
      Arg_Any_laps_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Short,
            Arg_CC_laps_�'Unchecked_Access);
      Request_� : PolyORB.Requests.Request_Access;
      Result_Nv_� : PolyORB.Any.NamedValue :=
        init_Result_�;
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
         init_Arg_Name_params_�,
         PolyORB.Any.Any
           (Arg_Any_params_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         init_Arg_Name_position_�,
         PolyORB.Any.Any
           (Arg_Any_position_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         init_Arg_Name_track_�,
         PolyORB.Any.Any
           (Arg_Any_track_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         init_Arg_Name_box_�,
         PolyORB.Any.Any
           (Arg_Any_box_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         init_Arg_Name_laps_�,
         PolyORB.Any.Any
           (Arg_Any_laps_�),
         PolyORB.Any.ARG_IN);
      --  Creating the request
      PolyORB.Requests.Create_Request
        (Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "init",
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
   end init;

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
         RI.driver_RI.Repository_Id)
         or else CORBA.Is_Equivalent
           (Logical_Type_Id,
            "IDL:omg.org/CORBA/Object:1.0"))
         or else False);
   end Is_A;

end RI.driver_RI;
