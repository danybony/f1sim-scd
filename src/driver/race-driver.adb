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


with Race.Segment; use Race.Segment;
with Ada.Integer_Text_IO;
with text_io;


--  This package contains driver interface definition.

package body Race.Driver is


   task body Driver is
   use text_io;

   begin
      accept init (params	: Substring_array_T;
                   position	: Positive)
      do
         declare
	   use Ada.Integer_Text_IO;
	   Strategy:Strategy_T(1..5);--max 5 pit stops
	   Strategy_string:String(params(7)'Range);
	   string_buffer:String:="00";--max 2 digits in lap number
	   buffer_index:integer:=0;--string_buffer index
	   index:integer:=1;--strategy string array index
	   strategy_index:integer:=0;--strategy array index
	   --driver:Driver_Ref_T;
	   last:Positive;
         begin
	   Strategy_string := params(7);
      	   -- read strategy (lap numbers)  from params. Assume at least 1 pit stop.
      	   while (index<Strategy_string'last) loop
		if strategy_string(index)=',' then
            	-- convert string to lap number and flush the buffer
		   if buffer_index>0 then
			strategy_index := strategy_index +1;
               		get(string_buffer,Strategy(strategy_index), Last);
               		string_buffer := "00";
               		buffer_index := 0;
               		index := index + 1;
		   end if;
         	else
            	   if strategy_string(index)>='0' and strategy_string(index)<='9' then
               		-- accumulate digits in the buffer
               		buffer_index := buffer_index + 1;
               		string_buffer(buffer_index) := strategy_string(index);
            	   end if;
         	end if;
	   end loop;
      --driver := new Driver(
      --           params(1), -- Driver's name
      --           params(3), -- ID (Car number)
      --           params(2), -- Driver Team's name
      --          params(4), -- Accel coefficient
      --           params(5), -- Brake coefficient
      --           params(6), -- Max Speed
      --           strategy,  -- Strategy (list of pit stop laps)
      --           position,  -- Start position
      --           0	    -- Laps done so far
      --          );
         end;
      end init;

      loop
         --put(Name.all);
         delay 10.0;
      end loop;
   end Driver;

end Race.Driver;
