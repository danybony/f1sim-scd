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
with Ada.Strings.Fixed;
--with Race.Circuit;
--with Race.Driver;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
with Ada.Command_Line;
with Ada.Strings.Unbounded;
with Ada.Containers.Vectors;
with Ada.Numerics.Elementary_Functions;
with Race.IorReader;
with Race.CORBAConverter;
with Race.StartupCORBAInit;
with CORBA.ORB;
with CORBA.Impl;
with CORBA.Object;
with RI.Circuit_RI;
with RI.Circuit_RI.Helper;
with RI.Driver_RI;
with RI.Driver_RI.Helper;
with RI.Log_viewer;
with RI.Log_viewer.Helper;
with Cosnaming.NamingContextExt;
with Cosnaming;

with RI.Startup_RI.Impl;
with PortableServer.POA.Helper;
with PortableServer.POAManager;
with Polyorb.Setup.Thread_Per_Request_Server;
pragma Warnings (Off, PolyORB.Setup.Thread_Per_Request_Server);

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
                                 array_to_configure:	in out	String_Array_Ref_T;
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
      -- Temporary array in wich store lines read in from file
      -- Max 200 lines of text in configuration files!
      array_aux : String_Array_T(1..200);
      index_aux : Positive := 1;
      --  Sentinel for avoid comments
      sentinel:boolean:=false;
   begin
      put("reading...");
      if file_exists(text_file) then
         put("file present!");
         --read file specs
         open(input_file, in_file, text_file);
         read_file_loop:
         while not end_of_file(input_file) or array_index >= 200 loop
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
            array_aux(array_index):=To_unbounded_string(input_string(1..line_index-1));
            --put(to_string(array_to_configure(array_index)));new_line;
            --skip to the next text line
            skip_line(input_file);
            end if;
         end loop read_file_loop;

         array_to_configure := new String_Array_T(1..array_index);
         while index_aux <= array_index loop
            array_to_configure(index_aux) := array_aux(index_aux);
            index_aux := index_aux + 1;
         end loop;

      end if;

   exception
      when end_error =>
         --  No newline at end of file: do nothing.
         array_to_configure := new String_Array_T(1..array_index);
         while index_aux <= array_index loop
            array_to_configure(index_aux) := array_aux(index_aux);
            index_aux := index_aux + 1;
         end loop;
   end read_configuration;

   -----------------------------------------------------------------------------
   -----------------------------------------------------------------------------
   procedure build_track (MacroSegments		:in String_array_T;
                          MacroSegments_total	:in integer;
                          Segments_total	:out integer;
                          LP_track		:in out LP_track_ref_T;
                          LP_box		:in out LP_track_ref_T;
                          circuit		:in RI.Circuit_RI.Ref)

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
      --Race.Circuit.build_track(MacroSegments, MacroSegments_total);
      RI.Circuit_RI.build_track(circuit,
                                Race.CORBAConverter.to_StringSequence(MacroSegments),
                                CORBA.Long(MacroSegments_total),
                                CORBA.Long(Segments_total));

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
      use Ada, Ada.Strings;
      use Ada.Strings.Unbounded;
      use CosNaming.NamingContextExt;
      use CosNaming;
      use Race.CORBAConverter;
      Race_params	:String_array_Ref_T;
      Drivers_params	:String_array_Ref_T;
      MacroSegments_params :String_array_Ref_T;
      Race_file 	:String:="txt/race.txt";
      Drivers_file	:String:="txt/drivers.txt";
      MacroSegments_file:String:="txt/circuit.txt";
      Race_file_lines	:integer:=0;
      Drivers_file_lines:integer:=0;
      MacroSegments_file_lines:integer:=0;
      Segments_total	:integer;
      LP_track		:LP_track_Ref_T;
      LP_box		:LP_track_Ref_T;
      Drivers_index	:integer:=1;
      Driver_properties_aux: String_array_T(1..7);
      laps		:Positive:=1;
      blocking_speed	:float := 0.00000E+00;
      blocking_lane_one	:Positive := 1;
      blocking_lane_two	:Positive := 2;
      Current_driver	:integer:=0;

      IOR		:Ada.Strings.Unbounded.Unbounded_String;
      rootCxtExt 	:CosNaming.NamingContextExt.Ref;
      driver 		:RI.Driver_RI.Ref;
      circuit 		:RI.Circuit_RI.Ref;
      logger		:RI.Log_viewer.Ref;
      obj_name 		:CosNaming.Name;

      CORBAInit_P 	:StartupCORBAInit.CORBAInit_Ref;

   begin
      -- Read Race, Driver and Track configurations from file
      read_configuration(Race_file,Race_params,Race_file_lines);
      put("race: ok");new_line;

      read_configuration(Drivers_file,Drivers_params,Drivers_file_lines);
      put("drivers: ok");new_line;

      read_configuration(MacroSegments_file,MacroSegments_params,MacroSegments_file_lines);
      put("circuit: ok");new_line;

      -- Read NameService IOR from file
      Race.IorReader.read_IOR(IOR);

      -- Getting the NameService
      CORBA.ORB.Initialize ("ORB");
      CORBA.ORB.String_To_Object
        (CORBA.To_CORBA_String (TO_String(IOR)), rootCxtExt);

      if Is_Nil (rootCxtExt) then
         Put_Line ("statup : cannot locate NameService");
         return;
      end if;
      put("NameService IOR: ok ");new_line;

      -- Get race properties from configuration
      build_race(Race_Params.all, laps);

      begin
      -- Get circuit Remote Interface from Name Service
      Append (obj_name, NameComponent'(Id => To_CORBA_String ("Circuit"),
                                       Kind => To_CORBA_String ("")));
      circuit := RI.Circuit_RI.Helper.To_Ref(
                resolve_str(
                rootCxtExt,CosNaming.NamingContextExt.to_string(rootCxtExt,obj_name)));
      put_line("Got circuit from Name Service");

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
      build_track(MacroSegments_params.all, MacroSegments_file_lines, Segments_total, LP_track, LP_box, circuit);
      exception
         when others =>
            put_line("Unable to get Circuit from Name Service.");
            put_line("Circuit needed for building the track.");
            put_line("Race aborted.");
      end;

      begin
      -- Get logger Remote Interface from Name Service
      Replace_Element (obj_name,
                       1,
                       NameComponent'(Id => To_CORBA_String ("Logger"),
                                       Kind => To_CORBA_String ("")));
      logger := RI.Log_viewer.Helper.To_Ref(resolve_str(
                rootCxtExt,CosNaming.NamingContextExt.to_string(rootCxtExt,obj_name)));
      put_line("Got logger from Name Service");

      RI.Log_viewer.setEnvironment (logger,
                                    to_StringSequence(Drivers_params.all),--drivers
                                    CORBA.Long(Segments_total),
                                    CORBA.Short(1),	                  --t1
                                    CORBA.Short(1), 			  --t2
                                    CORBA.Short(laps));			  --number of laps
     exception
     		 when others =>
                  put_line("Unable to get logger from Name Service.");
                  put_line("Race will start without logs.");
     end;

      -- Lock first segment for driver initializations
