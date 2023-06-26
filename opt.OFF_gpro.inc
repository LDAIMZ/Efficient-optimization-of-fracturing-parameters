--
-- -----------------------------------------------------------------------------
-- Office Grid Properties (GRDPROP) Data Section Version 2018.1 Jul 13 2018
-- -----------------------------------------------------------------------------
--
-- File: OPT.OFF_GPRO.INC
-- Created on: 2023-Feb-17 at: 17:52:38
--
-- *****************************************************************************
-- *                                  WARNING                                  *
-- *                THIS FILE HAS BEEN AUTOMATICALLY GENERATED.                *
-- *          ANY ATTEMPT TO EDIT MANUALLY MAY RESULT IN INVALID DATA.         *
-- *****************************************************************************
--
NOECHO
--
-- -----------------------------------------------------------------------------
-- Office Grid Properties (GRDPROP) Data Section Version 2018.1 Jul 13 2018
-- -----------------------------------------------------------------------------
--
-- File: opt.OFF_gpro.inc
-- Created on: 2022-Oct-19 at: 11:00:30
--
-- *****************************************************************************
-- *                                  WARNING                                  *
-- *                THIS FILE HAS BEEN AUTOMATICALLY GENERATED.                *
-- *          ANY ATTEMPT TO EDIT MANUALLY MAY RESULT IN INVALID DATA.         *
-- *****************************************************************************
--
ACTNUM
500000*1

/
 
-- Property name in Petrel : Porosity
INCLUDE
'por.txt' /
--PORO
--500000*0.08
--/
 
-- Property name in Petrel : Permeability
INCLUDE
'perm.txt'/
--PERMX
--500000*0.01
--/
 
ECHO
--INCLUDE
--'permreal.txt'/
COPY
PERMX PERMY /
/
 
COPY
PERMX PERMZ /
/
 
MULTIPLY
PERMZ 0.5 /
/
 
INCLUDE
'fractureperm.inc' /
/