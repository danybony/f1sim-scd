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
with text_io;
with Race.Circuit;
with Race.Driver;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
with Ada.Strings.Unbounded;
with Ada.Containers.Vectors;
with Ada.Numerics.Elementary_Functions;

package body Race.Startup is

   --  This function check if a file is avaiable or not.
   --+ Return true if the file exists
   --+ Return false otherwise
   function file_exists(
                        name:string
                       ) return boolean is
      use text_io;
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
      use text_io;
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
            --put(to_string(array_to_configure(array_index)));new_line;
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
                          LP_track		:in out LP_track_ref_T;
                          LP_box		:in out LP_track_ref_T)

   is
      use Ada.Strings.Unbounded;
      use LP;
      use Ada.Float_Text_IO;
      use Ada.Numerics.Elementary_Functions;
      index: Positive := 1;
      segments_index : Positive := 1;
      macro_lenght : Positive;
      macro_first_speed : float;
      macro_last_speed : float;

      last : Positive;
      segment_temp : Segment_properties_ref_T;

      track : LP.Vector;

   begin
      while index <= MacroSegments_total loop
         Ada.Integer_Text_IO.get(To_String(MacroSegments(index)),macro_lenght,last);
         get(To_String(MacroSegments(index+1)),macro_first_speed,last);
         get(To_String(MacroSegments(index+2)),macro_last_speed,last);

         -- convert speed from km/h to m/s
         macro_first_speed := macro_first_speed * float(1_000) / float(3_600);
         macro_last_speed := macro_last_speed * float(1_000) / float(3_600);

         -- populate LP vector
         segment_temp := new Segment_properties_T;
         segment_temp.Starting_Speed := macro_first_speed;
         segment_temp.Leaving_Speed := macro_last_speed;
         segment_temp.Segments := macro_lenght;
         LP.Append(track, segment_temp.all);

         index := index + 4;--skip to next macro segment

      end loop;

      LP_track := new LP_track_T(1..track.Last_Index-1);
      LP_box := new LP_track_T(1..1);
      -- populate property list of box
      LP_box(1) := track.Element(1);

      -- populate property list of track
      index := 2;
      while index <= track.Last_Index loop
         LP_track(index-1) := track.Element(index);
         index := index + 1;
      end loop;

      -- build 2nd vector: LR
      Race.Circuit.build_track(MacroSegments, MacroSegments_total);

   end build_track;

   -----------------------------------------------------------------------------
   -----------------------------------------------------------------------------
   procedure build_race(Race_params: 	in String_array_T;
                        laps: 		in out Positive)
   is
      use Ada.Integer_Text_IO;
      use Ada.Strings.Unbounded;
      last: integer;
   begin
      get(to_string(Race_params(1)), laps, last);
   end build_race;


   -----------------------------------------------------------------------------
   -----------------------------------------------------------------------------
   --  Procedure that set up the environment of the system and then start the
   --+ race.
   procedure startup is

      use text_io;
      Race_params	:String_array_T(1..20);
      Drivers_params	:String_array_T(1..20);
      Drivers   	:Race.Driver.Driver_Vector.Vector;
      MacroSegments_params :String_array_T(1..20);
      Race_file 	:String:="/home/ilzatto/Desktop/Progetto_SCD/f1sim-scd/txt/race.txt";
      Drivers_file	:String:="/home/ilzatto/Desktop/Progetto_SCD/f1sim-scd/txt/drivers.txt";
      MacroSegments_file:String:="/home/ilzatto/Desktop/Progetto_SCD/f1sim-scd/txt/circuit.txt";
      Race_file_lines	:integer:=0;
      Drivers_file_lines:integer:=0;
      MacroSegments_file_lines:integer:=0;
      LP_track		:LP_track_Ref_T;
      LP_box		:LP_track_Ref_T;
      Drivers_index	:integer:=1;
      Driver_properties_aux: String_array_T(1..20);
      laps		:Positive:=1;
      blocking_speed	:float := 0.00000E+00;
      blocking_lane_one	:Positive := 1;
      blocking_lane_two	:Positive := 2;

   begin
      -- Read Race, Driver and Track configurations from file
      read_configuration(Race_file,Race_params,Race_file_lines);
      put("race: ok");new_line;

      read_configuration(Drivers_file,Drivers_params,Drivers_file_lines);
      put("drivers: ok");new_line;

      read_configuration(MacroSegments_file,MacroSegments_params,MacroSegments_file_lines);
      put("circuit: ok");new_line;


      -- Get race properties from configuration
      build_race(Race_Params, laps);

      -- Build the track
      -- This function creates 2 vectors: one is the list of properties for every
      --+segments (we will call this "LP" from now on); the other is a list of
      --+protected types (we will call this "LR" from now on).
      --+Each driver needs LP to "know" the track (i.e. calculate speed in the
      --+current segment) and LR to "drive" (access the next segment).
      --+Variable "LP_track" is LP and will be distributed and stored to any
      --+driver
      --+LR will be stored in "Circuit" machine and freely accessible to any
      --+driver.
      build_track(MacroSegments_params, MacroSegments_file_lines, LP_track, LP_box);

      -- Lock first segment for driver initializations
      Race.Circuit.LR_track.Element(1).all.enter(blocking_speed, blocking_lane_one);
      Race.Circuit.LR_track.Element(1).all.enter(blocking_speed, blocking_lane_two);

      -- Create drivers and align them as per config file's order
      -- 7 is the number of the parameters for every driver
      while Drivers_index < drivers_file_lines loop
         Driver_properties_aux(1..7):=Drivers_params(Drivers_index..(Drivers_index+6));
         Drivers.Append(new Race.Driver.Driver);
         Drivers.Last_Element.all.init(Driver_properties_aux,
                                       Drivers.Last_Index,
                                       LP_track.all,
                                       LP_box.all,
                                       laps);

         Drivers_index := Drivers_index + 7;

      end loop;


      -- Realese the lock in the first segment: Start the Race!
      Race.Circuit.LR_track.Element(1).all.leave(1);
      Race.Circuit.LR_track.Element(1).all.leave(2);
   end startup;


end Race.Startup;
