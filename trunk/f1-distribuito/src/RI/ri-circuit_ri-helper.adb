-------------------------------------------------
--  This file has been generated automatically
--  by IDLAC version 2.4.0-20080521.
--
--  Do NOT hand-modify this file, as your
--  changes will be lost when you re-run the
--  IDL to Ada compiler.
-------------------------------------------------
pragma Style_Checks ("NM32766");

with PolyORB.Utils.Strings;
with PolyORB.Initialization;
pragma Elaborate_All (PolyORB.Initialization);
with PolyORB.Any;
with CORBA.Object.Helper;

package body RI.circuit_RI.Helper is

   function Unchecked_To_Ref
     (The_Ref : CORBA.Object.Ref'Class)
     return RI.circuit_RI.Ref
   is
      Result : RI.circuit_RI.Ref;
   begin
      Set (Result,
           CORBA.Object.Object_Of (The_Ref));
      return Result;
   end Unchecked_To_Ref;

   function To_Ref
     (The_Ref : CORBA.Object.Ref'Class)
     return RI.circuit_RI.Ref
   is
   begin
      if CORBA.Object.Is_Nil (The_Ref)
        or else CORBA.Object.Is_A (The_Ref, Repository_Id) then
         return Unchecked_To_Ref (The_Ref);
      end if;
      CORBA.Raise_Bad_Param (CORBA.Default_Sys_Member);
   end To_Ref;

   function From_Any (Item : CORBA.Any) return RI.circuit_RI.Ref is
   begin
      return To_Ref (CORBA.Object.Helper.From_Any (Item));
   end From_Any;

   function To_Any
     (Item : RI.circuit_RI.Ref) return CORBA.Any is
      A : CORBA.Any := CORBA.Object.Helper.To_Any
        (CORBA.Object.Ref (Item));
   begin
      CORBA.Internals.Set_Type (A, TC_circuit_RI);
      return A;
   end To_Any;

   procedure Deferred_Initialization is
   begin

      declare
         Name : constant CORBA.String := CORBA.To_CORBA_String ("circuit_RI");
         Id   : constant CORBA.String := CORBA.To_CORBA_String ("IDL:RI/circuit_RI:1.0");
      begin
         TC_circuit_RI :=
           CORBA.TypeCode.Internals.To_CORBA_Object (PolyORB.Any.TypeCode.TC_Object);
         CORBA.Internals.Add_Parameter (TC_circuit_RI, CORBA.To_Any (Name));
         CORBA.Internals.Add_Parameter (TC_circuit_RI, CORBA.To_Any (Id));
         CORBA.TypeCode.Internals.Disable_Reference_Counting (TC_circuit_RI);
      end;

   end Deferred_Initialization;

begin
   declare
      use PolyORB.Initialization;
      use PolyORB.Initialization.String_Lists;
      use PolyORB.Utils.Strings;
   begin
      Register_Module
        (Module_Info'
         (Name      => +"RI.circuit_RI.Helper",
          Conflicts => PolyORB.Initialization.String_Lists.Empty,
          Depends   =>
                  +"any"
          ,
          Provides  => PolyORB.Initialization.String_Lists.Empty,
          Implicit  => False,
          Init      => Deferred_Initialization'Access,
          Shutdown  => null));
   end;

end RI.circuit_RI.Helper;
