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
with Ada.Unchecked_Deallocation;
with PolyORB.Types;
with PolyORB.Sequences.Unbounded.CORBA_Helper;
pragma Elaborate_All (PolyORB.Sequences.Unbounded.CORBA_Helper);

package body RI.Helper is

   function IDL_SEQUENCE_string_Element_Wrap (X : access CORBA.String) return PolyORB.Any.Content'Class is
   begin
      return CORBA.Wrap (X.all'Unrestricted_Access);
   end IDL_SEQUENCE_string_Element_Wrap;

   package IDL_SEQUENCE_string_Helper is new IDL_SEQUENCE_string.CORBA_Helper
     (Element_To_Any   => CORBA.To_Any,
      Element_From_Any => CORBA.From_Any,
      Element_Wrap     => IDL_SEQUENCE_string_Element_Wrap);

   function From_Any (Item : CORBA.Any) return RI.IDL_SEQUENCE_string.Sequence
     renames IDL_SEQUENCE_string_Helper.From_Any;

   function To_Any
     (Item : RI.IDL_SEQUENCE_string.Sequence) return CORBA.Any
     renames IDL_SEQUENCE_string_Helper.To_Any;

   function Wrap (X : access RI.IDL_SEQUENCE_string.Sequence) return PolyORB.Any.Content'Class
     renames IDL_SEQUENCE_string_Helper.Wrap;

   function From_Any (Item : CORBA.Any) return RI.StringSequence
   is
   begin
      return RI.StringSequence (RI.IDL_SEQUENCE_string.Sequence'(RI.Helper.From_Any (Item)));
   end From_Any;

   function To_Any
     (Item : RI.StringSequence) return CORBA.Any
   is
      Result : CORBA.Any := RI.Helper.To_Any (RI.IDL_SEQUENCE_string.Sequence (Item));
   begin
      CORBA.Internals.Set_Type (Result, TC_StringSequence);
      return Result;
   end To_Any;

   type Ptr_Ü_StringArray is access all RI.StringArray;
   type Content_Ü_StringArray is
     new PolyORB.Any.Aggregate_Content with
   record
      V : Ptr_Ü_StringArray;
   end record;

   function Get_Aggregate_Element
     (ACC   : not null access Content_Ü_StringArray;
      TC    : PolyORB.Any.TypeCode.Object_Ptr;
      Index : PolyORB.Types.Unsigned_Long;
      Mech  : not null access PolyORB.Any.Mechanism) return PolyORB.Any.Content'Class;
   function Get_Aggregate_Count
     (ACC : Content_Ü_StringArray) return PolyORB.Types.Unsigned_Long;
   procedure Set_Aggregate_Count
     (ACC : in out Content_Ü_StringArray;
      Count : PolyORB.Types.Unsigned_Long);
   function Clone
     (ACC  : Content_Ü_StringArray;
      Into : PolyORB.Any.Content_Ptr := null) return PolyORB.Any.Content_Ptr;
   procedure Finalize_Value
     (ACC : in out Content_Ü_StringArray);

   Lengths_Ü_StringArray : constant array (1 .. 1) of PolyORB.Types.Unsigned_Long := (1 => 20);

   function Get_Aggregate_Element
     (ACC   : not null access Content_Ü_StringArray;
      TC    : PolyORB.Any.TypeCode.Object_Ptr;
      Index : PolyORB.Types.Unsigned_Long;
      Mech  : not null access PolyORB.Any.Mechanism) return PolyORB.Any.Content'Class
   is
      use type PolyORB.Types.Unsigned_Long;
      use type PolyORB.Any.Mechanism;
      pragma Suppress (Validity_Check);
      pragma Unreferenced (TC);
   begin
      Mech.all := PolyORB.Any.By_Reference;
      return CORBA.Wrap (ACC.V (Integer (Index))'Unrestricted_Access);
   end Get_Aggregate_Element;

   function Get_Aggregate_Count
     (ACC : Content_Ü_StringArray) return PolyORB.Types.Unsigned_Long
   is
      pragma Unreferenced (ACC);
   begin
      return Lengths_Ü_StringArray (1);
   end Get_Aggregate_Count;

   procedure Set_Aggregate_Count
     (ACC : in out Content_Ü_StringArray;
      Count : PolyORB.Types.Unsigned_Long)
   is
      use type PolyORB.Types.Unsigned_Long;
      pragma Unreferenced (ACC);
   begin
      if Count /= Lengths_Ü_StringArray (1) then
         raise Program_Error;
      end if;
   end Set_Aggregate_Count;

   function Clone
     (ACC  : Content_Ü_StringArray;
      Into : PolyORB.Any.Content_Ptr := null) return PolyORB.Any.Content_Ptr
   is
      use type PolyORB.Any.Content_Ptr;
      Target : PolyORB.Any.Content_Ptr;
   begin
      if Into /= null then
         if Into.all not in Content_Ü_StringArray then
            return null;
         end if;
         Target := Into;
         Content_Ü_StringArray (Target.all).V.all := ACC.V.all;
      else
         Target := new Content_Ü_StringArray;
         Content_Ü_StringArray (Target.all).V := new RI.StringArray'(ACC.V.all);
      end if;
      return Target;
   end Clone;

   procedure Finalize_Value
     (ACC : in out Content_Ü_StringArray)
   is
      procedure Free is new Ada.Unchecked_Deallocation
        (RI.StringArray, Ptr_Ü_StringArray);
   begin
      Free (ACC.V);
   end Finalize_Value;

   function Wrap (X : access RI.StringArray) return PolyORB.Any.Content'Class is
   begin
      return Content_Ü_StringArray'(PolyORB.Any.Aggregate_Content with V => Ptr_Ü_StringArray (X));
   end Wrap;

   function From_Any (Item : CORBA.Any) return RI.StringArray
   is
      Result : RI.StringArray;
      Aux    : array (Natural range 0 .. 0) of CORBA.Any;

   begin
      Aux (0) := Item;

      for J_Ü0 in 0 .. 20 - 1 loop
         Result (J_Ü0) :=
           CORBA.From_Any
           (CORBA.Internals.Get_Aggregate_Element
            (Aux (0),
             CORBA.TC_String,
             CORBA.Unsigned_Long (J_Ü0)));
      end loop;

      return Result;
   end From_Any;

   function To_Any
     (Item : RI.StringArray) return CORBA.Any
   is
      Result : array (Natural range 0 .. 0) of CORBA.Any;

   begin
      Result (0) :=
        CORBA.Internals.Get_Empty_Any_Aggregate
        (TC_StringArray);

      for J_Ü0 in 0 .. 20 - 1 loop
         CORBA.Internals.Add_Aggregate_Element
           (Result (0),
            CORBA.To_Any (Item (J_Ü0)));
      end loop;

      return Result (0);
   end To_Any;

   type Ptr_Ü_SegmentProperties is access all RI.SegmentProperties;
   type Content_Ü_SegmentProperties is
     new PolyORB.Any.Aggregate_Content with
   record
      V : Ptr_Ü_SegmentProperties;
   end record;

   function Get_Aggregate_Element
     (ACC   : not null access Content_Ü_SegmentProperties;
      TC    : PolyORB.Any.TypeCode.Object_Ptr;
      Index : PolyORB.Types.Unsigned_Long;
      Mech  : not null access PolyORB.Any.Mechanism) return PolyORB.Any.Content'Class;
   function Get_Aggregate_Count
     (ACC : Content_Ü_SegmentProperties) return PolyORB.Types.Unsigned_Long;
   procedure Set_Aggregate_Count
     (ACC : in out Content_Ü_SegmentProperties;
      Count : PolyORB.Types.Unsigned_Long);
   function Clone
     (ACC  : Content_Ü_SegmentProperties;
      Into : PolyORB.Any.Content_Ptr := null) return PolyORB.Any.Content_Ptr;
   procedure Finalize_Value
     (ACC : in out Content_Ü_SegmentProperties);

   function Get_Aggregate_Element
     (ACC   : not null access Content_Ü_SegmentProperties;
      TC    : PolyORB.Any.TypeCode.Object_Ptr;
      Index : PolyORB.Types.Unsigned_Long;
      Mech  : not null access PolyORB.Any.Mechanism) return PolyORB.Any.Content'Class
   is
      use type PolyORB.Types.Unsigned_Long;
      use type PolyORB.Any.Mechanism;
      pragma Suppress (Validity_Check);
      pragma Unreferenced (TC);
   begin
      Mech.all := PolyORB.Any.By_Reference;
      case Index is
         when 0 =>
            return CORBA.Wrap (ACC.V.Starting_Speed'Unrestricted_Access);
         when 1 =>
            return CORBA.Wrap (ACC.V.Leaving_Speed'Unrestricted_Access);
         when 2 =>
            return CORBA.Wrap (ACC.V.Segments'Unrestricted_Access);
         when others =>
            raise Constraint_Error;
      end case;
   end Get_Aggregate_Element;

   function Get_Aggregate_Count
     (ACC : Content_Ü_SegmentProperties) return PolyORB.Types.Unsigned_Long
   is
      pragma Unreferenced (ACC);
   begin
      return 3;
   end Get_Aggregate_Count;

   procedure Set_Aggregate_Count
     (ACC : in out Content_Ü_SegmentProperties;
      Count : PolyORB.Types.Unsigned_Long)
   is
      use type PolyORB.Types.Unsigned_Long;
      pragma Unreferenced (ACC);
   begin
      if Count /= 3 then
         raise Program_Error;
      end if;
   end Set_Aggregate_Count;

   function Clone
     (ACC  : Content_Ü_SegmentProperties;
      Into : PolyORB.Any.Content_Ptr := null) return PolyORB.Any.Content_Ptr
   is
      use type PolyORB.Any.Content_Ptr;
      Target : PolyORB.Any.Content_Ptr;
   begin
      if Into /= null then
         if Into.all not in Content_Ü_SegmentProperties then
            return null;
         end if;
         Target := Into;
         Content_Ü_SegmentProperties (Target.all).V.all := ACC.V.all;
      else
         Target := new Content_Ü_SegmentProperties;
         Content_Ü_SegmentProperties (Target.all).V := new RI.SegmentProperties'(ACC.V.all);
      end if;
      return Target;
   end Clone;

   procedure Finalize_Value
     (ACC : in out Content_Ü_SegmentProperties)
   is
      procedure Free is new Ada.Unchecked_Deallocation
        (RI.SegmentProperties, Ptr_Ü_SegmentProperties);
   begin
      Free (ACC.V);
   end Finalize_Value;

   function Wrap (X : access RI.SegmentProperties) return PolyORB.Any.Content'Class is
   begin
      return Content_Ü_SegmentProperties'(PolyORB.Any.Aggregate_Content with V => Ptr_Ü_SegmentProperties (X));
   end Wrap;

   function From_Any (Item : CORBA.Any) return RI.SegmentProperties is
      Index : CORBA.Any;
      Result_Starting_Speed : CORBA.Float;
      Result_Leaving_Speed : CORBA.Float;
      Result_Segments : CORBA.Unsigned_Short;
   begin
      Index := CORBA.Internals.Get_Aggregate_Element (Item,
                                            CORBA.TC_Float,
                                            CORBA.Unsigned_Long ( 0));
      Result_Starting_Speed := CORBA.From_Any (Index);
      Index := CORBA.Internals.Get_Aggregate_Element (Item,
                                            CORBA.TC_Float,
                                            CORBA.Unsigned_Long ( 1));
      Result_Leaving_Speed := CORBA.From_Any (Index);
      Index := CORBA.Internals.Get_Aggregate_Element (Item,
                                            CORBA.TC_Unsigned_Short,
                                            CORBA.Unsigned_Long ( 2));
      Result_Segments := CORBA.From_Any (Index);
      return
         (Starting_Speed => Result_Starting_Speed, 
          Leaving_Speed => Result_Leaving_Speed, 
          Segments => Result_Segments);
   end From_Any;

   function To_Any
     (Item : RI.SegmentProperties) return CORBA.Any is
      Result : CORBA.Any :=
         CORBA.Internals.Get_Empty_Any_Aggregate (TC_SegmentProperties);
   begin
      CORBA.Internals.Add_Aggregate_Element
         (Result, CORBA.To_Any (Item.Starting_Speed));
      CORBA.Internals.Add_Aggregate_Element
         (Result, CORBA.To_Any (Item.Leaving_Speed));
      CORBA.Internals.Add_Aggregate_Element
         (Result, CORBA.To_Any (Item.Segments));
      return Result;
   end To_Any;

   function IDL_SEQUENCE_RI_SegmentProperties_Element_Wrap (X : access RI.SegmentProperties) return PolyORB.Any.Content'Class is
   begin
      return RI.Helper.Wrap (X.all'Unrestricted_Access);
   end IDL_SEQUENCE_RI_SegmentProperties_Element_Wrap;

   package IDL_SEQUENCE_RI_SegmentProperties_Helper is new IDL_SEQUENCE_RI_SegmentProperties.CORBA_Helper
     (Element_To_Any   => RI.Helper.To_Any,
      Element_From_Any => RI.Helper.From_Any,
      Element_Wrap     => IDL_SEQUENCE_RI_SegmentProperties_Element_Wrap);

   function From_Any (Item : CORBA.Any) return RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence
     renames IDL_SEQUENCE_RI_SegmentProperties_Helper.From_Any;

   function To_Any
     (Item : RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence) return CORBA.Any
     renames IDL_SEQUENCE_RI_SegmentProperties_Helper.To_Any;

   function Wrap (X : access RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence) return PolyORB.Any.Content'Class
     renames IDL_SEQUENCE_RI_SegmentProperties_Helper.Wrap;

   function From_Any (Item : CORBA.Any) return RI.LPtrack
   is
   begin
      return RI.LPtrack (RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence'(RI.Helper.From_Any (Item)));
   end From_Any;

   function To_Any
     (Item : RI.LPtrack) return CORBA.Any
   is
      Result : CORBA.Any := RI.Helper.To_Any (RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence (Item));
   begin
      CORBA.Internals.Set_Type (Result, TC_LPtrack);
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
         Name : constant CORBA.String := CORBA.To_CORBA_String ("StringSequence");
         Id : constant CORBA.String := CORBA.To_CORBA_String ("IDL:RI/StringSequence:1.0");
      begin
         TC_StringSequence := CORBA.TypeCode.Internals.Build_Alias_TC
           (Name => Name, Id => Id, Parent => RI.Helper.TC_IDL_SEQUENCE_string);
         CORBA.TypeCode.Internals.Disable_Reference_Counting (TC_StringSequence);
      end;

      declare
      begin
         TC_StringArray :=
           CORBA.TypeCode.Internals.To_CORBA_Object (PolyORB.Any.TypeCode.TC_Array);
         CORBA.Internals.Add_Parameter (TC_StringArray, CORBA.To_Any (CORBA.Unsigned_Long (20)));
         CORBA.Internals.Add_Parameter (TC_StringArray, CORBA.To_Any (CORBA.TC_String));
         CORBA.TypeCode.Internals.Disable_Reference_Counting (TC_StringArray);
      end;

      declare
         Name : constant CORBA.String := CORBA.To_CORBA_String ("SegmentProperties");
         Id : constant CORBA.String := CORBA.To_CORBA_String ("IDL:RI/SegmentProperties:1.0");
         Arg_Name_Starting_Speed : constant CORBA.String := CORBA.To_CORBA_String ("Starting_Speed");
         Arg_Name_Leaving_Speed : constant CORBA.String := CORBA.To_CORBA_String ("Leaving_Speed");
         Arg_Name_Segments : constant CORBA.String := CORBA.To_CORBA_String ("Segments");
      begin
         TC_SegmentProperties :=
           CORBA.TypeCode.Internals.To_CORBA_Object (PolyORB.Any.TypeCode.TC_Struct);
         CORBA.Internals.Add_Parameter (TC_SegmentProperties, CORBA.To_Any (Name));
         CORBA.Internals.Add_Parameter (TC_SegmentProperties, CORBA.To_Any (Id));
         CORBA.Internals.Add_Parameter (TC_SegmentProperties, CORBA.To_Any (CORBA.TC_Float));
         CORBA.Internals.Add_Parameter (TC_SegmentProperties, CORBA.To_Any (Arg_Name_Starting_Speed));
         CORBA.Internals.Add_Parameter (TC_SegmentProperties, CORBA.To_Any (CORBA.TC_Float));
         CORBA.Internals.Add_Parameter (TC_SegmentProperties, CORBA.To_Any (Arg_Name_Leaving_Speed));
         CORBA.Internals.Add_Parameter (TC_SegmentProperties, CORBA.To_Any (CORBA.TC_Unsigned_Short));
         CORBA.Internals.Add_Parameter (TC_SegmentProperties, CORBA.To_Any (Arg_Name_Segments));
         CORBA.TypeCode.Internals.Disable_Reference_Counting (TC_SegmentProperties);
      end;

      TC_IDL_SEQUENCE_RI_SegmentProperties := 
        CORBA.TypeCode.Internals.Build_Sequence_TC
          (RI.Helper.TC_SegmentProperties, 0);
      CORBA.TypeCode.Internals.Disable_Reference_Counting (TC_IDL_SEQUENCE_RI_SegmentProperties);
      IDL_SEQUENCE_RI_SegmentProperties_Helper.Initialize
        (Element_TC  => RI.Helper.TC_SegmentProperties,
         Sequence_TC => TC_IDL_SEQUENCE_RI_SegmentProperties);

      declare
         Name : constant CORBA.String := CORBA.To_CORBA_String ("LPtrack");
         Id : constant CORBA.String := CORBA.To_CORBA_String ("IDL:RI/LPtrack:1.0");
      begin
         TC_LPtrack := CORBA.TypeCode.Internals.Build_Alias_TC
           (Name => Name, Id => Id, Parent => RI.Helper.TC_IDL_SEQUENCE_RI_SegmentProperties);
         CORBA.TypeCode.Internals.Disable_Reference_Counting (TC_LPtrack);
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
         (Name      => +"RI.Helper",
          Conflicts => PolyORB.Initialization.String_Lists.Empty,
          Depends   =>
                  +"any"
          ,
          Provides  => PolyORB.Initialization.String_Lists.Empty,
          Implicit  => False,
          Init      => Deferred_Initialization'Access,
          Shutdown  => null));
   end;

end RI.Helper;
