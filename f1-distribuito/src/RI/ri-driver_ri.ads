-------------------------------------------------
--  This file has been generated automatically
--  by IDLAC version 2.4.0-20080521.
--
--  Do NOT hand-modify this file, as your
--  changes will be lost when you re-run the
--  IDL to Ada compiler.
-------------------------------------------------
pragma Style_Checks ("NM32766");

with PolyORB.Std;
with CORBA;
pragma Elaborate_All (CORBA);
with CORBA.Object;

package RI.driver_RI is

   type Ref is new CORBA.Object.Ref with null record;

   procedure init
     (Self : Ref;
      params : RI.StringArray;
      position : CORBA.Short;
      track : RI.LPtrack;
      box : RI.LPtrack;
      laps : CORBA.Short);

   init_Repository_Id : constant PolyORB.Std.String
     := "IDL:RI/driver_RI/init:1.0";

   Repository_Id : constant PolyORB.Std.String
     := "IDL:RI/driver_RI:1.0";

   function Is_A
     (Self : Ref;
      Logical_Type_Id : PolyORB.Std.String)
     return CORBA.Boolean;

private

   function Is_A
     (Logical_Type_Id : PolyORB.Std.String)
     return CORBA.Boolean;

end RI.driver_RI;
