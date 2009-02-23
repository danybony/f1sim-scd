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
with text_io; use text_io;


--  This package contains driver interface definition.

package body Race.Driver is


   task body Driver is
   --  		(

   --             Name		: String;
   --             ID		: Positive;
   --		Team		: String;
   --   		Accel_Coeff	: Positive;
   --   		Brake_Coeff	: Positive;
   --   		Max_Speed	: Positive;
   --   		Strategy	: Strategy_T;
   --   		Position	: Positive;
   --   		Laps_Done	: Positive
   --                )is
   begin
      loop
         put(Name.all);
         delay 10.0;
      end loop;
   end Driver;


   procedure Driver_init(
                         params		: Substring_array_T;
                         position	: Positive
                        )is
      Strategy:Strategy_T(1..5);
      Strategy_string:String(1..5);
      string_buffer:String(1..2);
      index:integer:=1;
      buffer_index:integer:=0;
      strategy_index:integer:=0;
      driver:Driver_Ref_T;
   begin
      Strategy_string := params(7);
      -- read strategy (lap numbers)  from params. Assume at least 1 pit stop.
      while (index<Strategy_string'last) loop
         if strategy_string(index)=',' then
            -- convert string to lap number and flush the buffer
            if buffer_index>0 then
               strategy_index := strategy_index +1;
               Ada.Integer_Text_IO.get(string_buffer,Strategy(strategy_index), 0);
               string_buffer := "";
               buffer_index := 0;
               index := index + 1;
            end if;

         else
            if strategy_string(index)>='0' and strategy_string(index)<='9' then
               -- accumulate the digit in the buffer
               buffer_index := buffer_index + 1;
               string_buffer(buffer_index) := strategy_string(index);
            end if;
         end if;
      end loop;





      driver := new Driver(
                 params(1), -- Driver's name
                 params(3), -- ID (Car number)
                 params(2), -- Driver Team's name
                 params(4), -- Accel coefficient
                 params(5), -- Brake coefficient
                 params(6), -- Max Speed
                 strategy,  -- Strategy (laps when driver go to box)
                 position,  -- Start position
                 0	    -- Laps done
                );
   end Driver_init;



end Race.Driver;
