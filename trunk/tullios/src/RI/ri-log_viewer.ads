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

package RI.Log_viewer is

   type Ref is
     new CORBA.Object.Ref with null record;

   Repository_Id : constant PolyORB.Std.String :=
     "IDL:RI/Log_viewer:1.0";

   procedure setEnvironment
     (Self : Ref;
      Drivers : RI.StringSequence;
      segmentsNumber : CORBA.Long;
      RaceLaps : CORBA.Short);

   setEnvironment_Repository_Id : constant PolyORB.Std.String :=
     "IDL:RI/Log_viewer/setEnvironment:1.0";

   procedure updateLog
     (Self : Ref;
      Driver_ID : CORBA.Short;
      Segment : CORBA.Long;
      Speed : CORBA.Float;
      box : CORBA.Boolean);

   updateLog_Repository_Id : constant PolyORB.Std.String :=
     "IDL:RI/Log_viewer/updateLog:1.0";

   procedure endRace
     (Self : Ref;
      Driver_ID : CORBA.Short;
      reason : CORBA.Short);

   endRace_Repository_Id : constant PolyORB.Std.String :=
     "IDL:RI/Log_viewer/endRace:1.0";

   function Is_A
     (Self : Ref;
      Logical_Type_Id : PolyORB.Std.String)
     return CORBA.Boolean;

private
   function Is_A
     (Logical_Type_Id : PolyORB.Std.String)
     return CORBA.Boolean;

end RI.Log_viewer;
