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
with Race.Circuit;
with Ada.Calendar;
with Ada.Numerics.Elementary_Functions;
with Ada.Float_Text_IO;

package body Race.Driver is


   task body Driver is
      use Text_IO;
      use Race.Circuit;
      use Ada.Strings.Unbounded;
      use ada.Calendar;
      use Ada.Numerics.Elementary_Functions;
      Name: Ada.Strings.Unbounded.Unbounded_String;
      ID: Positive;
      Team: Ada.Strings.Unbounded.Unbounded_String;
      Accel: Positive;
      Brake: Positive;
      MSpeed: float;
      Strategy: Strategy_T(0..5);--max 5 pit stops
      Strategy_lenght: Natural := 0;
      Laps_Done: Natural := 0;
      Tot_Laps: Positive;
      LP_track: LP_Track_Ref_T;
      Initial_Position: Positive;
      Position: Positive;
      Wake : Time;
      mspeed_exp : float := 0.00000E+00;
      speed_exp : float := 1.00000E+00;
      --time_to_mspeed : float;
      --lenght_to_mspeed : float;
      --avg_speed : float;
      --accel_coeff : float;
      -- log base for km/h
      --log_t_base : float := 1.07850E+00;
      -- log base for m/s
      --log_t_base : float := 1.02790E+00;

      -- log base for acceleration
      -- acceleration is usually 1,45 g (14,25 m/s^2) in F1
      -- less log_a_base = more acceleration
      log_a_base : float := 1.15050E+00;

      -- exp base for deceleration
      -- deceleration is usually 4 g (39 m/s^2) in F1
      -- more exp_d_base = more brake power = delayed brakes
      exp_d_base : float := 1.03800E+00;

      brake_points : brake_points_Ref_T;

      --min_time_per_segment : duration := 0.0;
      --segment_max_speed : float;
      --lenght_time_tax : float;
      accel_lenght : float:=0.00000E+00;
      --c_time : duration;
      entering_speed : float;
      leaving_speed : float;
      avg_speed : float;
      meters_per_segment : constant float := 1.00000E+01;

   begin
      Text_IO.put_line("Driver started");
      accept init (params	: String_array_T;
                   position	: Positive;
                   track	: LP_track_T;
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
	    --driver:Driver_Ref_T;
            last:Positive;
            brake_point_accel : float;
            next_segment_accel : float;
            brake_point : float;
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
            get(to_String(params(3)),ID,Last);
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

            Tot_Laps := Laps;
            Initial_Position := Position;

            -- convert mspeed from km/h to m/s
            mspeed := mspeed / float(3_600) * float(1_000);

            -- calculate brake points for every macro segment
            brake_points := new brake_points_T(track'range);
            for index in LP_track'range loop
               if LP_track(index).Leaving_Speed < LP_track(index).Starting_Speed then
                  brake_point_accel := log(LP_track(index).Starting_Speed, exp_d_base);
                  next_segment_accel := log(LP_track(index).Leaving_Speed, exp_d_base);
                  brake_point := brake_point_accel - next_segment_accel;
                  brake_points(index) := LP_track(index).Segments - integer(brake_point / float(10));
               else
                  brake_points(index) := 0;
               end if;
               Ada.Integer_Text_IO.put(brake_points(index));new_line;
            end loop;

         end;
      end init;

      -- line up driver
      --Position := (LR_track.Last_Index-Initial_Position)+1;
      --LR_track.Element(Position).all.enter;
      Position := 1;
      put(to_string(Name));
      put(" lined up!");new_line;

          -- doppio dell'accelerazione che diminuisce la quarta cifra decimale
--        log_a_base := 1.14850E+00;
--        speed := log_a_base**float(42);
--        put("Meters: ");
--        Ada.Float_Text_IO.put(speed);new_line;
          --
--        -- frenata che aumenta la terza cifra decimale
--        exp_d_base := 1.04700E+00;
--        speed := log(float(42), exp_d_base);
--        put("Meters: ");
--        Ada.Float_Text_IO.put(speed);new_line;

      --calculate acceleration log base with respect to driver's accel coeff
      --less log_t_base = more acceleration
      log_a_base := log_a_base - (float(accel*2)/float(10_000));
      put("Log_a_base: ");
      Ada.Float_Text_IO.put(log_a_base);new_line;

      --calculate deceleration exp base with respect to driver's brake coeff
      --more exp_d_base = more brake power = delayed brakes
      exp_d_base := exp_d_base + (float(brake)/float(1_000));
      put("exp_d_base: ");
      Ada.Float_Text_IO.put(exp_d_base);new_line;


      -- First segment of the race
      LR_track.Element(Position).all.enter;
      put(to_string(name));put(":");new_line;
      entering_speed := 0.00000E+00;
      -- 10 meters of acceleration
      accel_lenght := accel_lenght + meters_per_segment;
      leaving_speed := log(accel_lenght, log_a_base);
      put("speed: ");
      ada.Float_Text_IO.put(leaving_speed);new_line;
      put("speed (km/h): ");
      ada.Float_Text_IO.put(leaving_speed*float(3600)/float(1000));new_line;
      avg_speed := ( entering_speed + leaving_speed )/ float(2);
      wake := clock + duration(meters_per_segment/avg_speed);
      put("Wake: ");
      ada.Float_Text_IO.put(meters_per_segment/avg_speed);new_line;
      delay until wake;
      LR_track.Element(Position).all.leave;
      Position := Position + 1;
      --end first segment of the race

     -- main loop of driver

--        while laps_done <= tot_laps loop
--           while Position <= LP_track.Last_Index loop
--              LR_track.Element(Position).all.enter;
--              put(to_string(Name));
--              put(" is in segment ");
--              ada.Integer_Text_IO.put(Position);
--
--              -- current segment max speed plus driver skill
--              segment_max_speed := LP_track.Element(Position).speed*float(1000)/float(3600);
--
--
--              -- if driver can accelerate
--              if speed < segment_max_speed then
--                 -- calc new speed with acceleration coefficient
--                 if speed < mspeed_f then
--                    -- 10 meters of acceleration
--                    accel_lenght := accel_lenght + float(10);
--                    speed := (log(float(1)+(accel_lenght*lenght_time_tax), log_t_base));
--                    ----------------------Ricalcolare con velocità media!!!!!!!!!!
--                    ----------------------Se ho superato la mia velocità max!!!!!!
--                    -- driver reach max speed!
--                    if speed > segment_max_speed then
--                       speed := segment_max_speed;
--                       accel_lenght := lenght_to_mspeed;
--                    end if;
--                 end if;
--
--                 put(" Speed: ");
--                 Ada.Integer_Text_IO.put(integer(speed*float(3600)/float(1000)));new_line;
--              else
--                 -- if driver cannot accelerate, keeps max speed available and
--                 -- update current accel_lenght
--                 speed := LP_track.Element(Position).speed *float(1000)/float(3600);
--                 put(" Speed: ");
--                 Ada.Integer_Text_IO.put(integer(speed*float(3600)/float(1000)));new_line;
--                 accel_lenght := ((log_t_base**speed) - float(1)) / lenght_time_tax;
--              end if;
--              -- calc wake time with respect to current driver speed
--              wake := clock + duration(float(10)/speed);
--              put("Wake: ");
--              ada.Float_Text_IO.put(float(10)/speed);new_line;
--              delay until Wake;
--              LR_track.Element(Position).all.leave;
--              Position := Position +1;
--           end loop;
--           laps_done := laps_done + 1;
--           Position := 1;
--        end loop;
    --end of main loop




      -- calculate acceleration coefficient, in respect of driver's skills
      --accel_coeff := (time_to_mspeed-float(1))/(float(100)+float(100-(Accel/10)));
      --Ada.Float_Text_IO.put(accel_coeff);

--        while index <= MacroSegments_total loop
--           get(To_String(MacroSegments(index)),macro_lenght,last);
--           get(To_String(MacroSegments(index+3)),macro_change_line,last);
--           macro_first_lenght := macro_change_line/segment_lenght;
--           macro_last_lenght := (macro_lenght-macro_change_line)/segment_lenght;
--           get(To_String(MacroSegments(index+1)),macro_first_speed,last);
--           get(To_String(MacroSegments(index+2)),macro_last_speed,last);
--
--           while segments_index <= macro_first_lenght loop
--              segment_temp := new Segment_properties_T;
--              segment_temp.speed := float(macro_first_speed);
--              LP.Append(track, segment_temp.all);
--              segments_index := segments_index + 1;
--           end loop;
--
--           if (macro_last_speed < macro_first_speed) then
--
--              macro_diff_speed  := (macro_first_speed-macro_last_speed);
--              last_exp := Log(float(macro_diff_speed), Ada.Numerics.e);
--              break_coeff := last_exp / float(macro_last_lenght);
--
--              while segments_index <= macro_lenght loop
--                 segment_temp := new Segment_properties_T;
--                 exponent := (float(segments_index-macro_first_lenght)*break_coeff);
--                 segment_temp.speed := float(macro_first_speed) -
--                   (Ada.Numerics.e**exponent);
--                 LP.Append(track, segment_temp.all);
--                 segments_index := segments_index + 1;
--              end loop;
--           else
--
--              while segments_index <= macro_lenght loop
--                 segment_temp := new Segment_properties_T;
--                 segment_temp.speed := float(macro_first_speed);
--                 LP.Append(track, segment_temp.all);
--                 segments_index := segments_index + 1;
--              end loop;
--
--           end if;
--
--
--           segments_index := 1;
--           index := index + 5;--skip to next macro segment
--
--        end loop;

   end Driver;

end Race.Driver;
