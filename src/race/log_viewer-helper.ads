-------------------------------------------------
--  This file has been generated automatically
--  by IDLAC version 2.4.0-20080521.
--
--  Do NOT hand-modify this file, as your
--  changes will be lost when you re-run the
--  IDL to Ada compiler.
-------------------------------------------------
pragma Style_Checks ("NM32766");

with CORBA;
pragma Elaborate_All (CORBA);
with CORBA.Object;

package Log_viewer.Helper is

   function Unchecked_To_Ref
     (The_Ref : CORBA.Object.Ref'Class) return Log_viewer.Ref;

   function To_Ref
     (The_Ref : CORBA.Object.Ref'Class) return Log_viewer.Ref;

   TC_Log_viewer : CORBA.TypeCode.Object;

   function From_Any (Item : CORBA.Any) return Log_viewer.Ref;

   function To_Any
     (Item : Log_viewer.Ref) return CORBA.Any;

end Log_viewer.Helper;
