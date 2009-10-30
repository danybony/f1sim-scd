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

package RI.Log_viewer.Helper is

   TC_Log_viewer : CORBA.TypeCode.Object;

   function From_Any
     (Item : CORBA.Any)
     return RI.Log_viewer.Ref;

   function To_Any
     (Item : RI.Log_viewer.Ref)
     return CORBA.Any;

   function Unchecked_To_Ref
     (The_Ref : CORBA.Object.Ref'Class)
     return RI.Log_viewer.Ref;

   function To_Ref
     (The_Ref : CORBA.Object.Ref'Class)
     return RI.Log_viewer.Ref;

   
   package Internals is

      procedure Initialize_Log_viewer;

   end Internals;

end RI.Log_viewer.Helper;