--        Race.Circuit.LR_track.Element(1).all.enter(blocking_speed, blocking_lane_one);
--        Race.Circuit.LR_track.Element(1).all.enter(blocking_speed, blocking_lane_two);
      RI.Circuit_RI.enter(circuit,1,CORBA.Float(blocking_speed), CORBA.Short(blocking_lane_one));
      RI.Circuit_RI.enter(circuit,1,CORBA.Float(blocking_speed), CORBA.Short(blocking_lane_two));


      -- Create drivers and align them as per config file's order
      -- 7 is the number of the parameters for every driver
      while Drivers_index < drivers_file_lines loop
         Current_driver := Current_driver+1;
         Driver_properties_aux(1..7):=Drivers_params(Drivers_index..(Drivers_index+6));

         Replace_Element (obj_name, 1, NameComponent'(Id => To_CORBA_String ("Driver" & Fixed.Trim (Positive'Image(Current_driver), Strings.Both)),
                                       Kind => To_CORBA_String ("")));

         driver := RI.Driver_RI.Helper.To_Ref(resolve_str(
                rootCxtExt,CosNaming.NamingContextExt.to_string(rootCxtExt,obj_name)));
         put_line("Got " & "Driver" & Fixed.Trim (Positive'Image(Current_driver), Strings.Both) & " from Name Service");


         RI.Driver_RI.init (driver,
                      	to_RI_StringArray(Driver_properties_aux),
                      	CORBA.Short(Current_driver),
                       	to_RI_LPtrack(LP_track.all),
                        to_RI_LPtrack(LP_box.all),
                        CORBA.Short(laps));

         Drivers_index := Drivers_index + 7;

      end loop;


      -- Realese the lock in the first segment: Start the Race!
--        Race.Circuit.LR_track.Element(1).all.leave(1);
--        Race.Circuit.LR_track.Element(1).all.leave(2);
      RI.Circuit_RI.leave(circuit,1,CORBA.Short(blocking_lane_one));
      RI.Circuit_RI.leave(circuit,1,CORBA.Short(blocking_lane_two));

      -- Start CORBA ORB and wait for endRace
      CORBAInit_P := new StartupCORBAInit.CORBAInit;
      CORBAInit_P.init(Current_driver,
                       circuit,
                       logger,
                       rootCxtExt);


   end startup;


end Race.Startup;
