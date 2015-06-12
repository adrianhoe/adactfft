--------------------------------------------------------------------------------
--  *  Body name ctfft.adb
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
with Ada.Text_Io, Ada.Integer_Text_Io;
use  Ada.Text_Io, Ada.Integer_Text_Io;

with Ada.Numerics, Ada.Numerics.Generic_Elementary_Functions;
use  Ada.Numerics;

with Vector;
use  Vector, Vector.Complex_Types;

package body Ctfft is

   package Math is new Ada.Numerics.Generic_Elementary_Functions (Real_Number);
   
   use Math;
   
   Two_Pi : constant := 2.0 * Pi;
   
   procedure Swap (A, B : in out Complex_Number) is
      T : Complex_Number;
   begin
      T := A;
      A := B;
      B := T;
   end Swap;
   
   procedure Scramble (Xc : in out Complex_Vector_Type) is
      N, J, K : Integer;
   begin
      N := Xc'Length;
      J := 1;
      for I in 1 .. N - 1 loop
         if I < J then
            Put (I); Put (","); Put (J);
            New_Line;
            Swap (Xc (I), Xc (J));
         end if;
         K := N / 2;
         while K < J loop
            J := J - K;
            K := K / 2;
         end loop;
         J := J + K;
      end loop;
   end Scramble;
   
   procedure Compute_Fft (Xc : in out Complex_Vector_Type) is
      M, N, I : Integer;
      Xt, ω  : Complex_Number;
      φ : Real_Number;
   begin
      N := Xc'Length;
      M := 1;
      
      Put_Line ("         M             J            I          I+M");
      Put_Line ("----------  ------------  -----------  -----------");
      while M < N loop
         for J in 1 .. M loop
            φ := Two_Pi * Real_Number (J - 1) / Real_Number (2 * M);
            ω := (Cos (φ), -Sin (φ));
            I := J;
            while I < N loop
               Put (M); Put (","); Put (J); Put (","); Put (I); Put (","); Put (I + M);
               New_Line;
               Xt         := Xc (I + M) * ω;
               Xc (I + M) := Xc (I) - Xt;
               Xc (I)     := Xc (I) + Xt;
               I := I + M * 2;
            end loop;
         end loop;
         M := M * 2;
      end loop;
               
   end Compute_Fft;

   procedure Fft (X : in out Real_Vector_Type) is
      Xc : Complex_Vector_Type (X'Range);
      R  : constant Complex_Number := (1.0, 0.0);
   begin
      for I in X'Range loop
         Xc (I) := R * X (I);
      end loop;
      
      Scramble (Xc);
      Compute_Fft (Xc);
      
      for I in X'Range loop
         X (I) := abs Xc (I);
      end loop;
   end Fft;
         
end Ctfft;
