*&---------------------------------------------------------------------*
*& Report ZRM_IFELSE_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_ifelse_report.


PARAMETERS:
  var1 TYPE i,
  var2 TYPE i,
  var3 TYPE i.


IF var1 GT var2.
  WRITE : 'var1',var1 ,'greater than ',var2.
ELSE.
  WRITE:  'var2',var2 ,'greater than ',var1.
ENDIF.
