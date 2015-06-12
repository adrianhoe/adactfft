--------------------------------------------------------------------------------
--  *  Spec name ctfft.ads
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
with Vector;
use  Vector;

package Ctfft is

   procedure Fft (X : in out Real_Vector_Type);
    
end Ctfft;
