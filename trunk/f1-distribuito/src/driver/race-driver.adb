--------------------------------------------------------
--  Copyright (C) 2009                                --
--  Daniele Bonaldo, Alberto Zatton                   --
--                                                    --
--  F1Sim-scd 1.0                                     --
--                                                    --
--  Concurrent and Distributed Systems class project  --
--  Master Degree in Computer Science                 --
--  Academic year 2008/2009                           --
--  Dept. of Pure and Applied Mathematics             --
--  University of Padua, Italy                        --
--                                                    --
--  This program is free software; you can            --
--  redistribute it and/or modify it under the terms  --
--  of the GNU General Public License as published    --
--  by the Free Software Foundation; either           --
--  version 2 of the License, or (at your option)     --
--  any later version.                                --
--------------------------------------------------------

with Ada.Integer_Text_IO;
with Text_IO;
with Ada.Strings.unbounded;
with Ada.Command_Line;
--with Race.Circuit;
with Race.IorReader;
with Ada.Calendar;
with Ada.Numerics.Elementary_Functions;
with Ada.Float_Text_IO;

--CORBA imports
with CORBA.Impl;
with CORBA.Object;
with CORBA.ORB;
with PortableServer.POA.Helper;
with PortableServer.POAManager;
with CosNaming;
with Cosnaming.NamingContextExt;
with Cosnaming.NamingContext;
with RI.driver_RI.Impl;
with RI.Circuit_RI;
with RI.Circuit_RI.Helper;
with RI.Log_viewer;
with RI.Log_viewer.Helper;
with PolyORB.CORBA_P.CORBALOC;

with Polyorb.Setup.Thread_Per_Request_Server;
pragma Warnings (Off, PolyORB.Setup.Thread_Per_Request_Server);

