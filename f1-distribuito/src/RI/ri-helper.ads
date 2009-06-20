-------------------------------------------------
--  This file has been generated automatically
--  by IDLAC version 2.4.0-20080521.
--
--  Do NOT hand-modify this file, as your
--  changes will be lost when you re-run the
--  IDL to Ada compiler.
-------------------------------------------------
pragma Style_Checks ("NM32766");

with PolyORB.Any;
with CORBA;
pragma Elaborate_All (CORBA);

package RI.Helper is

   TC_IDL_SEQUENCE_string : CORBA.TypeCode.Object;

   function From_Any (Item : CORBA.Any) return RI.IDL_SEQUENCE_string.Sequence;

   function To_Any
     (Item : RI.IDL_SEQUENCE_string.Sequence) return CORBA.Any;

   function Wrap (X : access RI.IDL_SEQUENCE_string.Sequence) return PolyORB.Any.Content'Class;

   TC_StringSequence : CORBA.TypeCode.Object;

   function From_Any (Item : CORBA.Any) return RI.StringSequence;

   function To_Any
     (Item : RI.StringSequence) return CORBA.Any;

   TC_StringArray : CORBA.TypeCode.Object;
   function Wrap (X : access RI.StringArray) return PolyORB.Any.Content'Class;

   function From_Any (Item : CORBA.Any) return RI.StringArray;

   function To_Any
     (Item : RI.StringArray) return CORBA.Any;
   function Wrap (X : access RI.SegmentProperties) return PolyORB.Any.Content'Class;

   TC_SegmentProperties : CORBA.TypeCode.Object;

   function From_Any (Item : CORBA.Any) return RI.SegmentProperties;

   function To_Any
     (Item : RI.SegmentProperties) return CORBA.Any;

   TC_IDL_SEQUENCE_RI_SegmentProperties : CORBA.TypeCode.Object;

   function From_Any (Item : CORBA.Any) return RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence;

   function To_Any
     (Item : RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence) return CORBA.Any;

   function Wrap (X : access RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence) return PolyORB.Any.Content'Class;

   TC_LPtrack : CORBA.TypeCode.Object;

   function From_Any (Item : CORBA.Any) return RI.LPtrack;

   function To_Any
     (Item : RI.LPtrack) return CORBA.Any;

end RI.Helper;
