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
with CORBA;
pragma Elaborate_All (CORBA);
with PolyORB.Any;
with PolyORB.Sequences.Unbounded.CORBA_Helper;
pragma Elaborate_All (PolyORB.Sequences.Unbounded.CORBA_Helper);
with PolyORB.Types;
with System;

package RI.Helper is

   TC_IDL_SEQUENCE_string : CORBA.TypeCode.Object;

   function From_Any
     (Item : CORBA.Any)
     return RI.IDL_SEQUENCE_string.Sequence;

   function To_Any
     (Item : RI.IDL_SEQUENCE_string.Sequence)
     return CORBA.Any;

   TC_StringSequence : CORBA.TypeCode.Object;

   function From_Any
     (Item : CORBA.Any)
     return RI.StringSequence;

   function To_Any
     (Item : RI.StringSequence)
     return CORBA.Any;

   TC_StringArray : CORBA.TypeCode.Object;

   function From_Any
     (Item : CORBA.Any)
     return RI.StringArray;

   function To_Any
     (Item : RI.StringArray)
     return CORBA.Any;

   TC_SegmentProperties : CORBA.TypeCode.Object;

   function From_Any
     (Item : CORBA.Any)
     return RI.SegmentProperties;

   function To_Any
     (Item : RI.SegmentProperties)
     return CORBA.Any;

   TC_IDL_SEQUENCE_RI_SegmentProperties : CORBA.TypeCode.Object;

   function From_Any
     (Item : CORBA.Any)
     return RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence;

   function To_Any
     (Item : RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence)
     return CORBA.Any;

   TC_LPtrack : CORBA.TypeCode.Object;

   function From_Any
     (Item : CORBA.Any)
     return RI.LPtrack;

   function To_Any
     (Item : RI.LPtrack)
     return CORBA.Any;

   
   package Internals is

      function IDL_SEQUENCE_string_Element_Wrap
        (X : access CORBA.String)
        return PolyORB.Any.Content'Class;

      function Wrap
        (X : access RI.IDL_SEQUENCE_string.Sequence)
        return PolyORB.Any.Content'Class;

      package IDL_SEQUENCE_string_Helper is
        new RI.IDL_SEQUENCE_string.CORBA_Helper
           (Element_From_Any => CORBA.From_Any,
            Element_To_Any => CORBA.To_Any,
            Element_Wrap => RI.Helper.Internals.IDL_SEQUENCE_string_Element_Wrap);

      procedure Initialize_IDL_SEQUENCE_string;

      procedure Initialize_StringSequence;

      type Ptr_Ü_StringArray is
        access all RI.StringArray;

      type Content_Ü_StringArray is
        new PolyORB.Any.Aggregate_Content with record
            V : Ptr_Ü_StringArray;
         end record;

      function Get_Aggregate_Element
        (Acc : not null access Content_Ü_StringArray;
         Tc : PolyORB.Any.TypeCode.Object_Ptr;
         Index : PolyORB.Types.Unsigned_Long;
         Mech : not null access PolyORB.Any.Mechanism)
        return PolyORB.Any.Content'Class;

      function Get_Aggregate_Count
        (Acc : Content_Ü_StringArray)
        return PolyORB.Types.Unsigned_Long;

      procedure Set_Aggregate_Count
        (Acc : in out Content_Ü_StringArray;
         Count : PolyORB.Types.Unsigned_Long);

      function Unchecked_Get_V
        (Acc : not null access Content_Ü_StringArray)
        return System.Address;

      function Clone
        (Acc : Content_Ü_StringArray;
         Into : PolyORB.Any.Content_Ptr := null)
        return PolyORB.Any.Content_Ptr;

      procedure Finalize_Value
        (Acc : in out Content_Ü_StringArray);

      Lengths_Ü_StringArray : constant array (1 .. 1) of PolyORB.Types.Unsigned_Long :=
        (1 => 20);

      function Wrap
        (X : access RI.StringArray)
        return PolyORB.Any.Content'Class;

      procedure Initialize_StringArray_Array;

      type Ptr_Ü_SegmentProperties is
        access all RI.SegmentProperties;

      type Content_Ü_SegmentProperties is
        new PolyORB.Any.Aggregate_Content with record
            V : Ptr_Ü_SegmentProperties;
         end record;

      function Get_Aggregate_Element
        (Acc : not null access Content_Ü_SegmentProperties;
         Tc : PolyORB.Any.TypeCode.Object_Ptr;
         Index : PolyORB.Types.Unsigned_Long;
         Mech : not null access PolyORB.Any.Mechanism)
        return PolyORB.Any.Content'Class;

      function Get_Aggregate_Count
        (Acc : Content_Ü_SegmentProperties)
        return PolyORB.Types.Unsigned_Long;

      procedure Set_Aggregate_Count
        (Acc : in out Content_Ü_SegmentProperties;
         Count : PolyORB.Types.Unsigned_Long);

      function Unchecked_Get_V
        (Acc : not null access Content_Ü_SegmentProperties)
        return System.Address;

      function Clone
        (Acc : Content_Ü_SegmentProperties;
         Into : PolyORB.Any.Content_Ptr := null)
        return PolyORB.Any.Content_Ptr;

      procedure Finalize_Value
        (Acc : in out Content_Ü_SegmentProperties);

      function Wrap
        (X : access RI.SegmentProperties)
        return PolyORB.Any.Content'Class;

      procedure Initialize_SegmentProperties;

      function IDL_SEQUENCE_RI_SegmentProperties_Element_Wrap
        (X : access RI.SegmentProperties)
        return PolyORB.Any.Content'Class;

      function Wrap
        (X : access RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence)
        return PolyORB.Any.Content'Class;

      package IDL_SEQUENCE_RI_SegmentProperties_Helper is
        new RI.IDL_SEQUENCE_RI_SegmentProperties.CORBA_Helper
           (Element_From_Any => RI.Helper.From_Any,
            Element_To_Any => RI.Helper.To_Any,
            Element_Wrap => RI.Helper.Internals.IDL_SEQUENCE_RI_SegmentProperties_Element_Wrap);

      procedure Initialize_IDL_SEQUENCE_RI_SegmentProperties;

      procedure Initialize_LPtrack;

   end Internals;

end RI.Helper;
