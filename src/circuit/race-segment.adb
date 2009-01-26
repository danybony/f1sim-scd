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


package body Race.Segment is

   --  static variable used as the T0 reference basis for
   --+ the running counter of the elapsed time
   --Passed : Time_Span;

   --  Segment_T is a monitor that control access to a segment
   --  In the other hand, Segment_spec_T contains all the infos
   --  about a segment i.
   protected body Segment_T is

      --  get the segment
      entry Enter (Driver_ID	:positive;
		   Speed	:positive
                  ) when not in_use is
      begin
         in_use:=true;
      end Enter;

      --  release the segment
      --+ (formal parameter not used explicitly
      --+  but needed for distributed dispatching)
      entry Leave (Driver_ID	:positive) when in_use is
      begin
         in_use:=false;
      end Leave;

   end Segment_T;

end Race.Segment;
