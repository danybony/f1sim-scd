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

with CORBA;
with PortableServer;

package RI.circuit_RI.Impl is

   type Object is new PortableServer.Servant_Base with null record;

   type Object_Acc is access Object;

   procedure enter
     (Self : access Object;
      segment : CORBA.Long;
      speed : in out CORBA.Float;
      lane : in out CORBA.Short);

   procedure leave
     (Self : access Object;
      segment : CORBA.Long;
      lane : in out CORBA.Short);

   procedure enter_Box
     (Self : access Object;
      segment : CORBA.Long;
      speed : in out CORBA.Float;
      lane : in out CORBA.Short);

   procedure leave_Box
     (Self : access Object;
      segment : CORBA.Long;
      lane : in out CORBA.Short);

   procedure build_track
     (Self : access Object;
      MacroSegments : RI.StringSequence;
      MacroSegments_total : CORBA.Long;
      Segments_total : out CORBA.Long);

   procedure endRace
     (Self : access Object);

end RI.circuit_RI.Impl;

