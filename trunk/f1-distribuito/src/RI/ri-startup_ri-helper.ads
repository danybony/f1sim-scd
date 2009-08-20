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
with CORBA.Object;

package RI.startup_RI.Helper is

   TC_startup_RI : CORBA.TypeCode.Object;

   function From_Any
     (Item : CORBA.Any)
     return RI.startup_RI.Ref;

   function To_Any
     (Item : RI.startup_RI.Ref)
     return CORBA.Any;

   function Unchecked_To_Ref
     (The_Ref : CORBA.Object.Ref'Class)
     return RI.startup_RI.Ref;

   function To_Ref
     (The_Ref : CORBA.Object.Ref'Class)
     return RI.startup_RI.Ref;

   
   package Internals is

      procedure Initialize_startup_RI;

   end Internals;

end RI.startup_RI.Helper;
