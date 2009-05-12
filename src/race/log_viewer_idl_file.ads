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
with CORBA.Sequences.Unbounded;
pragma Elaborate_All (CORBA.Sequences.Unbounded);
with CORBA;

package log_viewer_IDL_File is

   package IDL_SEQUENCE_string is
     new CORBA.Sequences.Unbounded
       (CORBA.String);

   type Strings is
     new log_viewer_IDL_File.IDL_SEQUENCE_string.Sequence;

   Strings_Repository_Id : constant PolyORB.Std.String
     := "IDL:Strings:1.0";

end log_viewer_IDL_File;
