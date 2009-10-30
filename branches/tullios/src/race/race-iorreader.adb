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

with Text_IO;
with Ada.Strings.Unbounded;


package body Race.IorReader is

   --  This function check if a file is avaiable or not.
   --+ Return true if the file exists
   --+ Return false otherwise
   function file_exists(
                        name :String
                       ) return Boolean is
      use Text_IO;
      input_file:File_Type;

   begin
      Open(input_file, in_file, name);
      --  if it worked, close the file and return true
      Close(input_file);
      return True;

   exception
      when Name_Error =>
         --  couldn't open the file
         return False;

   end file_exists;

   -----------------------------------------------------------------------------
   -----------------------------------------------------------------------------
   --  Procedure that read IOR from file
   procedure read_IOR (
                                 IOR_str:    in out   Ada.Strings.Unbounded.Unbounded_String
                                ) is
      use Ada.Strings.Unbounded;
      use Text_IO;
      line_index:Integer:=1;
      --  Temporary input file for every file reading
      input_file:File_Type;
      --  Temporary string and char in wich store lines read in from file
      input_string:String(1..1024);
      input_char:Character;
      text_file : constant String := "txt/ior.txt";
   begin
      Put("reading IOR...");
      if file_exists(text_file) then
         Put("file present!"); New_Line;
         --  read file specs
         Open(input_file, in_file, text_file);

            --  read one line from file
            read_line_loop:
            while not End_Of_Line(input_file) and line_index < 1024 loop
               Get(input_file,input_char);
               input_string(line_index):=input_char;
               line_index:=line_index+1;
            end loop read_line_loop;

            --  store the IOR
            IOR_str:=To_Unbounded_String(input_string(1..line_index-1));

            --  skip to the next text line
         Skip_Line(input_file);
         Close(input_file);
      end if;

   exception
      when End_Error =>
         --  No newline at end of file: do nothing.
         null;
   end read_IOR;

end Race.IorReader;
