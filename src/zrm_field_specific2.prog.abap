*&---------------------------------------------------------------------*
*& Report ZRM_FIELD_SPECIFIC2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZRM_FIELD_SPECIFIC2.


include ZRM_tables.
data: fcat type SLIS_T_FIELDCAT_ALV.

CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
 EXPORTING
   I_PROGRAM_NAME               = 'ZRM_FIELD_SPECIFIC2'
   I_STRUCTURE_NAME             = 'ZRM_EKPOSTRUCT'
*   I_CLIENT_NEVER_DISPLAY       = 'X'
*   I_INCLNAME                   =
*   I_BYPASSING_BUFFER           =
*   I_BUFFER_ACTIVE              =
  CHANGING
    ct_fieldcat                  = fcat
 EXCEPTIONS
   INCONSISTENT_INTERFACE       = 1
   PROGRAM_ERROR                = 2
   OTHERS                       = 3
          .
IF sy-subrc <> 0.
MESSAGE 'someting went wrong bro !' type 'E'.
LEAVE TO LIST-PROCESSING.

ENDIF.


CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
 EXPORTING
   IT_FIELDCAT                       = fcat
  TABLES
    t_outtab                          = it_ekpo
 EXCEPTIONS
   PROGRAM_ERROR                     = 1
   OTHERS                            = 2
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.
