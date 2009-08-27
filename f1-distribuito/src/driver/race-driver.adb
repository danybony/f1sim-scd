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
with Ada.Exceptions;
with Text_IO;
with Ada.Strings.unbounded;
with Ada.Command_Line;
with Ada.Calendar;
with Ada.Numerics.Elementary_Functions;
with Ada.Float_Text_IO;
with Ada.Numerics.Float_Random;

--CORBA imports
with Race.DriverCORBAInit;
with CORBA;
with CosNaming;
with Cosnaming.NamingContextExt;
with Cosnaming.NamingContext;
with RI.driver_RI.Impl;
with RI.Circuit_RI;
with RI.Circuit_RI.Helper;
with RI.Log_viewer.Helper;
with RI.Log_viewer;
with RI.Startup_RI;
with RI.Startup_RI.Helper;

package body Race.Driver is

   procedure notify_end_race (
                              ID 		: CORBA.Short;
                              reason		: integer;
                              rootCxtExt	: CosNaming.NamingContextExt.Ref;
                              logger		: RI.Log_viewer.Ref
                             ) is
      use text_io;
      use CosNaming;
      use CosNaming.NamingContext;
      use CosNaming.NamingContextExt;
      obj_name 		: CosNaming.Name;
      startup		: RI.Startup_RI.Ref;
   begin

      -- Get startup Remote Interface from Name Service
      Append (obj_name, NameComponent'(Id => To_CORBA_String ("Startup"),
                                       Kind => To_CORBA_String ("")));
      startup := RI.Startup_RI.Helper.To_Ref(resolve_str(
                rootCxtExt,CosNaming.NamingContextExt.to_string(rootCxtExt,obj_name)));

      case reason is

         when 1 =>
            put_line("Engine break!");

         when 2 =>
            put_line("Tire break!");

         when 3 =>
            put_line("Problems at box! Retired.");

         when 4 =>
            put_line("Crash into other car! Retired.");

         when 5 =>
            put_line("Circuit down.");


         when others =>
            null;

      end case;

      if reason /=0 then
         RI.Log_viewer.endRace (logger, ID, CORBA.Short(reason));
      end if;
      RI.Startup_RI.endRace(startup);
      put_line("Race ended.");

   end notify_end_race;



   task body the_Driver is
      use Text_IO;
      --use Race.Circuit;
      use Ada.Strings.Unbounded;
      use ada.Calendar;
      use Ada.Numerics.Elementary_Functions;
      use CosNaming;
      use CosNaming.NamingContext;
      use CosNaming.NamingContextExt;
      use Ada.Numerics.Float_Random;
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
      current_lane : Positive := 1;
      change_lane_delay : float := 0.001;

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
      box_index : positive := 1;
      LP_box: LP_Track_Ref_T;
      G : Generator;
      lucky_number : Ada.Numerics.Float_Random.Uniformly_Distributed;



      -- CORBA

      circuit 		:RI.Circuit_RI.Ref;
      logger		:RI.Log_viewer.Ref;
      startup		:RI.Startup_RI.Ref;
      obj_name 		: CosNaming.Name;
      CORBAInit_P 	: DriverCORBAInit.CORBAInit_Ref;
      rootCxtExt	: CosNaming.NamingContextExt.Ref;


   begin
      --------------------------------------------------------------------------
      --                       DRIVER THREAD BEGIN
      --------------------------------------------------------------------------
      Text_IO.put_line("Driver started");
      Reset(G);

      -- Start CORBA ORB and wait for init
      CORBAInit_P := new DriverCORBAInit.CORBAInit;
      CORBAInit_P.init(circuit,
                       logger,
                       rootCxtExt);

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

             -- Get circuit Remote Interface from Name Service
      	 Append (obj_name, NameComponent'(Id => To_CORBA_String ("Circuit"),
                                       Kind => To_CORBA_String ("")));
      	 circuit := RI.Circuit_RI.Helper.To_Ref(resolve_str(
                rootCxtExt,CosNaming.NamingContextExt.to_string(rootCxtExt,obj_name)));
         put_line("Got circuit from Name Service");

         begin
            -- Get logger Remote Interface from Name Service
            Replace_Element (obj_name, 1, NameComponent'(Id => To_CORBA_String ("Logger"),
                                       Kind => To_CORBA_String ("")));
      	    logger := RI.Log_viewer.Helper.To_Ref(resolve_str(
                rootCxtExt,CosNaming.NamingContextExt.to_string(rootCxtExt,obj_name)));
            put_line("Got logger from Name Service");

            exception
     		 when others =>
                  put_line("Unable to get logger from Name Service.");
                  put_line("Race will start without logs.");
     	 end;

         end;
      end init;

      -- line up driver
      Position := 1;
      put(to_string(Name));
      put(" lined up!");new_line;

      -- First segment of the race
      RI.Circuit_RI.enter(circuit,
                          CORBA.Long(Position),
                          CORBA.Float(entering_speed),
                          CORBA.Short(lane));
      put("accesso");new_line;
      if lane /= current_lane then
         -- driver changes lane: got bit delay
         wake := clock + duration(change_lane_delay);
         delay until wake;
         current_lane := lane;
      end if;

      begin
      RI.Log_viewer.updateLog (logger,
                              id,
                              CORBA.Long(Position),
                              CORBA.Float(entering_speed*float(3600)/float(1000)),
                               false);
      exception
      when others =>
            put_line("Logger is down");
      end;

      put(to_string(name));put(":");new_line;
      -- 10 meters of acceleration
      accel_lenght := accel_lenght + meters_per_segment;
      leaving_speed := log(accel_lenght, log_a_base);
      put("speed (km/h): ");
      ada.Float_Text_IO.put(leaving_speed*float(3600)/float(1000));new_line;
      avg_speed := ( entering_speed + leaving_speed )/ float(2);
      wake := clock + duration(meters_per_segment/avg_speed);
      delay until wake;


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

               -- Probability of 0,001% to have problems at box and retire
               lucky_number := Random(G);
               if lucky_number > 6.00010E-01 and lucky_number < 6.00020E-01 then
                  raise Box_Retire;
               end if;
               RI.Circuit_RI.enter_Box(circuit,
                          CORBA.Long(box_index),
                          CORBA.Float(leaving_speed),
                                       CORBA.Short(lane));

               begin
               RI.Log_viewer.updateLog (logger,
                                        id,
                                        CORBA.Long(box_index),
                                        CORBA.Float(leaving_speed*float(3600)/float(1000)),
                                        true);
               exception
     		when others =>
           	 put_line("Logger is down");
     		end;

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

               -- Probability of 0,001% to break the engine
               lucky_number := Random(G);
               if lucky_number > 1.00010E-01 and lucky_number < 1.00020E-01 then
                  raise Engine_Break;
               end if;
               -- Probability of 0,001% to break a tyre
               if lucky_number > 3.00010E-01 and lucky_number < 3.00020E-01 then
                  raise Tyre_Break;
               end if;

               RI.Circuit_RI.enter(circuit,
                                   CORBA.Long(Position),
                                   CORBA.Float(leaving_speed),
                                   CORBA.Short(lane));
               if lane /= current_lane then
                  -- driver changes lane: got bit delay
                  wake := clock + duration(change_lane_delay);
                  delay until wake;
                  current_lane := lane;
               end if;

	       begin
               RI.Log_viewer.updateLog (logger,
                                        id,
                                        CORBA.Long(Position),
                                        CORBA.Float(leaving_speed*float(3600)/float(1000)),
                                        false);
               exception
      		when others =>
           	 put_line("Logger is down");
      		end;

               put(to_string(Name));
               put(" is in segment ");
               ada.Integer_Text_IO.put(Position);
               put("[Accel!]");new_line;

               -- calc new speed with acceleration coefficient
               if leaving_speed < mspeed and leaving_speed < max_starting_speed then
                  if leaving_speed < entering_speed then
                     -- was blocked by a leading car!
                     -- brake to leading car speed

                     -- Probability of 0,001% to crash!
               	     lucky_number := Random(G);
               	     if lucky_number > 9.01000E-01 and lucky_number < 9.02000E-01 then
                        raise Crash;
                     end if;

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

               delay until Wake;

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

               -- Probability of 0,001% to break the engine
               lucky_number := Random(G);
               if lucky_number > 1.00010E-01 and lucky_number < 1.00020E-01 then
                  raise Engine_Break;
               end if;
               -- Probability of 0,001% to break a tyre
               if lucky_number > 3.00010E-01 and lucky_number < 3.00020E-01 then
                  raise Tyre_Break;
               end if;

               RI.Circuit_RI.enter(circuit,
                                   CORBA.Long(Position),
                                   CORBA.Float(entering_speed),
                                   CORBA.Short(lane));
               if lane /= current_lane then
                  -- driver changes lane: got bit delay
                  wake := clock + duration(change_lane_delay);
                  delay until wake;
                  current_lane := lane;
               end if;


               begin
               RI.Log_viewer.updateLog (logger,
                                        id,
                                        CORBA.Long(Position),
                                        CORBA.Float(entering_speed*float(3600)/float(1000)),
                                        false);
               exception
   		 when others =>
          	 put_line("Logger is down");
      	       end;

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

                  -- Probability of 0,1% to crash!
                  lucky_number := Random(G);
                  if lucky_number > 9.01000E-01 and lucky_number < 9.02000E-01 then
                     raise Crash;
                  end if;

                  avg_speed := entering_speed;
                  leaving_speed := entering_speed;
                  accel_lenght := log_a_base**leaving_speed;
               end if;

               -- calc wake time with respect to current driver speed
               wake := clock + duration(meters_per_segment/avg_speed);

               delay until Wake;

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


      notify_end_race(ID,0,rootCxtExt, logger);


      --capture exceptions
      exception
      when Engine_Break =>
         notify_end_race(ID,1,rootCxtExt, logger);
      when Tyre_Break =>
         notify_end_race(ID,2,rootCxtExt, logger);
      when Box_Retire =>
         notify_end_race(ID,3,rootCxtExt, logger);
      when Crash =>
         notify_end_race(ID,4,rootCxtExt, logger);
      when others =>
         begin
         	notify_end_race(ID,5,rootCxtExt, logger);

      		--capture exception when Startup is down
      		exception
   			when others =>
         			put_line("Startup is down");

            			RI.Circuit_RI.endRace (circuit);
            			RI.Log_viewer.endRace (logger, ID, CORBA.Short(5));

               			put_line("Race ended.");
         end;



end the_Driver;

end Race.Driver;
