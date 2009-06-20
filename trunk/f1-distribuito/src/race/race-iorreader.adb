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

with text_io;
with Ada.Strings.Unbounded;


package body Race.IorReader is

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
   --  Procedure that read IOR from file
   procedure read_IOR (
                                 IOR_str:		in out	Ada.Strings.Unbounded.Unbounded_String
                                ) is
      use Ada.Strings.Unbounded;
      use text_io;
      line_index:integer:=1;
      --  Temporary input file for every file reading
      input_file:file_type;
      -- Temporary string and char in wich store lines read in from file
      input_string:string(1..1024);
      input_char:character;
	 text_file : string := "/home/daniele/SCD/f1-export_new/txt/ior.txt";
   begin
      put("reading IOR...");
      if file_exists(text_file) then
         put("file present!");new_line;
         --read file specs
         open(input_file, in_file, text_file);

            --read one line from file
            read_line_loop:
            while not end_of_line(input_file) and line_index < 1024 loop
               get(input_file,input_char);
               input_string(line_index):=input_char;
               line_index:=line_index+1;
            end loop read_line_loop;

            --store the IOR
            IOR_str:=To_unbounded_string(input_string(1..line_index-1));

            --skip to the next text line
         skip_line(input_file);
         close(input_file);
      end if;

   exception
      when end_error =>
         --  No newline at end of file: do nothing.
         null;
   end read_IOR;

end Race.IorReader;
