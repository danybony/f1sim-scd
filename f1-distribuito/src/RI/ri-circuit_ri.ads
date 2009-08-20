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
with CORBA.Object;
with PolyORB.Std;
with CORBA;
pragma Elaborate_All (CORBA);

package RI.circuit_RI is

   type Ref is
     new CORBA.Object.Ref with null record;

   Repository_Id : constant PolyORB.Std.String :=
     "IDL:RI/circuit_RI:1.0";

   procedure enter
     (Self : Ref;
      segment : CORBA.Long;
      speed : in out CORBA.Float;
      lane : in out CORBA.Short);

   enter_Repository_Id : constant PolyORB.Std.String :=
     "IDL:RI/circuit_RI/enter:1.0";

   procedure leave
     (Self : Ref;
      segment : CORBA.Long;
      lane : in out CORBA.Short);

   leave_Repository_Id : constant PolyORB.Std.String :=
     "IDL:RI/circuit_RI/leave:1.0";

   procedure enter_Box
     (Self : Ref;
      segment : CORBA.Long;
      speed : in out CORBA.Float;
      lane : in out CORBA.Short);

   enter_Box_Repository_Id : constant PolyORB.Std.String :=
     "IDL:RI/circuit_RI/enter_Box:1.0";

   procedure leave_Box
     (Self : Ref;
      segment : CORBA.Long;
      lane : in out CORBA.Short);

   leave_Box_Repository_Id : constant PolyORB.Std.String :=
     "IDL:RI/circuit_RI/leave_Box:1.0";

   procedure build_track
     (Self : Ref;
      MacroSegments : RI.StringSequence;
      MacroSegments_total : CORBA.Long;
      Segments_total : out CORBA.Long);

   build_track_Repository_Id : constant PolyORB.Std.String :=
     "IDL:RI/circuit_RI/build_track:1.0";

   procedure endRace
     (Self : Ref);

   endRace_Repository_Id : constant PolyORB.Std.String :=
     "IDL:RI/circuit_RI/endRace:1.0";

   function Is_A
     (Self : Ref;
      Logical_Type_Id : PolyORB.Std.String)
     return CORBA.Boolean;

private
   function Is_A
     (Logical_Type_Id : PolyORB.Std.String)
     return CORBA.Boolean;

end RI.circuit_RI;
