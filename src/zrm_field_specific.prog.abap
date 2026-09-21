*&---------------------------------------------------------------------*
*& Report ZRM_FIELD_SPECIFIC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_field_specific.

"manual creation of field catalouge for tables this is report 1
" manula creation of field cataluge does not need the fm

INCLUDE ZRM_tables.

DATA: fcat  TYPE slis_t_fieldcat_alv,
      fwcat TYPE slis_fieldcat_alv.

PERFORM manual_field_layout.
PERFORM print.
*&---------------------------------------------------------------------*
*& Form manual_field_layout
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM manual_field_layout .
  " matnr,ebeln,  ebelp   ,uniqueid,loekz  , statu  ,  aedat  , txz01
  fwcat-col_pos = 1.
  fwcat-fieldname = 'MATNR'.
  fwcat-edit = 'x'.
  fwcat-seltext_l = 'matnr'.
  APPEND fwcat TO fcat.
  CLEAR fwcat.


  fwcat-col_pos = 2.
  fwcat-fieldname = 'ebeln'.
*fwcat-edit = 'x'.
  fwcat-seltext_l = 'ebelme'.
  APPEND fwcat TO fcat.
  CLEAR fwcat.

  fwcat-col_pos = 3.
  fwcat-fieldname = 'ebelp'.
*fwcat-edit = 'x'.
  fwcat-seltext_l = 'eblep'.
  APPEND fwcat TO fcat.
  CLEAR fwcat.

  fwcat-col_pos = 4.
  fwcat-fieldname = 'aedat'.
*fwcat-edit = 'x'.

  APPEND fwcat TO fcat.
  CLEAR fwcat.


  fwcat-col_pos = 5.
  fwcat-fieldname = 'uniqueid'.
*fwcat-edit = 'x'.

  APPEND fwcat TO fcat.
  CLEAR fwcat.

  fwcat-col_pos = 6.
  fwcat-fieldname = 'statu'.
*fwcat-edit = 'x'.

  APPEND fwcat TO fcat.
  CLEAR fwcat.

  fwcat-col_pos = 7.
  fwcat-fieldname = 'txz01'.
*fwcat-edit = 'x'.
  APPEND fwcat TO fcat.
  CLEAR fwcat.

  fwcat-col_pos = 8.
  fwcat-fieldname = 'loekz'.
  fwcat-seltext_l = 'ritesh'.
  APPEND fwcat TO fcat.
  CLEAR fwcat.



  fwcat-col_pos = 9.
  fwcat-fieldname = 'ABMNG'.
  fwcat-seltext_l = 'sum'.
  fwcat-do_sum = 'x'.
  APPEND fwcat TO fcat.
  CLEAR fwcat.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form print
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM print .


*  now printing using alv grid
  " alv
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

ENDIF.
ENDFORM.
