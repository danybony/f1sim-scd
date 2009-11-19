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
with PolyORB.Any;
with PolyORB.Types;
with RI.Helper;
with PolyORB.Requests;
with PolyORB.CORBA_P.Interceptors_Hooks;
with PolyORB.CORBA_P.Exceptions;

package body RI.Log_viewer is

   setEnvironment_Arg_Name_Drivers_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Drivers");

   setEnvironment_Arg_Name_segmentsNumber_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("segmentsNumber");

   setEnvironment_Arg_Name_RaceLaps_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("RaceLaps");

   setEnvironment_Result_Name_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   -----------------------------
   -- setEnvironment_Result_Ü --
   -----------------------------

   function setEnvironment_Result_Ü return PolyORB.Any.NamedValue is
      pragma Inline (setEnvironment_Result_Ü);
   begin
      return (Name => setEnvironment_Result_Name_Ü,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Boolean),
      Arg_Modes => 0);
   end setEnvironment_Result_Ü;

   --------------------
   -- setEnvironment --
   --------------------

   function setEnvironment
     (Self : Ref;
      Drivers : RI.StringSequence;
      segmentsNumber : CORBA.Long;
      RaceLaps : CORBA.Short)
     return CORBA.Boolean
   is
      Argument_List_Ü : PolyORB.Any.NVList.Ref;
      Result_Ü : CORBA.Boolean;
      pragma Warnings (Off, Result_Ü);
      Arg_CC_Result_Ü_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (Result_Ü'Unrestricted_Access);
      Arg_CC_Drivers_Ü : aliased PolyORB.Any.Content'Class :=
        RI.Helper.Internals.Wrap
           (RI.IDL_SEQUENCE_string.Sequence
              (Drivers)'Unrestricted_Access);
      Arg_Any_Drivers_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (RI.Helper.TC_StringSequence,
            Arg_CC_Drivers_Ü'Unchecked_Access);
      Arg_CC_segmentsNumber_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (segmentsNumber'Unrestricted_Access);
      Arg_Any_segmentsNumber_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_segmentsNumber_Ü'Unchecked_Access);
      Arg_CC_RaceLaps_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (RaceLaps'Unrestricted_Access);
      Arg_Any_RaceLaps_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Short,
            Arg_CC_RaceLaps_Ü'Unchecked_Access);
      Request_Ü : PolyORB.Requests.Request_Access;
      Result_Nv_Ü : PolyORB.Any.NamedValue :=
        setEnvironment_Result_Ü;
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
         setEnvironment_Arg_Name_Drivers_Ü,
         PolyORB.Any.Any
           (Arg_Any_Drivers_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         setEnvironment_Arg_Name_segmentsNumber_Ü,
         PolyORB.Any.Any
           (Arg_Any_segmentsNumber_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         setEnvironment_Arg_Name_RaceLaps_Ü,
         PolyORB.Any.Any
           (Arg_Any_RaceLaps_Ü),
         PolyORB.Any.ARG_IN);
      --  Setting the result value
      PolyORB.Any.Set_Value
        (PolyORB.Any.Get_Container
           (Result_Nv_Ü.Argument).all,
         Arg_CC_Result_Ü_Ü'Unrestricted_Access);
      --  Creating the request
      PolyORB.Requests.Create_Request
        (Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "setEnvironment",
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
      --  Return value
      return Result_Ü;
   end setEnvironment;

   updateLog_Arg_Name_Driver_ID_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Driver_ID");

   updateLog_Arg_Name_Segment_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Segment");

   updateLog_Arg_Name_Speed_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Speed");

   updateLog_Arg_Name_box_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("box");

   updateLog_Result_Name_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   ------------------------
   -- updateLog_Result_Ü --
   ------------------------

   function updateLog_Result_Ü return PolyORB.Any.NamedValue is
      pragma Inline (updateLog_Result_Ü);
   begin
      return (Name => updateLog_Result_Name_Ü,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end updateLog_Result_Ü;

   ---------------
   -- updateLog --
   ---------------

   procedure updateLog
     (Self : Ref;
      Driver_ID : CORBA.Short;
      Segment : CORBA.Long;
      Speed : CORBA.Float;
      box : CORBA.Boolean)
   is
      Argument_List_Ü : PolyORB.Any.NVList.Ref;
      Arg_CC_Driver_ID_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (Driver_ID'Unrestricted_Access);
      Arg_Any_Driver_ID_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Short,
            Arg_CC_Driver_ID_Ü'Unchecked_Access);
      Arg_CC_Segment_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (Segment'Unrestricted_Access);
      Arg_Any_Segment_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_Segment_Ü'Unchecked_Access);
      Arg_CC_Speed_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (Speed'Unrestricted_Access);
      Arg_Any_Speed_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Float,
            Arg_CC_Speed_Ü'Unchecked_Access);
      Arg_CC_box_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (box'Unrestricted_Access);
      Arg_Any_box_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Boolean,
            Arg_CC_box_Ü'Unchecked_Access);
      Request_Ü : PolyORB.Requests.Request_Access;
      Result_Nv_Ü : PolyORB.Any.NamedValue :=
        updateLog_Result_Ü;
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
         updateLog_Arg_Name_Driver_ID_Ü,
         PolyORB.Any.Copy_Any
           (PolyORB.Any.Any
              (Arg_Any_Driver_ID_Ü)),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         updateLog_Arg_Name_Segment_Ü,
         PolyORB.Any.Copy_Any
           (PolyORB.Any.Any
              (Arg_Any_Segment_Ü)),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         updateLog_Arg_Name_Speed_Ü,
         PolyORB.Any.Copy_Any
           (PolyORB.Any.Any
              (Arg_Any_Speed_Ü)),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         updateLog_Arg_Name_box_Ü,
         PolyORB.Any.Copy_Any
           (PolyORB.Any.Any
              (Arg_Any_box_Ü)),
         PolyORB.Any.ARG_IN);
      --  Creating the request
      PolyORB.Requests.Create_Request
        (Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "updateLog",
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
   end updateLog;

   endRace_Arg_Name_Driver_ID_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Driver_ID");

   endRace_Arg_Name_reason_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("reason");

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
     (Self : Ref;
      Driver_ID : CORBA.Short;
      reason : CORBA.Short)
   is
      Argument_List_Ü : PolyORB.Any.NVList.Ref;
      Arg_CC_Driver_ID_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (Driver_ID'Unrestricted_Access);
      Arg_Any_Driver_ID_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Short,
            Arg_CC_Driver_ID_Ü'Unchecked_Access);
      Arg_CC_reason_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (reason'Unrestricted_Access);
      Arg_Any_reason_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Short,
            Arg_CC_reason_Ü'Unchecked_Access);
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
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         endRace_Arg_Name_Driver_ID_Ü,
         PolyORB.Any.Copy_Any
           (PolyORB.Any.Any
              (Arg_Any_Driver_ID_Ü)),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         endRace_Arg_Name_reason_Ü,
         PolyORB.Any.Copy_Any
           (PolyORB.Any.Any
              (Arg_Any_reason_Ü)),
         PolyORB.Any.ARG_IN);
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
         RI.Log_viewer.Repository_Id)
         or else CORBA.Is_Equivalent
           (Logical_Type_Id,
            "IDL:omg.org/CORBA/Object:1.0"))
         or else False);
   end Is_A;

end RI.Log_viewer;
