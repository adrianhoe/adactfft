--------------------------------------------------------------------------------
--  *  Prog name ctffttest.adb
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
with Ada.Calendar;
with Ada.Text_IO, Ada.Float_Text_IO;
with Ada.Numerics, Ada.Numerics.Generic_Elementary_Functions;
with Ada.Numerics.Float_Random;
use  Ada.Calendar;
use  Ada.Numerics, Ada.Numerics.FLoat_Random;
use  Ada.Text_Io, Ada.Float_Text_IO;

with Ctfft, Vector;
use  Ctfft, Vector;

procedure Ctffttest is

   package Math is new Ada.Numerics.Generic_Elementary_Functions (Real_Number);
   use Math;
   
   Q : constant := 30.0 * 2.0 * Pi / 2 ** 8;

   G : Generator;
   
   Start_Time, End_Time : Time;
   Total_Time : Duration;
   
   Data_1 : Real_Vector_Type (1 .. 8) := (0.0, 1.0, 2.0, 3.0,
                                          4.0, 5.0, 6.0, 7.0);

   Data_2 : Real_Vector_Type (1 .. 32) := (0.0, 1.0, 2.0, 3.0,
                                           4.0, 5.0, 6.0, 7.0,
                                           8.0, 9.0, 10.0, 11.0,
                                           12.0, 13.0, 14.0, 15.0,
                                           16.0, 17.0, 18.0, 19.0,
                                           20.0, 21.0, 22.0, 23.0,
                                           24.0, 25.0, 26.0, 27.0,
                                           28.0, 29.0, 30.0, 31.0);
                                           
   Data_3 : Real_Vector_Type (1 .. 2 ** 4);

begin
--   Put (Data_1, 8);
--   New_Line;
   Fft (Data_1);
--   Put (Data_1, 8);
   
   New_Line;
--   Put_Line ("------------------------------------------------------------");
--   New_Line;
   
--   Put (Data_2, 8);
--   New_Line;
   Fft (Data_2);
--   Put (Data_2, 8);
   
   New_Line;
--   Put_Line ("------------------------------------------------------------");
   New_Line;
   
   for N in Data_3'Range loop
      Data_3 (N) := Sin (Q * Real_Number (N)) + Real_Number (Random (G)) - 1.0 / 2.0;
   end loop;
--   Put (Data_3, 8);
   
   Start_Time := Clock;
   Fft (Data_3);
   End_Time := Clock;
   
   Total_Time := End_Time - Start_Time;

   Put ("Computation time: ");
   Put (Float (Total_Time), Exp => 0, Aft => 8);
   
   New_Line;
   
end Ctffttest;
