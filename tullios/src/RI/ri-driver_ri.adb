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

   init_Arg_Name_params_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("params");

   init_Arg_Name_position_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("position");

   init_Arg_Name_track_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("track");

   init_Arg_Name_box_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("box");

   init_Arg_Name_laps_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("laps");

   init_Result_Name_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   -------------------
   -- init_Result_Ü --
   -------------------

   function init_Result_Ü return PolyORB.Any.NamedValue is
      pragma Inline (init_Result_Ü);
   begin
      return (Name => init_Result_Name_Ü,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end init_Result_Ü;

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
      Argument_List_Ü : PolyORB.Any.NVList.Ref;
      Arg_CC_params_Ü : aliased PolyORB.Any.Content'Class :=
        RI.Helper.Internals.Wrap
           (params'Unrestricted_Access);
      Arg_Any_params_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (RI.Helper.TC_StringArray,
            Arg_CC_params_Ü'Unchecked_Access);
      Arg_CC_position_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (position'Unrestricted_Access);
      Arg_Any_position_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Short,
            Arg_CC_position_Ü'Unchecked_Access);
      Arg_CC_track_Ü : aliased PolyORB.Any.Content'Class :=
        RI.Helper.Internals.Wrap
           (RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence
              (track)'Unrestricted_Access);
      Arg_Any_track_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (RI.Helper.TC_LPtrack,
            Arg_CC_track_Ü'Unchecked_Access);
      Arg_CC_box_Ü : aliased PolyORB.Any.Content'Class :=
        RI.Helper.Internals.Wrap
           (RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence
              (box)'Unrestricted_Access);
      Arg_Any_box_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (RI.Helper.TC_LPtrack,
            Arg_CC_box_Ü'Unchecked_Access);
      Arg_CC_laps_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (laps'Unrestricted_Access);
      Arg_Any_laps_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Short,
            Arg_CC_laps_Ü'Unchecked_Access);
      Request_Ü : PolyORB.Requests.Request_Access;
      Result_Nv_Ü : PolyORB.Any.NamedValue :=
        init_Result_Ü;
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
         init_Arg_Name_params_Ü,
         PolyORB.Any.Any
           (Arg_Any_params_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         init_Arg_Name_position_Ü,
         PolyORB.Any.Any
           (Arg_Any_position_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         init_Arg_Name_track_Ü,
         PolyORB.Any.Any
           (Arg_Any_track_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         init_Arg_Name_box_Ü,
         PolyORB.Any.Any
           (Arg_Any_box_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         init_Arg_Name_laps_Ü,
         PolyORB.Any.Any
           (Arg_Any_laps_Ü),
         PolyORB.Any.ARG_IN);
      --  Creating the request
      PolyORB.Requests.Create_Request
        (Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "init",
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
