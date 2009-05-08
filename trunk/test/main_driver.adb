with Race; use Race;
with Race.Driver;
with Text_IO;
with ada.strings.unbounded;use ada.strings.unbounded;



procedure main is
   use Text_IO;
   micheal:String_array_T(1..7);
   fernando:substring_array_T(1..7);
   pilota : Race.Driver.Driver_Ref_T;
begin

   micheal(1):= to_unbounded_string("Micheal");
   micheal(2):= to_unbounded_string("1");
   micheal(3):= to_unbounded_string("Ferrari");
   micheal(4):= to_unbounded_string("100");
   micheal(5):= to_unbounded_string("100");
   micheal(6):= to_unbounded_string("340");
   micheal(7):= to_unbounded_string("1,2");

   fernando(1)(1..8):="Fernando";
   fernando(2)(1..1):="2";
   fernando(3)(1..8):="Benetton";
   fernando(4)(1..2):="80";
   fernando(5)(1..2):="85";
   fernando(6)(1..3):="330";
   fernando(7)(1..1):="2";

   put_line("Arrays initiated");

   pilota:=new Race.Driver.Driver;

   put_line("Initializating Driver...");

   pilota.init(micheal,1,55,2);
end main;
