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
with Race.types; use Race.types;

package body Race is

   --  Function that check if a file is avaiable or not.
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

   --  Procedure that read teams, drivers configurations from file
   procedure read_configuration (
                                 text_file:		in	string;
                                 array_to_configure:	in out	Substring_array_T
                                ) is
      array_index:integer:=1;
      line_index:integer:=1;
      --  Temporary input file for every file reading
      input_file:file_type;
      -- Temporary string and char in wich store lines read in from file
      input_string:string(1..255);
      input_char:character;
   begin

      if file_exists(text_file) then
         --read file specs
         open(input_file, in_file, text_file);
         read_file_loop:
         while not end_of_file(input_file) loop
            line_index:=1;
            --read one line from file
            read_line_loop:
            while not end_of_line(input_file) or line_index > 255 loop
               get(input_file,input_char);
               input_string(line_index):=input_char;
               line_index:=line_index+1;
            end loop read_line_loop;
            --store the line in array
            array_to_configure(array_index)(1..line_index-1):=input_string(1..line_index-1);
            put(array_to_configure(array_index));new_line;
            array_index:=array_index+1;
            skip_line(input_file);
         end loop read_file_loop;


      end if;

   exception
      when end_error =>
         --  No newline at end of file: do nothing.
         null;
   end read_configuration;


   --  Procedure that set up the environment of the system and then start the
   --+ race.
   procedure startup is

      Teams:Substring_array_T(1..255);
      Drivers:Substring_array_T(1..255);
      Teams_file:String:="teams.txt";
      Drivers_file:String:="drivers.txt";

   begin
      read_configuration(Teams_file,Teams);
      put("teams: ok");
      read_configuration(Drivers_file,Drivers);
      put("drivers: ok");
   end startup;


end Race;
