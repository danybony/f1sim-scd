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

--  Package that expose the interface for log system.
--+ Used by packages Race and Race.Circuit


package Race.Log is

	--  Procedure called by a driver every time he entered a segment.
	--+ Update the system log

	procedure updateLog(
		--Quick identifier for every pilot
		Driver_ID	:positive;

		--Segment in wich the driver has entered
		Segment		:positive;

		--Current speed of the driver
		Speed		:positive;
		)

	--  Initialization procedure, execute one time at system startup.
	procedure setEnvironment(
		--Array with expanded Team names
		Teams		:Substring_array_T(1..255);

		--Array with expanded Driver names
		Drivers		:Substring_array_T(1..255);

		--Total number of circuit segments
		SegmentNumber	:Positive;

		--Numbers of two segments in wich take intermediate times
		T1		:Positive;
		T2		:Positive;

		--Total number of laps of the race
		RaceLaps	:Positive;
)

end Race.Log
 