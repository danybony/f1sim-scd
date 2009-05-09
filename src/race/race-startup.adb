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

-- Using text_io to read the race configuration from file
with text_io; use text_io;
with Race.Circuit;
with Race.Driver;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;
with Ada.Containers.Vectors;

package body Race.Startup is

   --  This function check if a file is avaiable or not.
   --+ Return true if the file exists
   --+ Return false otherwise
   function file_exists(
                        name:string
                       ) return boolean is
      input_file:file_type;

   begin
      open(input_file, in_file, name);
      --if it worked, close the file and return true
      close(input_file);
      return true;

   exception
      when name_error =>
         --couldn't open the file
         return false;

   end file_exists;

   -----------------------------------------------------------------------------
   -----------------------------------------------------------------------------
   --  Procedure that read teams, drivers configurations from file
   procedure read_configuration (
                                 text_file:		in	string;
                                 array_to_configure:	in out	String_Array_T;
                                 array_index:		in out	integer
                                ) is
      use Ada.Strings.Unbounded;

      line_index:integer:=1;
      --  Temporary input file for every file reading
      input_file:file_type;
      -- Temporary string and char in wich store lines read in from file
      input_string:string(1..255);
      input_char:character;
      --  Sentinel for avoid comments
      sentinel:boolean:=false;
   begin
      put("reading...");
      if file_exists(text_file) then
         put("file present!");
         --read file specs
         open(input_file, in_file, text_file);
         read_file_loop:
         while not end_of_file(input_file) loop
            line_index:=1;
            sentinel:=false;
            --read one line from file
            read_line_loop:
            while not end_of_line(input_file) and line_index < 256 and not sentinel loop
               get(input_file,input_char);
               -- If input_char is '#', skip the rest of the line
               if input_char='#' then
               sentinel:=true;
               else
               input_string(line_index):=input_char;
               line_index:=line_index+1;
               end if;
            end loop read_line_loop;
            --store the line in array
            --skip the line if it start with '#'
            if line_index=1 then skip_line(input_file);
            else
            array_index:=array_index+1;
            array_to_configure(array_index):=To_unbounded_string(input_string(1..line_index-1));
            put(to_string(array_to_configure(array_index)));new_line;
            --skip to the next text line
            skip_line(input_file);
            end if;
         end loop read_file_loop;


      end if;

   exception
      when end_error =>
         --  No newline at end of file: do nothing.
         null;
   end read_configuration;

   -----------------------------------------------------------------------------
   -----------------------------------------------------------------------------
   procedure build_track (MacroSegments		:in String_array_T;
                          MacroSegments_total	:in integer;
                          track			:in out LP.Vector)
   is
      use Ada.Strings.Unbounded;
      use LP;
      use Ada.Integer_Text_IO;
      segment_lenght: constant Positive:=1;--lenght(in meters) of one segment
      index: Positive := 1;
      segments_index : Positive := 1;
      macro_lenght : Positive;
      macro_first_lenght : Positive;
      macro_first_speed : Positive;
      macro_last_lenght : Positive;
      macro_last_speed : Positive;
      macro_change_line : Positive;

      break_coeff: integer;
      last : Positive;
      segment_temp : Segment_properties_ref_T;

   begin
      while index <= MacroSegments_total loop
         get(To_String(MacroSegments(index)),macro_lenght,last);
         get(To_String(MacroSegments(index+3)),macro_change_line,last);
         macro_first_lenght := macro_change_line/segment_lenght;
         macro_last_lenght := (macro_lenght-macro_change_line)/segment_lenght;
         get(To_String(MacroSegments(index+1)),macro_first_speed,last);
         get(To_String(MacroSegments(index+2)),macro_last_speed,last);

         while segments_index <= macro_first_lenght loop
            segment_temp := new Segment_properties_T;
            segment_temp.speed := macro_first_speed;
            LP.Append(track, segment_temp.all);
            segments_index := segments_index + 1;
         end loop;

         break_coeff := (macro_first_speed - macro_last_speed) /
           macro_last_lenght;

         while segments_index <= macro_lenght loop
            segment_temp := new Segment_properties_T;
            segment_temp.speed := macro_first_speed -
              (break_coeff*(segments_index-macro_first_lenght));
            LP.Append(track, segment_temp.all);
            segments_index := segments_index + 1;
         end loop;

         segments_index := 1;
         index := index + 5;--skip to next macro segment

      end loop;

      -- build 2nd vector: LR
      Race.Circuit.build_track(MacroSegments, MacroSegments_total);

   end build_track;

   -----------------------------------------------------------------------------
   -----------------------------------------------------------------------------
   --  Procedure that set up the environment of the system and then start the
   --+ race.
   procedure startup is

      Teams		:String_array_T(1..20);
      Drivers		:String_array_T(1..20);
      MacroSegments	:String_array_T(1..20);
      Teams_file	:String:="/home/ilzatto/Desktop/Progetto_SCD/f1sim-scd/txt/teams.txt";
      Drivers_file	:String:="/home/ilzatto/Desktop/Progetto_SCD/f1sim-scd/txt/drivers.txt";
      MacroSegments_file:String:="/home/ilzatto/Desktop/Progetto_SCD/f1sim-scd/txt/circuit.txt";
      Teams_total	:integer:=0;
      Drivers_total	:integer:=0;
      MacroSegments_total:integer:=0;
      LP_track		:LP.Vector;
      index		:integer:=1;
      Micheal		:Race.Driver.Driver;
      Alonso		:Race.Driver.Driver;

      new_string: String_array_T(1..20);

   begin
      -- Read Team, Driver and Track configurations from file
      read_configuration(Teams_file,Teams,Teams_total);
      put("teams: ok");new_line;

      read_configuration(Drivers_file,Drivers,Drivers_total);
      put("drivers: ok");new_line;

      read_configuration(MacroSegments_file,MacroSegments,MacroSegments_total);
      put("circuit: ok");new_line;

      -- Build the track
      -- This function creates 2 array: one is the list of properties for every
      --+segments (we will call this "LP" from now on); the other is a list of
      --+protected types (we will call this "LR" from now on).
      --+Each driver needs LP to "know" the track (i.e. calculate speed in the
      --+current segment) and LR to "drive" (access the next segment).
      --+Variable "LP_track" is LP and will be distributed and stored to any
      --+driver
      --+LR will be stored in "Circuit" machine and freely accessible to any
      --+driver.
      build_track(MacroSegments, MacroSegments_total, LP_track);

      Ada.Integer_Text_IO.put(Item => Race.Circuit.LR_Track.Last_Index);

      -- Lock first segment for driver initializations
      Race.Circuit.LR_track.Element(1).all.enter(1,1);
      Race.Circuit.LR_track.Element(1).all.enter(1,1);

      -- Create drivers and align them as per config file's order
      -- 7 is the number of the parameters for every driver
      --for index in 1..drivers_total mod 7 loop
      --   Race.Driver.Driver_init(Drivers((((index-1)*7)+1)..(index*7)), index);

      --end loop;

      new_string(1..7):=Drivers(1..7);
      Micheal.init(Drivers(1..7), 1, LP_track, 3);
      new_string(1..7):=Drivers(8..14);
      Alonso.init(new_string, 1, LP_track, 3);

      -- Realese the lock in the first segment: Start the Race!
      Race.Circuit.LR_track.Element(1).all.leave(1);
      Race.Circuit.LR_track.Element(1).all.leave(1);
   end startup;


end Race.Startup;
