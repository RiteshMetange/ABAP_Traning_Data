*&---------------------------------------------------------------------*
*& Report ZRM_FETCHINGRECORDS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_fetchingrecords.


TABLES: mara.

TYPES : BEGIN OF ty_mara ,
          matnr TYPE matnr,
          matkl TYPE matkl,
          mtart TYPE mtart,
        END OF ty_mara.

DATA: int_table TYPE TABLE OF ty_mara,
      warea     TYPE ty_mara.


"PARAMETERS: p_input TYPE matnr  MODIF ID abc.               " no display will hide completely
SELECT-OPTIONS : s_matnr FOR mara-matnr.


INITIALIZATION.
  s_matnr-sign = 'E'.
  s_matnr-option = 'EQ'.
  s_matnr-low = '10'.
  s_matnr-high = '39'.
  APPEND s_matnr.


*  SELECTION-SCREEN : BEGIN OF BLOCK b9 WITH FRAME TITLE TEXT-001.
*    PARAMETERS:
*      rb1 RADIOBUTTON GROUP xyz USER-COMMAND click ,
*      rb2 RADIOBUTTON GROUP xyz,
*      rb3 RADIOBUTTON GROUP xyz.
*  SELECTION-SCREEN : END OF BLOCK b9.
*
*AT SELECTION-SCREEN OUTPUT.
*  LOOP AT SCREEN.
*
*    IF screen-group1 = 'ABC'.     " id must be in capital letters !
*      IF rb1 = 'X'.
*        screen-active = 0.
*      ELSE.
*        screen-active = 1.
*      ENDIF.
*      MODIFY SCREEN.
*    ENDIF.
*  ENDLOOP.
*  end-of-SELECTION.

START-OF-SELECTION.

  SELECT FROM mara
    FIELDS matnr , matkl , mtart
      WHERE matnr IN @s_matnr
    INTO TABLE @int_table UP TO 10 rows.

*    select from mara
*      FIELDS matnr , matkl , mtart
*      where matnr eq '000000001041000047'
*      into table @int_table.

  LOOP AT int_table INTO warea.
    if sy-subrc is INITIAL.
      write : 'records found'.
    WRITE : / warea-matkl , warea-matnr.
    else .
      write: 'nothig found'.
      endif.
  ENDLOOP.

END-OF-SELECTION.
