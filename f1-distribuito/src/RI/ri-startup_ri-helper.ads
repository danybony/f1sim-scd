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

package RI.startup_RI.Helper is

   function Unchecked_To_Ref
     (The_Ref : CORBA.Object.Ref'Class) return RI.startup_RI.Ref;

   function To_Ref
     (The_Ref : CORBA.Object.Ref'Class) return RI.startup_RI.Ref;

   TC_startup_RI : CORBA.TypeCode.Object;

   function From_Any (Item : CORBA.Any) return RI.startup_RI.Ref;

   function To_Any
     (Item : RI.startup_RI.Ref) return CORBA.Any;

end RI.startup_RI.Helper;