package body Race.Driver is


   task body the_Driver is
      use Text_IO;
      --use Race.Circuit;
      use Ada.Strings.Unbounded;
      use ada.Calendar;
      use Ada.Numerics.Elementary_Functions;
      Name: Ada.Strings.Unbounded.Unbounded_String;
      ID_positive: Positive;
      ID : CORBA.Short;
      Team: Ada.Strings.Unbounded.Unbounded_String;
      Accel: Positive;
      Brake: Positive;
      MSpeed: float;
      Strategy: Strategy_T(0..5);--max 5 pit stops
      Strategy_lenght : Natural := 0;
      Strategy_index : Natural := 0;
      go_box : Integer := -1;
      Laps_Done: Natural := 0;
      Tot_Laps: Positive;
      LP_track: LP_Track_Ref_T;
      Initial_Position: Positive;
      Position: Positive;
      Wake : Time;
      lane : Positive := 1;

      -- log base for acceleration
      -- acceleration is usually 1,45 g (14,25 m/s^2) in F1
      -- less log_a_base = more acceleration
      log_a_base : float := 1.07500E+00;

      -- log base for deceleration
      -- deceleration is usually 4 g (39 m/s^2) in F1
      -- less log_d_base = more brake power = delayed brakes
      log_d_base : float := 1.05450E+00;

      accel_lenght : float:=1.00000E+00;
      decel_lenght : float:=1.00000E+00;
      entering_speed : float := 0.00000E+00;
      leaving_speed : float;
      avg_speed : float;
      meters_per_segment : constant float := 1.00000E+01;
      macro_index : Positive := 1;
      segment_index : Positive := 1;
      current_accel_lenght : float;
      next_segment_accel_lenght : float;
      brake_point : Natural;
      max_starting_speed : float;
      max_leaving_speed : float;
      brake_point_f : float;
      --brake_point_i : integer;
      box_index : positive := 1;
      LP_box: LP_Track_Ref_T;

      circuit 	:RI.Circuit_RI.Ref;
      logger	:RI.Log_viewer.Ref;

      -- task per pubblicare i metodi CORBA
      task type CORBAInit;
      task body CORBAInit is

         use CosNaming;
      	 use CosNaming.NamingContext;
         use CosNaming.NamingContextExt;
         use Ada.Strings.Unbounded;
         use Text_IO;
         use Ada.Command_Line;

         Argv 		: CORBA.ORB.Arg_List := CORBA.ORB.Command_Line_Arguments;
         Root_POA 	: PortableServer.POA.Local_Ref;

         -- the NamingService
         rootCxtExt	: CosNaming.NamingContextExt.Ref;
         IOR	 	: Ada.Strings.Unbounded.Unbounded_String;

         --the object to be published
         Obj 		: constant CORBA.Impl.Object_Ptr := new RI.driver_RI.Impl.Object;
         Ref 		: CORBA.Object.Ref;
         obj_name 	: CosNaming.Name;


      begin

         if Argument_Count /= 1 then
                Put_Line ("Missing driver ID.");
                Put_Line ("Usage : main_driver <ID>");
         end if;


        --  Retrieve Root POA
        CORBA.ORB.Init (CORBA.ORB.To_CORBA_String ("ORB"), Argv);

        Root_POA := PortableServer.POA.Helper.To_Local_Ref
                 (CORBA.ORB.Resolve_Initial_References
                    (CORBA.ORB.To_CORBA_String ("RootPOA")));


        PortableServer.POAManager.Activate
           (PortableServer.POA.Get_The_POAManager (Root_POA));


        --  Set up new object
        Ref := PortableServer.POA.Servant_To_Reference
                  (Root_POA, PortableServer.Servant (Obj));

        -- Read NameService IOR from file
        Race.IorReader.read_IOR(IOR);

        -- Getting the NameService
        CORBA.ORB.Initialize ("ORB");
      	CORBA.ORB.String_To_Object
        (CORBA.To_CORBA_String (TO_String(IOR)), rootCxtExt);

      	if Is_Nil (rootCxtExt) then
        	  Put_Line ("driver"& Ada.Command_Line.Argument (1) & " : cannot locate NameService");
    	end if;
         put("NameService IOR: ok ");new_line;

         -- Get circuit Remote Interface from Name Service
      	 Append (obj_name, NameComponent'(Id => To_CORBA_String ("Circuit"),
                                       Kind => To_CORBA_String ("")));
      	 circuit := RI.Circuit_RI.Helper.To_Ref(resolve_str(
                rootCxtExt,CosNaming.NamingContextExt.to_string(rootCxtExt,obj_name)));
         put_line("Got circuit from Name Service");

         -- Get logger Remote Interface from Name Service
         Replace_Element (obj_name, 1, NameComponent'(Id => To_CORBA_String ("Logger"),
                                       Kind => To_CORBA_String ("")));
      	 logger := RI.Log_viewer.Helper.To_Ref(resolve_str(
                rootCxtExt,CosNaming.NamingContextExt.to_string(rootCxtExt,obj_name)));
      	 put_line("Got logger from Name Service");


         --  Bind in Name Service
         Replace_Element (obj_name, 1, NameComponent'(Id => To_CORBA_String ("Driver" & Ada.Command_Line.Argument (1)),
                                         Kind => To_CORBA_String ("")));

         bind(rootCxtExt, obj_name, Ref);
         put_line("Driver Remote Inderface binded in Name Service");


         --  Launch the server
         CORBA.ORB.Run;

      end CORBAInit;
      type CORBAInit_Ref is access CORBAInit;
      CORBAInit_P : CORBAInit_Ref;


   begin
      Text_IO.put_line("Driver started");

      -- Start CORBA ORB and wait for init
      CORBAInit_P := new CORBAInit;

      accept init (params	: String_array_T;
                   position	: Positive;
                   track	: LP_track_T;
                   box		: LP_track_T;
                   laps		: Positive)
      do
         declare
            use Ada.Integer_Text_IO;
            use Ada.Strings.unbounded;
	    Strategy_string:String:=to_String(params(7));
            buffer_index_first: Natural:=1;
            buffer_index_last: Natural:=0;
	    buffer_index:integer:=0;--string_buffer index
	    index:integer:=1;--strategy string array index
            last:Positive;

         begin
            -- read strategy (lap numbers)  from params. Assume at least 1 pit stop.
            while (index<=Strategy_string'last) loop

               if strategy_string(index)>='0' and strategy_string(index)<='9' then
                  -- accumulate digits in the buffer
                  buffer_index_last := buffer_index_last + 1;
                  index:=index+1;
               else
                  -- convert string to lap number and flush the buffer
                  strategy_lenght := strategy_lenght +1;
                  get(strategy_string(buffer_index_first..buffer_index_last),
                      Strategy(strategy_lenght), Last);
                  buffer_index_first := index + 1;
                  buffer_index_last := index;
                  index := index + 1;
                end if;

            end loop;

            -- finally, convert last string to lap number and flush the buffer
            strategy_lenght := strategy_lenght +1;
            get(strategy_string(buffer_index_first..buffer_index_last),
                Strategy(strategy_lenght), Last);

            -- initialize all other parameters
            Name := params(1);
            get(to_String(params(3)),ID_positive,Last);
            Id := CORBA.Short(ID_positive);
            Team := params(2);
            get(to_String(params(4)),Accel,Last);
            get(to_String(params(5)),Brake,Last);
            Ada.Float_Text_IO.get(to_String(params(6)),MSpeed,Last);

            LP_track := new LP_track_T(track'range);
            index := 1;
            while index <= track'last loop
               LP_track(index) := track(index);
               index := index + 1;
            end loop;

            LP_box := new LP_track_T(box'range);
            index := 1;
            while index <= box'last loop
               LP_box(index) := box(index);
               index := index + 1;
            end loop;

            Tot_Laps := Laps;
            Initial_Position := Position;

            -- convert mspeed from km/h to m/s
            mspeed := mspeed / float(3_600) * float(1_000);

            --calculate acceleration log base with respect to driver's accel coeff
            --less log_t_base = more acceleration
            log_a_base := log_a_base - (float(accel*2)/float(10_000));


            --calculate deceleration log base with respect to driver's brake coeff
            --less log_d_base = more brake power = delayed brakes
            log_d_base := log_d_base - (float(brake)/float(10_000));

            if strategy_lenght > 0 then
               strategy_index := strategy_index + 1;
               go_box := strategy(strategy_index);
            end if;

         end;
      end init;

      -- line up driver
      Position := 1;
      put(to_string(Name));
      put(" lined up!");new_line;

      -- First segment of the race
--        LR_track.Element(Position).all.enter(entering_speed, lane);
      RI.Circuit_RI.enter(circuit,
                          CORBA.Long(Position),
                          CORBA.Float(entering_speed),
                          CORBA.Short(lane));

      RI.Log_viewer.updateLog (logger,
                              id,
                              CORBA.Long(Position),
                              CORBA.Float(entering_speed*float(3600)/float(1000)),
                              false);

      put(to_string(name));put(":");new_line;
      -- 10 meters of acceleration
      accel_lenght := accel_lenght + meters_per_segment;
      leaving_speed := log(accel_lenght, log_a_base);
      put("speed (km/h): ");
      ada.Float_Text_IO.put(leaving_speed*float(3600)/float(1000));new_line;
      avg_speed := ( entering_speed + leaving_speed )/ float(2);
      wake := clock + duration(meters_per_segment/avg_speed);
      delay until wake;

--        LR_track.Element(Position).all.leave(lane);
      RI.Circuit_RI.leave(circuit,
                          CORBA.Long(Position),
                          CORBA.Short(lane));

      Position := Position + 1;
      segment_index := segment_index + 1;
      --calculate when driver must brake to enter next macro segment
      if leaving_speed > LP_track(1).Leaving_Speed then
         current_accel_lenght := log_d_base**leaving_speed;
         next_segment_accel_lenght := log_d_base**LP_track(1).Leaving_Speed;
         brake_point := LP_track(1).Segments -
           integer((current_accel_lenght - next_segment_accel_lenght) / meters_per_segment);
      else
         brake_point := LP_track(1).Segments;
      end if;
      entering_speed := leaving_speed;
      --end first segment of the race

     -- main loop of driver
      while laps_done < tot_laps loop
         if laps_done = go_box then
            -- driver go to box, return to race in next macro segment
            while box_index <= LP_box(1).Segments loop
               -- perform a "drive through"
               -- brake first if necessary
               put(to_string(Name));
               put(" drive through box!");new_line;

--               LR_box.Element(box_index).all.enter(leaving_speed, lane);
               RI.Circuit_RI.enter_Box(circuit,
                          CORBA.Long(box_index),
                          CORBA.Float(leaving_speed),
                          CORBA.Short(lane));

               RI.Log_viewer.updateLog (logger,
                                        id,
                                        CORBA.Long(box_index),
                                        CORBA.Float(leaving_speed*float(3600)/float(1000)),
                                        true);

               if leaving_speed > LP_box(1).Starting_Speed then
                  decel_lenght := decel_lenght - meters_per_segment;
                  if decel_lenght > float(1) then
                     leaving_speed := log(decel_lenght, log_d_base);
                  else
                     leaving_speed := LP_box(1).Starting_Speed;
                  end if;

                  avg_speed := ( entering_speed + leaving_speed )/ float(2);
                  entering_speed := leaving_speed;
                  wake := clock + duration(meters_per_segment/avg_speed);

               else
                  wake := clock + duration(meters_per_segment/LP_box(1).Starting_Speed);
               end if;

               put("Speed:");
               ada.integer_Text_IO.put(integer(leaving_speed*float(3600)/float(1000)));new_line;
               delay until Wake;
--                 LR_box.Element(box_index).all.leave(lane);
               RI.Circuit_RI.leave_Box(circuit,
                                       CORBA.Long(box_index),
                          	       CORBA.Short(lane));
               box_index := box_index + 1;
            end loop;
            -- recalculate indexes and coeffs
            Position := Position + LP_track(macro_index).Segments;
            macro_index := macro_index + 1;
            entering_speed := LP_box(1).Starting_speed;
            leaving_speed := entering_speed;
            accel_lenght := log_a_base**leaving_speed;
            decel_lenght := log_d_base**leaving_speed;

            -- if driver must stop again
            if strategy_index < strategy_lenght then
               -- next pit stop
               strategy_index := strategy_index + 1;
               go_box := strategy(strategy_index);
            end if;

         end if;

         while macro_index <= LP_track'Last loop
            --calculate macro segment max speed with respect to driver skills
            max_starting_speed := LP_track(macro_index).Starting_Speed + (float(accel) / float(3_600) * float(1_000));
            max_leaving_speed := LP_track(macro_index).Leaving_Speed + (float(brake) / float(3_600) * float(1_000));

            -- acceleration loop
            while segment_index < brake_point loop
               --                 LR_track.Element(Position).all.enter(leaving_speed, lane);

               RI.Circuit_RI.enter(circuit,
                                   CORBA.Long(Position),
                                   CORBA.Float(leaving_speed),
                                   CORBA.Short(lane));

               RI.Log_viewer.updateLog (logger,
                                        id,
                                        CORBA.Long(Position),
                                        CORBA.Float(leaving_speed*float(3600)/float(1000)),
                                        false);

               put(to_string(Name));
               put(" is in segment ");
               ada.Integer_Text_IO.put(Position);
               put("[Accel!]");new_line;

               -- calc new speed with acceleration coefficient
               if leaving_speed < mspeed and leaving_speed < max_starting_speed then
                  if leaving_speed < entering_speed then
                     -- was blocked by a leading car!
                     -- brake to leading car speed
                     accel_lenght := log_a_base**leaving_speed;
                     entering_speed := leaving_speed;
                     put("[Blocked by leading car!]");new_line;

                  else
                     --  one segment of acceleration
                     accel_lenght := accel_lenght + meters_per_segment;
                     leaving_speed := log(accel_lenght, log_a_base);
                  end if;

                  -- if driver achieve max speed
                  if leaving_speed > mspeed or leaving_speed > max_starting_speed then
                     if mspeed > max_starting_speed then
                        leaving_speed := max_starting_speed;
                        accel_lenght := log_a_base**leaving_speed;
                     else
                        leaving_speed := mspeed;
                        accel_lenght := log_a_base**leaving_speed;
                     end if;
                  end if;

                  avg_speed := ( entering_speed + leaving_speed )/ float(2);

                  decel_lenght := log_d_base**leaving_speed;
               end if;

               -- calc wake time with respect to current driver speed
               wake := clock + duration(meters_per_segment/avg_speed);
--                 put("Wake: ");
--                 ada.Float_Text_IO.put(meters_per_segment/avg_speed);new_line;
               delay until Wake;
--                 LR_track.Element(Position).all.leave(lane);
               RI.Circuit_RI.leave(circuit,
                          CORBA.Long(Position),
                          CORBA.Short(lane));

               put("Speed: ");
               Ada.Integer_Text_IO.put(integer(leaving_speed*float(3600)/float(1000)));new_line;

               --calculate when driver must brake to enter next macro segment
               if leaving_speed > max_leaving_speed then
                  current_accel_lenght := log_d_base**leaving_speed;
                  next_segment_accel_lenght := log_d_base**max_leaving_speed;
                  brake_point_f := (current_accel_lenght - next_segment_accel_lenght) / meters_per_segment;
--                    brake_point_i := integer(brake_point_f);
--
--                    if float(brake_point_i) > brake_point_f then
--                       brake_point_f := brake_point_f - 5.00000E-01;
--                       brake_point_i := integer(brake_point_f);
--                    end if;

                  brake_point := LP_track(macro_index).Segments -
                    integer(brake_point_f);
               else
                  brake_point := LP_track(macro_index).Segments;
               end if;

               entering_speed := leaving_speed;
               segment_index := segment_index + 1;
               Position := Position + 1;
            end loop;
            -- end acceleration loop


            -- brake loop
            while segment_index <= LP_track(macro_index).Segments loop
--                 LR_track.Element(Position).all.enter(entering_speed, lane);
               RI.Circuit_RI.enter(circuit,
                                   CORBA.Long(Position),
                                   CORBA.Float(entering_speed),
                                   CORBA.Short(lane));

               RI.Log_viewer.updateLog (logger,
                                        id,
                                        CORBA.Long(Position),
                                        CORBA.Float(entering_speed*float(3600)/float(1000)),
                                        false);

               put(to_string(Name));
               put(" is in segment ");
               ada.Integer_Text_IO.put(Position);
               put("[Brake!]");new_line;
               if entering_speed < leaving_speed then
                  -- was blocked by a leading car!
                  -- save leading car speed in "entering_speed"
                  -- then try to brake whith normal driver deceleration:
                  -- if it's not enough assume leading car speed
                  put("[Blocked by leading car!]");new_line;
               end if;

               -- driver brakes
               -- calc new speed with deceleration coefficient
               if leaving_speed > max_leaving_speed then
                  --  one segment of deceleration
                  decel_lenght := decel_lenght - meters_per_segment;

                  if decel_lenght <= float(1) then
                     -- if driver decelerate to target speed in less than meters_per_segment
                     -- (to avoid negative log)
                     leaving_speed := max_leaving_speed;
                  else
                     -- if not, driver perform a deceleration of meters_per_segment
                     leaving_speed := log(decel_lenght, log_d_base);

                     if leaving_speed < max_leaving_speed then
                        leaving_speed := max_leaving_speed;
                     end if;
                  end if;



                  avg_speed := ( entering_speed + leaving_speed )/ float(2);

                  accel_lenght := log_a_base**leaving_speed;
               end if;

               if leaving_speed > entering_speed then
                  -- driver was blocked by a leading car
                  -- normal brake is not enough: assume leading car speed
                  avg_speed := entering_speed;
                  leaving_speed := entering_speed;
                  accel_lenght := log_a_base**leaving_speed;
               end if;

               -- calc wake time with respect to current driver speed
               wake := clock + duration(meters_per_segment/avg_speed);
--                 put("Wake: ");
--                 ada.Float_Text_IO.put(meters_per_segment/avg_speed);new_line;
               delay until Wake;
--                 LR_track.Element(Position).all.leave(lane);
               RI.Circuit_RI.leave(circuit,
                          CORBA.Long(Position),
                          CORBA.Short(lane));

               put("Speed: ");
               Ada.Integer_Text_IO.put(integer(leaving_speed*float(3600)/float(1000)));new_line;

               entering_speed := leaving_speed;
               Position := Position + 1;
               segment_index := segment_index + 1;
            end loop;

            macro_index := macro_index + 1;
            segment_index := 1;
            put("Entering macro_segment: ");
            Ada.Integer_Text_IO.put(macro_index);new_line;


         end loop;
	-- end brake loop
         laps_done := laps_done + 1;
         macro_index := 1;
         Position := 1;
      end loop;
    --end of main loop
end the_Driver;

end Race.Driver;
