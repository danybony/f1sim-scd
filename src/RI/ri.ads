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
with PolyORB.Std;
with CORBA.Sequences.Unbounded;
with CORBA;
pragma Elaborate_All (CORBA);

package RI is

   Repository_Id : constant PolyORB.Std.String :=
     "IDL:RI:1.0";

   package IDL_SEQUENCE_string is
     new CORBA.Sequences.Unbounded
        (CORBA.String);

   type StringSequence is
     new RI.IDL_SEQUENCE_string.Sequence;

   StringSequence_Repository_Id : constant PolyORB.Std.String :=
     "IDL:RI/StringSequence:1.0";

   type StringArray is
     array (0 .. 19) of CORBA.String;

   StringArray_Repository_Id : constant PolyORB.Std.String :=
     "IDL:RI/StringArray:1.0";

   type SegmentProperties is
     record
         Starting_Speed : CORBA.Float;
         Leaving_Speed : CORBA.Float;
         Segments : CORBA.Unsigned_Short;
      end record;

   SegmentProperties_Repository_Id : constant PolyORB.Std.String :=
     "IDL:RI/SegmentProperties:1.0";

   package IDL_SEQUENCE_RI_SegmentProperties is
     new CORBA.Sequences.Unbounded
        (RI.SegmentProperties);

   type LPtrack is
     new RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence;

   LPtrack_Repository_Id : constant PolyORB.Std.String :=
     "IDL:RI/LPtrack:1.0";

end RI;
