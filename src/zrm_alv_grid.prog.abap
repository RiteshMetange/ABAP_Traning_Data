*&---------------------------------------------------------------------*
*& Include          ZRM_ALV_GRID
*&---------------------------------------------------------------------*
"onely for alv and grid display





*CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
* EXPORTING
*   I_STRUCTURE_NAME                  = 'EKPO'
*  TABLES
*    t_outtab                         = it_ekpo
* EXCEPTIONS
*   PROGRAM_ERROR                     = 1
*   OTHERS                            = 2
*          .
*IF sy-subrc <> 0.
*message 'error occured at runtime' TYPE 'E'.
*ENDIF.




CALL FUNCTION 'REUSE_ALV_LIST_DISPLAY'
 EXPORTING
   I_STRUCTURE_NAME               = 'ZRM_EKPOSTRUCT'
  TABLES
    t_outtab                       = it_ekpo
* EXCEPTIONS
*   PROGRAM_ERROR                  = 1
*   OTHERS                         = 2
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.
