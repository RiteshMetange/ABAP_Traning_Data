*&---------------------------------------------------------------------*
*& Report ZRM_CONSTANTS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_constants.


* variable declarations
CONSTANTS : pi TYPE p DECIMALS 2 VALUE '3.14'.
data: volume_of_eli type p DECIMALS 2,
      area_of_t type p DECIMALS 2.



PARAMETERS:
  height TYPE i ,
  width  TYPE i ,
  length TYPE i,
  bs type i DEFAULT 0.

* oprations
"data enterd from eclipse ide
WRITE : / 'Volume of an Elliptical Cylinder'.
volume_of_eli = ( pi * length * height * width ) / 4.
write: / 'answer : ',volume_of_eli.


write : / 'area of triangle '.
area_of_t = ( 1 / 2 ) * bs * height.
write : area_of_t.
