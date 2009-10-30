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

with Race.Driver.Constants;
with Ada.Integer_Text_IO;
with Text_IO;
with Ada.Numerics.Elementary_Functions;
with Ada.Float_Text_IO;
with Race.Startup;

package body Race.Driver is

   --  NOTIFY_END_RACE ---------------------------------------
   --  This procedure is called by Driver when he must retire.
   --  Interact with Startup and Logger
   -----------------------------------------------------------
   procedure notify_end_race
     (ID     : CORBA.Short;
      reason : Integer;
      logger : RI.Log_viewer.Ref)
   is
      use Text_IO;
   begin

      case reason is

         when 1 =>
            Put_Line ("Engine break!");

         when 2 =>
            Put_Line ("Tire break!");

         when 3 =>
            Put_Line ("Problems at box! Retired.");

         when 4 =>
            Put_Line ("Go off the road! Retired.");

         when 5 =>
            Put_Line ("Circuit down.");

         when others =>
            null;

      end case;

      RI.Log_viewer.endRace (logger, ID, CORBA.Short (reason));

      Startup.end_Race;
      Put_Line ("Race ended.");

   end notify_end_race;

   --  TO_KM_H ---------------------------------------------------------
   --  Convert from km/h to m/s
   ---------------------------------------------------------------------
   function to_km_h (speed : Float) return Float is
   begin
      return speed * Float (3600) / Float (1000);
   end to_km_h;

   --  TO_M_S ----------------------------------------------------------
   --  Convert from m/s to km/h
   ---------------------------------------------------------------------
   function to_m_s (speed : Float) return Float is
   begin
      return speed * Float (1000) / Float (3600);
   end to_m_s;

   --  INIT_DRIVER -----------------------------------------------------
   --  Called by Startup to initialize the driver with custom parameters
   ---------------------------------------------------------------------
   procedure Init_Driver
     (params       : String_array_T;
      position     : Positive;
      track        : LP_track_T;
      box          : LP_track_T;
      laps         : Positive;
      start_time   : Time)
   is

      use Text_IO;
      use Ada.Integer_Text_IO;
      use Ada.Strings.Unbounded;
      use Race.Driver.Constants;

      Strategy_string    : String  := To_String (params (7));
      buffer_index_first : Natural := 1;
      buffer_index_last  : Natural := 0;
      buffer_index       : Integer := 0; --  string_buffer index
      index              : Integer := 1; --  strategy string array index
      last               : Positive;
      ID_positive        : Positive;

   begin
      --  read strategy (lap numbers)  from params. Assume at least 1 pit
      --  stop.
      while (index <= Strategy_string'Last) loop

         if Strategy_string (index) >= '0' and
            Strategy_string (index) <= '9'
         then
            --  accumulate digits in the buffer
            buffer_index_last := buffer_index_last + 1;
            index             := index + 1;
         else
            --  convert string to lap number and flush the buffer
            Strategy_lenght := Strategy_lenght + 1;
            Get
              (Strategy_string (buffer_index_first .. buffer_index_last),
               Strategy (Strategy_lenght),
               last);
            buffer_index_first := index + 1;
            buffer_index_last  := index;
            index              := index + 1;
         end if;

      end loop;

      --  finally, convert last string to lap number and flush the buffer
      Strategy_lenght := Strategy_lenght + 1;
      Get
        (Strategy_string (buffer_index_first .. buffer_index_last),
         Strategy (Strategy_lenght),
         last);

      --  initialize all other parameters
      Name := params (1);
      Get (To_String (params (3)), ID_positive, last);
      ID   := CORBA.Short (ID_positive);
      Team := params (2);
      Get (To_String (params (4)), Accel, last);
      Get (To_String (params (5)), Brake, last);
      Ada.Float_Text_IO.Get (To_String (params (6)), MSpeed, last);

      LP_track := new LP_track_T (track'Range);
      index    := 1;
      while index <= track'Last loop
         LP_track (index) := track (index);
         index            := index + 1;
      end loop;

      LP_box := new LP_track_T (box'Range);
      index  := 1;
      while index <= box'Last loop
         LP_box (index) := box (index);
         index          := index + 1;
      end loop;

      Tot_Laps := laps;

      --  convert mspeed from km/h to m/s
      MSpeed := to_m_s (MSpeed);

      --  calculate acceleration log base with respect to driver's accel coeff
      --  less log_a = more acceleration
      Log_a := LOG_A_BASE - (Float (Accel * 2) / Float (10_000));

      --  calculate deceleration log base with respect to driver's brake coeff
      --  less log_d = more brake power = delayed brakes
      Log_d := LOG_D_BASE - (Float (Brake) / Float (10_000));

      if Strategy_lenght > 0 then
         Strategy_index := Strategy_index + 1;
         go_box         := Strategy (Strategy_index);
      end if;

      --  set the start race time
      Wake := start_time;


   end Init_Driver;


   --  GET_LUCKY -------------------------------------------------------
   --  Verify if driver got an incident
   ---------------------------------------------------------------------
   procedure Get_Lucky (Reason : in incident) is

      use Ada.Numerics.Float_Random;

      lucky_number : Ada.Numerics.Float_Random.Uniformly_Distributed;

   begin
      lucky_number := Random (G);

      case Reason is

         when Engine_Tyre =>
            if lucky_number > 1.00010E-01 and
               lucky_number < 1.00020E-01
            then
               raise Engine_Break;
            end if;

            if lucky_number > 3.00010E-01 and
               lucky_number < 3.00020E-01
            then
               raise Tyre_Break;
            end if;

         when Box =>
            if lucky_number > 6.00010E-01 and
               lucky_number < 6.00020E-01
            then
               raise Box_Retire;
            end if;

         when Crash =>
            if lucky_number > 9.01000E-01 and
               lucky_number < 9.02000E-01
            then
               raise Crash_car;
            end if;
      end case;

   end Get_Lucky;


   --  THE_DRIVER ------------------------------------------------------
   --  The main task of this package. It emulates a driver that take part
   --  in the race.
   ---------------------------------------------------------------------

   task body Driver is
      use Text_IO;
      use Race.Driver.Constants;
      use Ada.Strings.Unbounded;
      use Ada.Numerics.Elementary_Functions;

      Laps_Done      : Natural  := 0;
      Position       : Positive;
      lane           : Positive := 1;
      current_lane   : Positive := 1;
      accel_lenght   : Float    := 1.00000E+00;
      decel_lenght   : Float    := 1.00000E+00;
      entering_speed : Float    := 0.00000E+00;
      leaving_speed  : Float;
      avg_speed      : Float;

      macro_index               : Positive := 1;
      segment_index             : Positive := 1;
      current_accel_lenght      : Float;
      next_segment_accel_lenght : Float;
      brake_point               : Natural;
      max_starting_speed        : Float;
      max_leaving_speed         : Float;
      brake_point_f             : Float;
      box_index                 : Positive := 1;

      --  CORBA
      circuit : RI.circuit_RI.Ref;
      logger  : RI.Log_viewer.Ref;

   begin
      -------------------------------------------------------------------------
      ---
      --                       DRIVER THREAD BEGIN
      -------------------------------------------------------------------------
      ---
      Text_IO.Put_Line ("Driver started");

      accept init (
         params      : String_array_T;
         position   : Positive;
         track      : LP_track_T;
         box        : LP_track_T;
         laps       : Positive;
         start_time : Time;
         circuit_ref: RI.circuit_RI.Ref;
         logger_ref : RI.Log_viewer.Ref)
      do

         circuit := circuit_ref;
         logger := logger_ref;
         Init_Driver(params, position, track, box, laps, start_time);

      end init;

      --  line up driver
      Position := 1;
      Put (To_String (Name));
      Put (" lined up!");
      New_Line;

      -- First segment of the race -------------------------------------
      RI.circuit_RI.enter
        (circuit,
         CORBA.Long (Position),
         CORBA.Float (entering_speed),
         CORBA.Short (lane));
      Put ("accesso");
      New_Line;
      if lane /= current_lane then
         --  driver changes lane: got bit delay
         Wake         := Wake + Duration (CHANGE_LANE_DELAY);
         current_lane := lane;
      end if;

      begin
         RI.Log_viewer.updateLog
           (logger,
            ID,
            CORBA.Long (Position),
            CORBA.Float (to_km_h (entering_speed)),
            False);
      exception
         when others =>
            Put_Line ("Logger is down");
      end;

      Put (To_String (Name));
      Put (":");
      New_Line;
      --  10 meters of acceleration
      accel_lenght  := accel_lenght + METERS_PER_SEGMENT;
      leaving_speed := Log (accel_lenght, Log_a);
      Put ("speed (km/h): ");
      Ada.Float_Text_IO.Put (to_km_h (leaving_speed));
      New_Line;
      avg_speed := (entering_speed + leaving_speed) / Float (2);
      Wake      := Wake + Duration (METERS_PER_SEGMENT / avg_speed);

      RI.circuit_RI.leave
        (circuit,
         CORBA.Long (Position),
         CORBA.Short (lane));
      delay until Wake;

      Position      := Position + 1;
      segment_index := segment_index + 1;
      --  calculate when driver must brake to enter next macro segment
      if leaving_speed > LP_track (1).Leaving_Speed then
         current_accel_lenght      := Log_d ** leaving_speed;
         next_segment_accel_lenght := Log_d * LP_track (1).Leaving_Speed;
         brake_point               := LP_track (1).Segments -
                                      Integer ((current_accel_lenght -
                                                next_segment_accel_lenght) /
                                               METERS_PER_SEGMENT);
      else
         brake_point := LP_track (1).Segments;
      end if;
      entering_speed := leaving_speed;
      --  end first segment of the race
      ---------------------------------------------------------

      --  MAIN LOOP OF DRIVER
      -------------------------------------------------------------------
      while Laps_Done < Tot_Laps loop

         if Laps_Done = go_box then
            box_index := 1;
            --  BOX LOOP
            -------------------------------------------------------------------
            ---------
            --  driver go to box, return to race in next macro segment
            while box_index <= LP_box (1).Segments loop
               --  perform a "drive through"
               --  brake first if necessary
               Put (To_String (Name));
               Put (" drive through box!");
               New_Line;

               --  Probability of 0,001% to have problems at box and retire
               Get_Lucky (Box);

               RI.circuit_RI.enter_Box
                 (circuit,
                  CORBA.Long (box_index),
                  CORBA.Float (leaving_speed),
                  CORBA.Short (lane));

               begin
                  RI.Log_viewer.updateLog
                    (logger,
                     ID,
                     CORBA.Long (box_index),
                     CORBA.Float (to_km_h (leaving_speed)),
                     True);
               exception
                  when others =>
                     Put_Line ("Logger is down");
               end;

               if leaving_speed > LP_box (1).Starting_Speed then
                  decel_lenght := decel_lenght - METERS_PER_SEGMENT;
                  if decel_lenght > Float (1) then
                     leaving_speed := Log (decel_lenght, Log_d);
                  else
                     leaving_speed := LP_box (1).Starting_Speed;
                  end if;

                  avg_speed      := (entering_speed + leaving_speed) /
                                    Float (2);
                  entering_speed := leaving_speed;
                  Wake           := Wake +
                                    Duration (METERS_PER_SEGMENT / avg_speed);

               else
                  Wake := Wake +
                          Duration (METERS_PER_SEGMENT /
                                    LP_box (1).Starting_Speed);
               end if;

               Put ("Speed:");
               Ada.Integer_Text_IO.Put (Integer (to_km_h (leaving_speed)));
               New_Line;

               RI.circuit_RI.leave_Box
                 (circuit,
                  CORBA.Long (box_index),
                  CORBA.Short (lane));
               delay until Wake;

               box_index := box_index + 1;
            end loop;
            --  recalculate indexes and coeffs
            Position       := Position + LP_track (macro_index).Segments;
            macro_index    := macro_index + 1;
            entering_speed := LP_box (1).Starting_Speed;
            leaving_speed  := entering_speed;
            accel_lenght   := Log_a ** leaving_speed;
            decel_lenght   := Log_d ** leaving_speed;

            --  if driver must stop again
            if Strategy_index < Strategy_lenght then
               --  next pit stop
               Strategy_index := Strategy_index + 1;
               go_box         := Strategy (Strategy_index);
            end if;

         end if;
         --  END BOX LOOP
         ----------------------------------------------------------------------
         ---

         --  MACRO SEGMENT LOOP
         -----------------------------------------------------------------
         while macro_index <= LP_track'Last loop
            --  calculate macro segment max speed with respect to driver skills
            max_starting_speed := LP_track (macro_index).Starting_Speed +
                                  to_m_s (Float (Accel));
            max_leaving_speed  := LP_track (macro_index).Leaving_Speed +
                                  to_m_s (Float (Brake));

            --  ACCELERATION
            --  LOOP-------------------------------------------------------------
            ---
            while segment_index < brake_point loop

               --  Probability of 0,001% to break the engine or a tyre
               Get_Lucky (Engine_Tyre);

               RI.circuit_RI.enter
                 (circuit,
                  CORBA.Long (Position),
                  CORBA.Float (leaving_speed),
                  CORBA.Short (lane));
               if lane /= current_lane then
                  --  driver changes lane: got bit delay
                  Wake         := Wake + Duration (CHANGE_LANE_DELAY);
                  current_lane := lane;
               end if;

               begin
                  RI.Log_viewer.updateLog
                    (logger,
                     ID,
                     CORBA.Long (Position),
                     CORBA.Float (to_km_h (leaving_speed)),
                     False);
               exception
                  when others =>
                     Put_Line ("Logger is down");
               end;

               Put (To_String (Name));
               Put (" is in sector ");
               Ada.Integer_Text_IO.Put (Position);
               Put ("[Accel!]");
               New_Line;

               --  calc new speed with acceleration coefficient
               if leaving_speed < MSpeed and
                  leaving_speed < max_starting_speed
               then
                  if leaving_speed < entering_speed then
                     --  was blocked by a leading car!
                     --  brake to leading car speed

                     --  Probability of 0,1% to go off the road!
                     Get_Lucky (Crash);

                     accel_lenght   := Log_a ** leaving_speed;
                     entering_speed := leaving_speed;
                     Put ("[Blocked by leading car!]");
                     New_Line;

                  else
                     --  one segment of acceleration
                     accel_lenght  := accel_lenght + METERS_PER_SEGMENT;
                     leaving_speed := Log (accel_lenght, Log_a);
                  end if;

                  --  if driver achieve max speed
                  if leaving_speed > MSpeed or
                     leaving_speed > max_starting_speed
                  then
                     if MSpeed > max_starting_speed then
                        leaving_speed := max_starting_speed;
                        accel_lenght  := Log_a ** leaving_speed;
                     else
                        leaving_speed := MSpeed;
                        accel_lenght  := Log_a ** leaving_speed;
                     end if;
                  end if;

                  avg_speed := (entering_speed + leaving_speed) / Float (2);

                  decel_lenght := Log_d ** leaving_speed;
               end if;

               --  calc wake time with respect to current driver speed
               Wake := Wake + Duration (METERS_PER_SEGMENT / avg_speed);

               RI.circuit_RI.leave
                 (circuit,
                  CORBA.Long (Position),
                  CORBA.Short (lane));
               delay until Wake;

               Put ("Speed: ");
               Ada.Integer_Text_IO.Put (Integer (to_km_h (leaving_speed)));
               New_Line;

               --  calculate when driver must brake to enter next macro segment
               if leaving_speed > max_leaving_speed then
                  current_accel_lenght      := Log_d ** leaving_speed;
                  next_segment_accel_lenght := Log_d ** max_leaving_speed;
                  brake_point_f             :=
                    (current_accel_lenght - next_segment_accel_lenght) /
                    METERS_PER_SEGMENT;

                  brake_point := LP_track (macro_index).Segments -
                                 Integer (brake_point_f);
               else
                  brake_point := LP_track (macro_index).Segments;
               end if;

               entering_speed := leaving_speed;
               segment_index  := segment_index + 1;
               Position       := Position + 1;
            end loop;
            --  END ACCELERATION LOOP
            -----------------------------------------------------

            --  BRAKE LOOP
            ----------------------------------------------------------------
            while segment_index <= LP_track (macro_index).Segments loop

               --  Probability of 0,001% to break the engine or a tyre
               Get_Lucky (Engine_Tyre);

               RI.circuit_RI.enter
                 (circuit,
                  CORBA.Long (Position),
                  CORBA.Float (entering_speed),
                  CORBA.Short (lane));
               if lane /= current_lane then
                  --  driver changes lane: got bit delay
                  Wake         := Wake + Duration (CHANGE_LANE_DELAY);
                  current_lane := lane;
               end if;

               begin
                  RI.Log_viewer.updateLog
                    (logger,
                     ID,
                     CORBA.Long (Position),
                     CORBA.Float (to_km_h (entering_speed)),
                     False);
               exception
                  when others =>
                     Put_Line ("Logger is down");
               end;

               Put (To_String (Name));
               Put (" is in sector ");
               Ada.Integer_Text_IO.Put (Position);
               Put ("[Brake!]");
               New_Line;
               if entering_speed < leaving_speed then
                  --  was blocked by a leading car!
                  --  save leading car speed in "entering_speed"
                  --  then try to brake whith normal driver deceleration:
                  --  if it's not enough assume leading car speed
                  Put ("[Blocked by leading car!]");
                  New_Line;
               end if;

               --  driver brakes
               --  calc new speed with deceleration coefficient
               if leaving_speed > max_leaving_speed then
                  --  one segment of deceleration
                  decel_lenght := decel_lenght - METERS_PER_SEGMENT;

                  if decel_lenght <= Float (1) then
                     --  if driver decelerate to target speed in less than
                     --  meters_per_segment
                     --  (to avoid negative log)
                     leaving_speed := max_leaving_speed;
                  else
                     --  if not, driver perform a deceleration of
                     --  meters_per_segment
                     leaving_speed := Log (decel_lenght, Log_d);

                     if leaving_speed < max_leaving_speed then
                        leaving_speed := max_leaving_speed;
                     end if;
                  end if;

                  avg_speed := (entering_speed + leaving_speed) / Float (2);

                  accel_lenght := Log_a ** leaving_speed;
               end if;

               if leaving_speed > entering_speed then
                  --  driver was blocked by a leading car
                  --  normal brake is not enough: assume leading car speed

                  --  Probability of 0,1% to go off the road!
                  Get_Lucky (Crash);

                  avg_speed     := entering_speed;
                  leaving_speed := entering_speed;
                  accel_lenght  := Log_a ** leaving_speed;
               end if;

               --  calc wake time with respect to current driver speed
               Wake := Wake + Duration (METERS_PER_SEGMENT / avg_speed);

               RI.circuit_RI.leave
                 (circuit,
                  CORBA.Long (Position),
                  CORBA.Short (lane));

               delay until Wake;

               Put ("Speed: ");
               Ada.Integer_Text_IO.Put (Integer (to_km_h (leaving_speed)));
               New_Line;

               entering_speed := leaving_speed;
               Position       := Position + 1;
               segment_index  := segment_index + 1;
            end loop;
            --  END BRAKE LOOP
            ----------------------------------------------------------

            macro_index   := macro_index + 1;
            segment_index := 1;
            Put ("Entering macro_segment: ");
            Ada.Integer_Text_IO.Put (macro_index);
            New_Line;

         end loop;
         --  END MACRO SEGMENT LOOP
         -----------------------------------------------------

         Laps_Done   := Laps_Done + 1;
         macro_index := 1;
         Position    := 1;
      end loop;
      --  END MAIN LOOP
      -----------------------------------------------------------------

      --  Notify to logger that driver ends the race
      notify_end_race (ID, 0, logger);

      --  capture exceptions
   exception
      when Engine_Break =>
         notify_end_race (ID, 1, logger);
      when Tyre_Break =>
         notify_end_race (ID, 2, logger);
      when Box_Retire =>
         notify_end_race (ID, 3, logger);
      when Crash_car =>
         RI.circuit_RI.leave
           (circuit,
            CORBA.Long (Position),
            CORBA.Short (lane));
         notify_end_race (ID, 4, logger);
      when others =>
         notify_end_race (ID, 5, logger);

   end Driver;

end Race.Driver;
