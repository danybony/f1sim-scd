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

package RI.circuit_RI.Helper is

   TC_circuit_RI : CORBA.TypeCode.Object;

   function From_Any
     (Item : CORBA.Any)
     return RI.circuit_RI.Ref;

   function To_Any
     (Item : RI.circuit_RI.Ref)
     return CORBA.Any;

   function Unchecked_To_Ref
     (The_Ref : CORBA.Object.Ref'Class)
     return RI.circuit_RI.Ref;

   function To_Ref
     (The_Ref : CORBA.Object.Ref'Class)
     return RI.circuit_RI.Ref;

   
   package Internals is

      procedure Initialize_circuit_RI;

   end Internals;

end RI.circuit_RI.Helper;
