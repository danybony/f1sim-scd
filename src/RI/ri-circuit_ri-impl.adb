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


with CORBA.ORB;
with RI.circuit_RI.Skel;
with Race.Circuit; use Race.Circuit;
with Race.CORBAConverter; use Race.CORBAConverter;

pragma Warnings(Off, RI.circuit_RI.Skel);

package body RI.circuit_RI.Impl is



   procedure enter
     (Self : access Object;
      segment : CORBA.Long;
      speed : in out CORBA.Float;
      lane : in out CORBA.Short) is

      pragma Warnings (Off);
      pragma Unreferenced (Self);
      pragma Warnings (On);
   begin

      LR_track.Element(integer(segment)).all.enter(Float(speed), Positive(lane));


   end enter;



   procedure leave
     (Self : access Object;
      segment : CORBA.Long;
      lane : in out CORBA.Short) is

      pragma Warnings (Off);
      pragma Unreferenced (Self);
      pragma Warnings (On);
   begin

      LR_track.Element(integer(segment)).all.leave(Positive(lane));
      --  segmento.all.leave;

   end leave;


   procedure enter_Box
     (Self : access Object;
      segment : CORBA.Long;
      speed : in out CORBA.Float;
      lane : in out CORBA.Short) is

      pragma Warnings (Off);
      pragma Unreferenced (Self);
      pragma Warnings (On);
   begin

      LR_box.Element(integer(segment)).all.enter(Float(speed), Positive(lane));

   end enter_Box;



   procedure leave_Box
     (Self : access Object;
      segment : CORBA.Long;
      lane : in out CORBA.Short) is

      pragma Warnings (Off);
      pragma Unreferenced (Self);
      pragma Warnings (On);
   begin

      LR_box.Element(integer(segment)).all.leave(Positive(lane));
      --  segmento.all.leave;

   end leave_Box;


   procedure build_track
     (Self : access Object;
      MacroSegments : RI.StringSequence;
      MacroSegments_total : CORBA.Long;
      Segments_total : out CORBA.Long) is

      pragma Warnings (Off);
      pragma Unreferenced (Self);
      pragma Warnings (On);
   begin

      build_track(Race.Corbaconverter.to_String_Array_T(MacroSegments), integer(MacroSegments_total), integer(Segments_total));

   end build_track;

   procedure endRace
     (Self : access Object) is

   begin

      CORBA.ORB.shutdown(false);

   end endRace;


end RI.circuit_RI.Impl;
