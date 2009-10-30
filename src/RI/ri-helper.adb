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
with Ada.Unchecked_Conversion;
with Ada.Unchecked_Deallocation;
with PolyORB.Utils.Strings;
with PolyORB.Utils.Strings.Lists;
with PolyORB.Initialization;

package body RI.Helper is

   
   package body Internals is

      --------------------------------------
      -- IDL_SEQUENCE_string_Element_Wrap --
      --------------------------------------

      function IDL_SEQUENCE_string_Element_Wrap
        (X : access CORBA.String)
        return PolyORB.Any.Content'Class
      is
      begin
         return CORBA.Wrap
           (X.all'Unrestricted_Access);
      end IDL_SEQUENCE_string_Element_Wrap;

      function Wrap
        (X : access RI.IDL_SEQUENCE_string.Sequence)
        return PolyORB.Any.Content'Class
        renames IDL_SEQUENCE_string_Helper.Wrap;

      IDL_SEQUENCE_string_Initialized : PolyORB.Std.Boolean :=
        False;

      ------------------------------------
      -- Initialize_IDL_SEQUENCE_string --
      ------------------------------------

      procedure Initialize_IDL_SEQUENCE_string is
      begin
         if not IDL_SEQUENCE_string_Initialized
         then
            IDL_SEQUENCE_string_Initialized :=
              True;
            RI.Helper.TC_IDL_SEQUENCE_string :=
              CORBA.TypeCode.Internals.Build_Sequence_TC
                 (CORBA.TC_String,
                  0);
            CORBA.TypeCode.Internals.Disable_Reference_Counting
              (RI.Helper.TC_IDL_SEQUENCE_string);
            IDL_SEQUENCE_string_Helper.Initialize
              (Element_TC => CORBA.TC_String,
               Sequence_TC => RI.Helper.TC_IDL_SEQUENCE_string);
         end if;
      end Initialize_IDL_SEQUENCE_string;

      StringSequence_Initialized : PolyORB.Std.Boolean :=
        False;

      -------------------------------
      -- Initialize_StringSequence --
      -------------------------------

      procedure Initialize_StringSequence is
         Name_Ü : constant CORBA.String :=
           CORBA.To_CORBA_String
              ("StringSequence");
         Id_Ü : constant CORBA.String :=
           CORBA.To_CORBA_String
              ("IDL:RI/StringSequence:1.0");
      begin
         if not StringSequence_Initialized
         then
            StringSequence_Initialized :=
              True;
            RI.Helper.Internals.Initialize_IDL_SEQUENCE_string;
            RI.Helper.TC_StringSequence :=
              CORBA.TypeCode.Internals.Build_Alias_TC
                 (Name => Name_Ü,
                  Id => Id_Ü,
                  Parent => RI.Helper.TC_IDL_SEQUENCE_string);
            CORBA.TypeCode.Internals.Disable_Reference_Counting
              (RI.Helper.TC_StringSequence);
         end if;
      end Initialize_StringSequence;

      ---------------------------
      -- Get_Aggregate_Element --
      ---------------------------

      function Get_Aggregate_Element
        (Acc : not null access Content_Ü_StringArray;
         Tc : PolyORB.Any.TypeCode.Object_Ptr;
         Index : PolyORB.Types.Unsigned_Long;
         Mech : not null access PolyORB.Any.Mechanism)
        return PolyORB.Any.Content'Class
      is
         use type PolyORB.Types.Unsigned_Long;
         use type PolyORB.Any.Mechanism;
         pragma Suppress (Validity_Check);
         pragma Unreferenced (Tc);
      begin
         Mech.all :=
           PolyORB.Any.By_Reference;
         return CORBA.Wrap
           (Acc.V
              (PolyORB.Std.Integer
                 (Index))'Unrestricted_Access);
      end Get_Aggregate_Element;

      -------------------------
      -- Get_Aggregate_Count --
      -------------------------

      function Get_Aggregate_Count
        (Acc : Content_Ü_StringArray)
        return PolyORB.Types.Unsigned_Long
      is
         pragma Unreferenced (Acc);
      begin
         return Lengths_Ü_StringArray
           (1);
      end Get_Aggregate_Count;

      -------------------------
      -- Set_Aggregate_Count --
      -------------------------

      procedure Set_Aggregate_Count
        (Acc : in out Content_Ü_StringArray;
         Count : PolyORB.Types.Unsigned_Long)
      is
         use type PolyORB.Types.Unsigned_Long;
         pragma Unreferenced (Acc);
      begin
         if (Count
            /= Lengths_Ü_StringArray
              (1))
         then
            raise Program_Error;
         end if;
      end Set_Aggregate_Count;

      ---------------------
      -- Unchecked_Get_V --
      ---------------------

      function Unchecked_Get_V
        (Acc : not null access Content_Ü_StringArray)
        return System.Address
      is
         function To_Address
           is new Ada.Unchecked_Conversion
              (Ptr_Ü_StringArray,
               System.Address);
      begin
         return To_Address
           (Acc.V);
      end Unchecked_Get_V;

      -----------
      -- Clone --
      -----------

      function Clone
        (Acc : Content_Ü_StringArray;
         Into : PolyORB.Any.Content_Ptr := null)
        return PolyORB.Any.Content_Ptr
      is
         use type PolyORB.Any.Content_Ptr;
         Target : PolyORB.Any.Content_Ptr;
      begin
         if (Into
            /= null)
         then
            if (Into.all
               not in Content_Ü_StringArray)
            then
               return null;
            end if;
            Target :=
              Into;
            Content_Ü_StringArray
              (Target.all).V.all :=
              Acc.V.all;
         else
            Target :=
              new Content_Ü_StringArray;
            Content_Ü_StringArray
              (Target.all).V :=
              new RI.StringArray'
                 (Acc.V.all);
         end if;
         return Target;
      end Clone;

      --------------------
      -- Finalize_Value --
      --------------------

      procedure Finalize_Value
        (Acc : in out Content_Ü_StringArray)
      is
         procedure Free
           is new Ada.Unchecked_Deallocation
              (RI.StringArray,
               Ptr_Ü_StringArray);
      begin
         Free
           (Acc.V);
      end Finalize_Value;

      ----------
      -- Wrap --
      ----------

      function Wrap
        (X : access RI.StringArray)
        return PolyORB.Any.Content'Class
      is
      begin
         return Content_Ü_StringArray'
           (PolyORB.Any.Aggregate_Content with
            V => Ptr_Ü_StringArray
              (X));
      end Wrap;

      StringArray_Array_Initialized : PolyORB.Std.Boolean :=
        False;

      ----------------------------------
      -- Initialize_StringArray_Array --
      ----------------------------------

      procedure Initialize_StringArray_Array is
      begin
         if not StringArray_Array_Initialized
         then
            StringArray_Array_Initialized :=
              True;
            RI.Helper.TC_StringArray :=
              CORBA.TypeCode.Internals.To_CORBA_Object
                 (PolyORB.Any.TypeCode.TC_Array);
            CORBA.Internals.Add_Parameter
              (TC_StringArray,
               CORBA.To_Any
                 (CORBA.Unsigned_Long
                    (20)));
            CORBA.Internals.Add_Parameter
              (TC_StringArray,
               CORBA.To_Any
                 (CORBA.TC_String));
            CORBA.TypeCode.Internals.Disable_Reference_Counting
              (RI.Helper.TC_StringArray);
         end if;
      end Initialize_StringArray_Array;

      ---------------------------
      -- Get_Aggregate_Element --
      ---------------------------

      function Get_Aggregate_Element
        (Acc : not null access Content_Ü_SegmentProperties;
         Tc : PolyORB.Any.TypeCode.Object_Ptr;
         Index : PolyORB.Types.Unsigned_Long;
         Mech : not null access PolyORB.Any.Mechanism)
        return PolyORB.Any.Content'Class
      is
         use type PolyORB.Types.Unsigned_Long;
         use type PolyORB.Any.Mechanism;
         pragma Suppress (Validity_Check);
         pragma Unreferenced (Tc);
      begin
         Mech.all :=
           PolyORB.Any.By_Reference;
         case Index is
            when 0 =>
               return CORBA.Wrap
                 (Acc.V.Starting_Speed'Unrestricted_Access);
            when 1 =>
               return CORBA.Wrap
                 (Acc.V.Leaving_Speed'Unrestricted_Access);
            when 2 =>
               return CORBA.Wrap
                 (Acc.V.Segments'Unrestricted_Access);
            when others =>
               raise Constraint_Error;

         end case;
      end Get_Aggregate_Element;

      -------------------------
      -- Get_Aggregate_Count --
      -------------------------

      function Get_Aggregate_Count
        (Acc : Content_Ü_SegmentProperties)
        return PolyORB.Types.Unsigned_Long
      is
         pragma Unreferenced (Acc);
      begin
         return 3;
      end Get_Aggregate_Count;

      -------------------------
      -- Set_Aggregate_Count --
      -------------------------

      procedure Set_Aggregate_Count
        (Acc : in out Content_Ü_SegmentProperties;
         Count : PolyORB.Types.Unsigned_Long)
      is
         use type PolyORB.Types.Unsigned_Long;
         pragma Unreferenced (Acc);
      begin
         if (Count
            /= 3)
         then
            raise Program_Error;
         end if;
      end Set_Aggregate_Count;

      ---------------------
      -- Unchecked_Get_V --
      ---------------------

      function Unchecked_Get_V
        (Acc : not null access Content_Ü_SegmentProperties)
        return System.Address
      is
         function To_Address
           is new Ada.Unchecked_Conversion
              (Ptr_Ü_SegmentProperties,
               System.Address);
      begin
         return To_Address
           (Acc.V);
      end Unchecked_Get_V;

      -----------
      -- Clone --
      -----------

      function Clone
        (Acc : Content_Ü_SegmentProperties;
         Into : PolyORB.Any.Content_Ptr := null)
        return PolyORB.Any.Content_Ptr
      is
         use type PolyORB.Any.Content_Ptr;
         Target : PolyORB.Any.Content_Ptr;
      begin
         if (Into
            /= null)
         then
            if (Into.all
               not in Content_Ü_SegmentProperties)
            then
               return null;
            end if;
            Target :=
              Into;
            Content_Ü_SegmentProperties
              (Target.all).V.all :=
              Acc.V.all;
         else
            Target :=
              new Content_Ü_SegmentProperties;
            Content_Ü_SegmentProperties
              (Target.all).V :=
              new RI.SegmentProperties'
                 (Acc.V.all);
         end if;
         return Target;
      end Clone;

      --------------------
      -- Finalize_Value --
      --------------------

      procedure Finalize_Value
        (Acc : in out Content_Ü_SegmentProperties)
      is
         procedure Free
           is new Ada.Unchecked_Deallocation
              (RI.SegmentProperties,
               Ptr_Ü_SegmentProperties);
      begin
         Free
           (Acc.V);
      end Finalize_Value;

      ----------
      -- Wrap --
      ----------

      function Wrap
        (X : access RI.SegmentProperties)
        return PolyORB.Any.Content'Class
      is
      begin
         return Content_Ü_SegmentProperties'
           (PolyORB.Any.Aggregate_Content with
            V => Ptr_Ü_SegmentProperties
              (X));
      end Wrap;

      SegmentProperties_Initialized : PolyORB.Std.Boolean :=
        False;

      ----------------------------------
      -- Initialize_SegmentProperties --
      ----------------------------------

      procedure Initialize_SegmentProperties is
         Name_Ü : constant CORBA.String :=
           CORBA.To_CORBA_String
              ("SegmentProperties");
         Id_Ü : constant CORBA.String :=
           CORBA.To_CORBA_String
              ("IDL:RI/SegmentProperties:1.0");
         Argument_Name_Ü_Starting_Speed : constant CORBA.String :=
           CORBA.To_CORBA_String
              ("Starting_Speed");
         Argument_Name_Ü_Leaving_Speed : constant CORBA.String :=
           CORBA.To_CORBA_String
              ("Leaving_Speed");
         Argument_Name_Ü_Segments : constant CORBA.String :=
           CORBA.To_CORBA_String
              ("Segments");
      begin
         if not SegmentProperties_Initialized
         then
            SegmentProperties_Initialized :=
              True;
            RI.Helper.TC_SegmentProperties :=
              CORBA.TypeCode.Internals.To_CORBA_Object
                 (PolyORB.Any.TypeCode.TC_Struct);
            CORBA.Internals.Add_Parameter
              (TC_SegmentProperties,
               CORBA.To_Any
                 (Name_Ü));
            CORBA.Internals.Add_Parameter
              (TC_SegmentProperties,
               CORBA.To_Any
                 (Id_Ü));
            CORBA.Internals.Add_Parameter
              (TC_SegmentProperties,
               CORBA.To_Any
                 (CORBA.TC_Float));
            CORBA.Internals.Add_Parameter
              (TC_SegmentProperties,
               CORBA.To_Any
                 (Argument_Name_Ü_Starting_Speed));
            CORBA.Internals.Add_Parameter
              (TC_SegmentProperties,
               CORBA.To_Any
                 (CORBA.TC_Float));
            CORBA.Internals.Add_Parameter
              (TC_SegmentProperties,
               CORBA.To_Any
                 (Argument_Name_Ü_Leaving_Speed));
            CORBA.Internals.Add_Parameter
              (TC_SegmentProperties,
               CORBA.To_Any
                 (CORBA.TC_Unsigned_Short));
            CORBA.Internals.Add_Parameter
              (TC_SegmentProperties,
               CORBA.To_Any
                 (Argument_Name_Ü_Segments));
            CORBA.TypeCode.Internals.Disable_Reference_Counting
              (RI.Helper.TC_SegmentProperties);
         end if;
      end Initialize_SegmentProperties;

      ----------------------------------------------------
      -- IDL_SEQUENCE_RI_SegmentProperties_Element_Wrap --
      ----------------------------------------------------

      function IDL_SEQUENCE_RI_SegmentProperties_Element_Wrap
        (X : access RI.SegmentProperties)
        return PolyORB.Any.Content'Class
      is
      begin
         return RI.Helper.Internals.Wrap
           (X.all'Unrestricted_Access);
      end IDL_SEQUENCE_RI_SegmentProperties_Element_Wrap;

      function Wrap
        (X : access RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence)
        return PolyORB.Any.Content'Class
        renames IDL_SEQUENCE_RI_SegmentProperties_Helper.Wrap;

      IDL_SEQUENCE_RI_SegmentProperties_Initialized : PolyORB.Std.Boolean :=
        False;

      --------------------------------------------------
      -- Initialize_IDL_SEQUENCE_RI_SegmentProperties --
      --------------------------------------------------

      procedure Initialize_IDL_SEQUENCE_RI_SegmentProperties is
      begin
         if not IDL_SEQUENCE_RI_SegmentProperties_Initialized
         then
            IDL_SEQUENCE_RI_SegmentProperties_Initialized :=
              True;
            RI.Helper.Internals.Initialize_SegmentProperties;
            RI.Helper.TC_IDL_SEQUENCE_RI_SegmentProperties :=
              CORBA.TypeCode.Internals.Build_Sequence_TC
                 (RI.Helper.TC_SegmentProperties,
                  0);
            CORBA.TypeCode.Internals.Disable_Reference_Counting
              (RI.Helper.TC_IDL_SEQUENCE_RI_SegmentProperties);
            IDL_SEQUENCE_RI_SegmentProperties_Helper.Initialize
              (Element_TC => RI.Helper.TC_SegmentProperties,
               Sequence_TC => RI.Helper.TC_IDL_SEQUENCE_RI_SegmentProperties);
         end if;
      end Initialize_IDL_SEQUENCE_RI_SegmentProperties;

      LPtrack_Initialized : PolyORB.Std.Boolean :=
        False;

      ------------------------
      -- Initialize_LPtrack --
      ------------------------

      procedure Initialize_LPtrack is
         Name_Ü : constant CORBA.String :=
           CORBA.To_CORBA_String
              ("LPtrack");
         Id_Ü : constant CORBA.String :=
           CORBA.To_CORBA_String
              ("IDL:RI/LPtrack:1.0");
      begin
         if not LPtrack_Initialized
         then
            LPtrack_Initialized :=
              True;
            RI.Helper.Internals.Initialize_IDL_SEQUENCE_RI_SegmentProperties;
            RI.Helper.TC_LPtrack :=
              CORBA.TypeCode.Internals.Build_Alias_TC
                 (Name => Name_Ü,
                  Id => Id_Ü,
                  Parent => RI.Helper.TC_IDL_SEQUENCE_RI_SegmentProperties);
            CORBA.TypeCode.Internals.Disable_Reference_Counting
              (RI.Helper.TC_LPtrack);
         end if;
      end Initialize_LPtrack;

   end Internals;

   function From_Any
     (Item : CORBA.Any)
     return RI.IDL_SEQUENCE_string.Sequence
     renames RI.Helper.Internals.IDL_SEQUENCE_string_Helper.From_Any;

   function To_Any
     (Item : RI.IDL_SEQUENCE_string.Sequence)
     return CORBA.Any
     renames RI.Helper.Internals.IDL_SEQUENCE_string_Helper.To_Any;

   --------------
   -- From_Any --
   --------------

   function From_Any
     (Item : CORBA.Any)
     return RI.StringSequence
   is
      Result : constant RI.IDL_SEQUENCE_string.Sequence :=
        RI.Helper.From_Any
           (Item);
   begin
      return RI.StringSequence
        (Result);
   end From_Any;

   ------------
   -- To_Any --
   ------------

   function To_Any
     (Item : RI.StringSequence)
     return CORBA.Any
   is
      Result : CORBA.Any :=
        RI.Helper.To_Any
           (RI.IDL_SEQUENCE_string.Sequence
              (Item));
   begin
      CORBA.Internals.Set_Type
        (Result,
         TC_StringSequence);
      return Result;
   end To_Any;

   --------------
   -- From_Any --
   --------------

   function From_Any
     (Item : CORBA.Any)
     return RI.StringArray
   is
      Result : RI.StringArray;
      Aux : array (0 .. 0) of CORBA.Any;
   begin
      Aux
        (0) :=
        Item;
      for I0_Ü in 0 .. 19 loop
         Result
           (I0_Ü) :=
           CORBA.From_Any
              (CORBA.Internals.Get_Aggregate_Element
                 (Aux
                    (0),
                  CORBA.TC_String,
                  CORBA.Unsigned_Long
                    (I0_Ü)));
      end loop;
      return Result;
   end From_Any;

   ------------
   -- To_Any --
   ------------

   function To_Any
     (Item : RI.StringArray)
     return CORBA.Any
   is
      Result : array (0 .. 0) of CORBA.Any;
   begin
      Result
        (0) :=
        CORBA.Internals.Get_Empty_Any_Aggregate
           (RI.Helper.TC_StringArray);
      for I0_Ü in 0 .. 19 loop
         CORBA.Internals.Add_Aggregate_Element
           (Result
              (0),
            CORBA.To_Any
              (Item
                 (I0_Ü)));
      end loop;
      return Result
        (0);
   end To_Any;

   --------------
   -- From_Any --
   --------------

   function From_Any
     (Item : CORBA.Any)
     return RI.SegmentProperties
   is
      Index_Ü : CORBA.Any;
      Result_Ü_Starting_Speed : CORBA.Float;
      Result_Ü_Leaving_Speed : CORBA.Float;
      Result_Ü_Segments : CORBA.Unsigned_Short;
   begin
      Index_Ü :=
        CORBA.Internals.Get_Aggregate_Element
           (Item,
            CORBA.TC_Float,
            CORBA.Unsigned_Long
              (0));
      Result_Ü_Starting_Speed :=
        CORBA.From_Any
           (Index_Ü);
      Index_Ü :=
        CORBA.Internals.Get_Aggregate_Element
           (Item,
            CORBA.TC_Float,
            CORBA.Unsigned_Long
              (1));
      Result_Ü_Leaving_Speed :=
        CORBA.From_Any
           (Index_Ü);
      Index_Ü :=
        CORBA.Internals.Get_Aggregate_Element
           (Item,
            CORBA.TC_Unsigned_Short,
            CORBA.Unsigned_Long
              (2));
      Result_Ü_Segments :=
        CORBA.From_Any
           (Index_Ü);
      return (Starting_Speed => Result_Ü_Starting_Speed,
      Leaving_Speed => Result_Ü_Leaving_Speed,
      Segments => Result_Ü_Segments);
   end From_Any;

   ------------
   -- To_Any --
   ------------

   function To_Any
     (Item : RI.SegmentProperties)
     return CORBA.Any
   is
      Result : CORBA.Any :=
        CORBA.Internals.Get_Empty_Any_Aggregate
           (TC_SegmentProperties);
   begin
      CORBA.Internals.Add_Aggregate_Element
        (Result,
         CORBA.To_Any
           (Item.Starting_Speed));
      CORBA.Internals.Add_Aggregate_Element
        (Result,
         CORBA.To_Any
           (Item.Leaving_Speed));
      CORBA.Internals.Add_Aggregate_Element
        (Result,
         CORBA.To_Any
           (Item.Segments));
      return Result;
   end To_Any;

   function From_Any
     (Item : CORBA.Any)
     return RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence
     renames RI.Helper.Internals.IDL_SEQUENCE_RI_SegmentProperties_Helper.From_Any;

   function To_Any
     (Item : RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence)
     return CORBA.Any
     renames RI.Helper.Internals.IDL_SEQUENCE_RI_SegmentProperties_Helper.To_Any;

   --------------
   -- From_Any --
   --------------

   function From_Any
     (Item : CORBA.Any)
     return RI.LPtrack
   is
      Result : constant RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence :=
        RI.Helper.From_Any
           (Item);
   begin
      return RI.LPtrack
        (Result);
   end From_Any;

   ------------
   -- To_Any --
   ------------

   function To_Any
     (Item : RI.LPtrack)
     return CORBA.Any
   is
      Result : CORBA.Any :=
        RI.Helper.To_Any
           (RI.IDL_SEQUENCE_RI_SegmentProperties.Sequence
              (Item));
   begin
      CORBA.Internals.Set_Type
        (Result,
         TC_LPtrack);
      return Result;
   end To_Any;

   -----------------------------
   -- Deferred_Initialization --
   -----------------------------

   procedure Deferred_Initialization is
   begin
      RI.Helper.Internals.Initialize_IDL_SEQUENCE_string;
      RI.Helper.Internals.Initialize_StringSequence;
      RI.Helper.Internals.Initialize_StringArray_Array;
      RI.Helper.Internals.Initialize_SegmentProperties;
      RI.Helper.Internals.Initialize_IDL_SEQUENCE_RI_SegmentProperties;
      RI.Helper.Internals.Initialize_LPtrack;
   end Deferred_Initialization;

begin
   declare
      use PolyORB.Utils.Strings;
      use PolyORB.Utils.Strings.Lists;
   begin
      PolyORB.Initialization.Register_Module
        (PolyORB.Initialization.Module_Info'
           (Name => +"RI.Helper",
            Conflicts => PolyORB.Utils.Strings.Lists.Empty,
            Depends => +"any"
               & "corba",
            Provides => PolyORB.Utils.Strings.Lists.Empty,
            Implicit => False,
            Init => Deferred_Initialization'Access,
            Shutdown => null));
   end;
end RI.Helper;
