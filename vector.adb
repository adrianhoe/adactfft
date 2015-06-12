--------------------------------------------------------------------------------
--  *  Body name vector.adb
--  *  Project name ctffttest
--  *
--  *  Version 1.0
--  *  Last update 11/5/08
--  *
--  *  Created by Adrian Hoe on 11/5/08.
--  *  Copyright (c) 2008 AdaStar Informatics http://adastarinformatics.com
--  *  All rights reserved.
--  *
--------------------------------------------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;

package body Vector is

   package Io_Double is new Float_Io (Real_Number);
   use Io_Double;
    
   procedure Put (Data  : in     Real_Vector_Type;
                  Width : in     Integer := 1)
   is
      Counter : Integer := 1;
   begin
      for I in Data'Range loop
         Put (Item => Data (I), Aft => 5, Exp => 0);
         if Counter mod Width = 0 then
            New_Line;
         else
            Put ("   ");
         end if;
         Counter := Counter + 1;
      end loop;
   end Put;
   
end Vector;
