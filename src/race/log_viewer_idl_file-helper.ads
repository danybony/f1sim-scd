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

package log_viewer_IDL_File.Helper is

   TC_IDL_SEQUENCE_string : CORBA.TypeCode.Object;

   function From_Any (Item : CORBA.Any) return log_viewer_IDL_File.IDL_SEQUENCE_string.Sequence;

   function To_Any
     (Item : log_viewer_IDL_File.IDL_SEQUENCE_string.Sequence) return CORBA.Any;

   function Wrap (X : access log_viewer_IDL_File.IDL_SEQUENCE_string.Sequence) return PolyORB.Any.Content'Class;

   TC_Strings : CORBA.TypeCode.Object;

   function From_Any (Item : CORBA.Any) return log_viewer_IDL_File.Strings;

   function To_Any
     (Item : log_viewer_IDL_File.Strings) return CORBA.Any;

end log_viewer_IDL_File.Helper;
