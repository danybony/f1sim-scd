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

package body Race is

   --  function that check if a file is avaiable or not.
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


   --  Procedure that set up the environment of the system and then start the
   --+ race.
   procedure startup() is

      Teams:Teams_array_T;
      Teams_index:integer;
      Drivers:Drivers_array_T;
      Drivers_index:integer;
      Teams_file:String:="teams.txt";
      Drivers_file:String;
      --  Temporary input file for every file reading
      input_file:file_type;
      -- Temporary string and char in wich store lines read in from file
      input_string:string(1..255);
      input_char:character;
      index:integer;
   begin

      if file_exists(Teams_file) then
         --read Teams specs
         open(input_file, in_file, Teams_file);
         read_file_loop:
         while not end_of_file(input_file) loop
            index:=0;
            --read one line from file
            read_line_loop:
            while not end_of_line(input_file) or index > 254 loop
               get(input_file,input_char);
               input_string(index):=input_char;
            end loop read_line_loop;
            --store the line (Team name) in Teams
            Teams(teams_index):=input_string(0..index);
            teams_index:=teams_index+1;
         end loop read_file_loop;


      end if;

   end startup;


end Race;
