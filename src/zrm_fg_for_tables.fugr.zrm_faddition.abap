FUNCTION ZRM_FADDITION.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(NUM1) TYPE  DECIMALS
*"     REFERENCE(NUM2) TYPE  DECIMALS
*"     REFERENCE(NUM3) TYPE  DECIMALS
*"  CHANGING
*"     REFERENCE(ADDITION) TYPE  DECIMALS
*"     REFERENCE(VOLUME_OF_CUBOID) TYPE  DECIMALS
*"     REFERENCE(TOTAL_SURFACE) TYPE  DECIMALS
*"     REFERENCE(LATRAL_SURFACE_AREA) TYPE  DECIMALS
*"  EXCEPTIONS
*"      NUMBER_NOT_FOUND
*"----------------------------------------------------------------------

WRITE: / 'Find Cuboid volume , total surface area , lateral surface area'.
addition  =  num1 + num3 + num2.
volume_of_cuboid = num1 * num2 * num3.
total_surface = 2 * ( ( num2 *  num3 ) + ( num3 * num1 ) + ( num2 * num1 ) ).
latral_surface_area = 2 * num1 * ( num2 + num3 ).
ENDFUNCTION.
