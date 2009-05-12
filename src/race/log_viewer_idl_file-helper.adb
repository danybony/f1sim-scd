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
with PolyORB.Sequences.Unbounded.CORBA_Helper;
pragma Elaborate_All (PolyORB.Sequences.Unbounded.CORBA_Helper);

package body log_viewer_IDL_File.Helper is

   function IDL_SEQUENCE_string_Element_Wrap (X : access CORBA.String) return PolyORB.Any.Content'Class is
   begin
      return CORBA.Wrap (X.all'Unrestricted_Access);
   end IDL_SEQUENCE_string_Element_Wrap;

   package IDL_SEQUENCE_string_Helper is new IDL_SEQUENCE_string.CORBA_Helper
     (Element_To_Any   => CORBA.To_Any,
      Element_From_Any => CORBA.From_Any,
      Element_Wrap     => IDL_SEQUENCE_string_Element_Wrap);

   function From_Any (Item : CORBA.Any) return log_viewer_IDL_File.IDL_SEQUENCE_string.Sequence
     renames IDL_SEQUENCE_string_Helper.From_Any;

   function To_Any
     (Item : log_viewer_IDL_File.IDL_SEQUENCE_string.Sequence) return CORBA.Any
     renames IDL_SEQUENCE_string_Helper.To_Any;

   function Wrap (X : access log_viewer_IDL_File.IDL_SEQUENCE_string.Sequence) return PolyORB.Any.Content'Class
     renames IDL_SEQUENCE_string_Helper.Wrap;

   function From_Any (Item : CORBA.Any) return log_viewer_IDL_File.Strings
   is
   begin
      return log_viewer_IDL_File.Strings (log_viewer_IDL_File.IDL_SEQUENCE_string.Sequence'(log_viewer_IDL_File.Helper.From_Any (Item)));
   end From_Any;

   function To_Any
     (Item : log_viewer_IDL_File.Strings) return CORBA.Any
   is
      Result : CORBA.Any := log_viewer_IDL_File.Helper.To_Any (log_viewer_IDL_File.IDL_SEQUENCE_string.Sequence (Item));
   begin
      CORBA.Internals.Set_Type (Result, TC_Strings);
      return Result;
   end To_Any;

   procedure Deferred_Initialization is
   begin

      TC_IDL_SEQUENCE_string := 
        CORBA.TypeCode.Internals.Build_Sequence_TC
          (CORBA.TC_String, 0);
      CORBA.TypeCode.Internals.Disable_Reference_Counting (TC_IDL_SEQUENCE_string);
      IDL_SEQUENCE_string_Helper.Initialize
        (Element_TC  => CORBA.TC_String,
         Sequence_TC => TC_IDL_SEQUENCE_string);

      declare
         Name : constant CORBA.String := CORBA.To_CORBA_String ("Strings");
         Id : constant CORBA.String := CORBA.To_CORBA_String ("IDL:Strings:1.0");
      begin
         TC_Strings := CORBA.TypeCode.Internals.Build_Alias_TC
           (Name => Name, Id => Id, Parent => log_viewer_IDL_File.Helper.TC_IDL_SEQUENCE_string);
         CORBA.TypeCode.Internals.Disable_Reference_Counting (TC_Strings);
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
         (Name      => +"log_viewer_IDL_File.Helper",
          Conflicts => PolyORB.Initialization.String_Lists.Empty,
          Depends   =>
                  +"any"
          ,
          Provides  => PolyORB.Initialization.String_Lists.Empty,
          Implicit  => False,
          Init      => Deferred_Initialization'Access,
          Shutdown  => null));
   end;

end log_viewer_IDL_File.Helper;
