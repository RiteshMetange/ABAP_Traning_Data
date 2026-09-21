*&---------------------------------------------------------------------*
*& Report ZRM_FUNTIONMOD
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_funtionmod.


PARAMETERS:
  P_num1 TYPE decimals,
  P_num2 TYPE decimals,
  P_num3 TYPE decimals.

DATA: result1 TYPE decimals, " result1 type p decimals 2.
      result2 TYPE decimals,
      result3 TYPE decimals,
      result4 TYPE decimals.
FIELD-SYMBOLS: <fs1> TYPE any,
               <fs2> TYPE any,
               <fs3> TYPE any,
               <fs4> TYPE any.

  ASSIGN result1 TO <fs1>.
  ASSIGN result2 TO <fs2>.
  ASSIGN result3 TO <fs3>.
  ASSIGN result4 TO <fs4>.

AT SELECTION-SCREEN.
IF P_num1 IS INITIAL AND P_num2 IS INITIAL  AND P_num3 IS INITIAL.
    MESSAGE w000(ZRM_msg).
ENDIF.
END-OF-SELECTION.



CALL FUNCTION 'ZRM_FADDITION'
  EXPORTING
    num1                      = p_num1
    num2                      = p_num2
    num3                      = p_num3
  CHANGING
    addition                  =   <fs1>
    volume_of_cuboid          =     <fs2>
    total_surface             =   <fs3>
    latral_surface_area       =   <fs4>
 EXCEPTIONS
   NUMBER_NOT_FOUND          = 1
   OTHERS                    = 2
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.



write : / 'simple addition ', <fs1>.
write : / 'area of cuboid ', <fs2>.
write : / 'total surface ', <fs3>.write : / 'latral surafece', <fs4>.
