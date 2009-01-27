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

package Log_viewer is

   type Ref is new CORBA.Object.Ref with null record;

   procedure updateLog
     (Self : Ref;
      Driver_ID : CORBA.Long;
      Segment : CORBA.Long;
      Speed : CORBA.Long);

   updateLog_Repository_Id : constant PolyORB.Std.String
     := "IDL:Log_viewer/updateLog:1.0";

   procedure endRace
     (Self : Ref);

   endRace_Repository_Id : constant PolyORB.Std.String
     := "IDL:Log_viewer/endRace:1.0";

   Repository_Id : constant PolyORB.Std.String
     := "IDL:Log_viewer:1.0";

   function Is_A
     (Self : Ref;
      Logical_Type_Id : PolyORB.Std.String)
     return CORBA.Boolean;

private

   function Is_A
     (Logical_Type_Id : PolyORB.Std.String)
     return CORBA.Boolean;

end Log_viewer;
