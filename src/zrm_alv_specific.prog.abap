*&---------------------------------------------------------------------*
*& Report ZRM_ALV_SPECIFIC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*


" this report is using alv only.

REPORT ZRM_ALV_SPECIFIC.

include ZRM_tables.

include ZRM_ALV_grid.



*perform ZRM_list_grid.
*&---------------------------------------------------------------------*
*& Form ZRM_list_grid
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM ZRM_list_grid .
  CALL FUNCTION 'REUSE_ALV_LIST_DISPLAY'
    EXPORTING
      i_structure_name = 'ZRM_EKPOSTRUCT'
    TABLES
      t_outtab         = it_ekpo
    EXCEPTIONS
      program_error    = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
ENDFORM.
