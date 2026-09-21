*&---------------------------------------------------------------------*
*& Report ZRM_INCLUDE_SUBROUTINES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_include_subroutines.

INCLUDE ZRM_Tabledeclaration.


PERFORM fetching.
PERFORM createcat.
PERFORM display_alv_report.



*&---------------------------------------------------------------------*
*& Form fetching
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
form fetching .
SELECT ebeln, loekz,ebelp FROM ekpo INTO CORRESPONDING FIELDS OF TABLE @it_ekpo.
*  loop at it_ekpo ASSIGNING FIELD-SYMBOL(<fsekpo>).
*    write: / <fsekpo>-ebeln , <fsekpo>-ebelp , <fsekpo>-loekz.
*    ENDLOOP.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form display_alv_report
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_alv_report .
*CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
* EXPORTING
*   I_STRUCTURE_NAME                  =  'ZDUMMYSTRUCT' "same as our table structure ty_ekko
*  TABLES
*    t_outtab                          = it_ekpo
* EXCEPTIONS
*   PROGRAM_ERROR                     = 1
*   OTHERS                            = 2
*          .
*IF sy-subrc <> 0.
*message I000(ZRM_msg).
*ENDIF.
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      it_fieldcat   = it_fclog
    TABLES
      t_outtab      = it_ekpo
    EXCEPTIONS
      program_error = 1
      OTHERS        = 2.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.



*  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
*   EXPORTING
*     IT_FIELDCAT                        = it_fclog
*    TABLES
*      t_outtab                          = it_ekpo
*   EXCEPTIONS
*     PROGRAM_ERROR                      = 1
*     OTHERS                             = 2
*            .
*  IF sy-subrc <> 0.
*    message 'alv error occured in this' type 'E'.
*  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form createcat
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM createcat.
*
*CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
* EXPORTING
*   I_PROGRAM_NAME               = sy-repid
*   I_INTERNAL_TABNAME           =  it_ekpo
*   I_STRUCTURE_NAME             = 'EKPO'
*  CHANGING
*    ct_fieldcat                  = it_fclog
* EXCEPTIONS
*   INCONSISTENT_INTERFACE       = 1
*   PROGRAM_ERROR                = 2
*   OTHERS                       = 3
*          .
*IF sy-subrc <> 0.
* message 'field cataluge  error occured in this' type 'E'.
*ENDIF.


  wa_fclog-col_pos = '1'.
  wa_fclog-fieldname = 'EBELN'.
  wa_fclog-seltext_l = 'my custom field 1'.
  wa_fclog-seltext_m = 'my custom field 1'.
  wa_fclog-seltext_s = 'my custom field 1'.
  APPEND wa_fclog TO it_fclog.

  wa_fclog-col_pos = '2'.
  wa_fclog-fieldname = 'BUKRS'.
  wa_fclog-seltext_l = 'my custom field 2'.
  wa_fclog-seltext_m = 'my custom field 2'.
  wa_fclog-seltext_s = 'my custom field 2'.
  APPEND wa_fclog TO it_fclog.


  wa_fclog-col_pos = '3'.
  wa_fclog-fieldname = 'EBELP'.
  wa_fclog-seltext_l = 'my custom field 3'.
  wa_fclog-seltext_m = 'my custom field 3'.
  wa_fclog-seltext_s = 'my custom field 3'.
  APPEND wa_fclog TO it_fclog.

ENDFORM.
