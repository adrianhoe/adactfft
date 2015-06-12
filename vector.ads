--------------------------------------------------------------------------------
--  *  Spec name vector.ads
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
with Ada.Numerics.Generic_Complex_Types;


package Vector is

   
   subtype Index              is Positive;
   subtype Real_Number        is Long_Long_Float;

   package Complex_Types is
      new Ada.Numerics.Generic_Complex_Types (Real_Number);

   use Complex_Types;

   subtype Complex_Number     is Complex;
   
   type Real_Vector_Type      is array (Index range <>) of Real_Number;
   type Real_Vector_Handle    is access Real_Vector_Type;
   
   type Complex_Vector_Type   is array (Index range <>) of Complex_Number;
   type Complex_Vector_Handle is access Complex_Vector_Type;
   
--   procedure Get (Num   :    out Real_Vector_Type);
   
--   procedure Get (File  : in     File_Type;
--                  Num   :    out Real_Vector_Type);
   
   procedure Put (Data  : in     Real_Vector_Type;
                  Width : in     Integer := 1);
                  
--   procedure Put (File  : in     File_Type;
--                  Num   : in     Real_Vector_Type;
--                  Width : in     Integer := 1);
end Vector;
