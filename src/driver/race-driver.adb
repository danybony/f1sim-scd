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
with Ada.Numerics;

package body Race.Driver is


   task body Driver is
      use Text_IO;
      use Race.Circuit;
      use Ada.Strings.Unbounded;
      use ada.Calendar;
      use Ada.Numerics;
      Name: Ada.Strings.Unbounded.Unbounded_String;
      ID: Positive;
      Team: Ada.Strings.Unbounded.Unbounded_String;
      Accel: Positive;
      Break: Positive;
      MSpeed: Positive;
      Strategy: Strategy_T(0..5);--max 5 pit stops
      Strategy_lenght: Natural := 0;
      Laps_Done: Natural := 0;
      Tot_Laps: Positive;
      LP_track: LP.Vector;
      Initial_Position: Positive;
      Position: Positive;
      Wake : Time;
      Speed : float := 0.00000E+00;
      Speed_exp : float := 0.00000E+00;

   begin
      Text_IO.put_line("Driver started");
      accept init (params	: String_array_T;
                   position	: Positive;
                   track	: LP.Vector;
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
                    put("Lap number: ");
                    put(Strategy(strategy_lenght));new_line;
                    buffer_index_first := index + 1;
                    buffer_index_last := index;
               	    index := index + 1;
                end if;

            end loop;

            -- finally, convert last string to lap number and flush the buffer
            strategy_lenght := strategy_lenght +1;
            get(strategy_string(buffer_index_first..buffer_index_last),
                Strategy(strategy_lenght), Last);
            put("Lap number: ");
            put(Strategy(strategy_lenght));new_line;

      -- initialize all other parameters
            Name := params(1);
            get(to_String(params(3)),ID,Last);
            Team := params(2);
            get(to_String(params(4)),Accel,Last);
            get(to_String(params(5)),Break,Last);
            get(to_String(params(6)),MSpeed,Last);
            LP_track := track;
            Tot_Laps := Laps;
            Initial_Position := Position;
         end;
      end init;

      -- line up driver
      --Position := (LR_track.Last_Index-Initial_Position)+1;
      --LR_track.Element(Position).all.enter;
      Position := 1;
      put(to_string(Name));
      put(" lined up!");new_line;

      -- main loop of driver
      while laps_done <= tot_laps loop
         while Position <= LP_track.Last_Index loop
            LR_track.Element(Position).all.enter;
            put(to_string(Name));
            put(" is in segment ");
            if speed < LP_track.Element(Position).speed then
               -- calc new speed with Accel modifier
               speed_exp := speed_exp + accel_coeff;
               speed := e**speed_exp;
            else
               speed := LP_track.Element(Position).speed;
            end if;


            ada.Integer_Text_IO.put(Position);new_line;
            Wake := clock + duration(Accel/10);
            delay until Wake;
            LR_track.Element(Position).all.leave;
            Position := Position +1;
         end loop;
         laps_done := laps_done + 1;
      end loop;
      --end of main loop

   end Driver;

end Race.Driver;
