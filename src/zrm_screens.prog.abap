*&---------------------------------------------------------------------*
*& Report ZRM_SCREENS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_screens.
DATA: my_matnr TYPE matnr.
TABLES: makt.
DATA: ProjectNo TYPE zpr_no.



*first block for project description
SELECTION-SCREEN : BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-000.

  PARAMETERS: P_title TYPE zpr_desc.

*select options for range
  SELECT-OPTIONS : s_ono FOR  ProjectNo OBLIGATORY."DEFAULT 1 to 5 , no-extension , no intervals

* for single value
  PARAMETERS: P_contr TYPE zpr_dloc OBLIGATORY DEFAULT 'INR'.

  SELECT-OPTIONS : s_matnar FOR my_matnr.




*  second block : inside b1
  SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

    SELECTION-SCREEN BEGIN OF LINE.
      " Button 1: Development
      PARAMETERS :
      p_rd1 TYPE c RADIOBUTTON GROUP one.
      SELECTION-SCREEN: COMMENT 3(13) TEXT-101.

      " Button 2: Production
      PARAMETERS :
      p_rd2 TYPE c RADIOBUTTON GROUP one.
      SELECTION-SCREEN COMMENT  19(13) TEXT-102.

      " Button 3: Testing
      PARAMETERS : p_rd3 TYPE c RADIOBUTTON GROUP one.
      SELECTION-SCREEN : COMMENT  35(10) TEXT-103.
    SELECTION-SCREEN END OF LINE.

  SELECTION-SCREEN END OF BLOCK b2.
SELECTION-SCREEN : END OF BLOCK b1.



* third  block
SELECTION-SCREEN : BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-001.
*  language options
  PARAMETERS: p_lang TYPE spras.

  SELECTION-SCREEN : BEGIN OF LINE.
    PARAMETERS:
    p_ch1 AS CHECKBOX DEFAULT 'X'.
    SELECTION-SCREEN : COMMENT 3(9) TEXT-999.

    PARAMETERS:
    p_ch2 AS CHECKBOX.
    SELECTION-SCREEN : COMMENT 15(13) TEXT-998.

  SELECTION-SCREEN : END OF LINE.
SELECTION-SCREEN : END OF BLOCK b3.



*push buttons in abap
SELECTION-SCREEN : BEGIN OF BLOCK b4 WITH FRAME TITLE TEXT-004.
  SELECTION-SCREEN : PUSHBUTTON 3(9) P_btn1 USER-COMMAND Ritesh_metange .
  SELECTION-SCREEN : PUSHBUTTON 15(9) P_btn2 USER-COMMAND kahi_pan_tak .
SELECTION-SCREEN : END OF BLOCK b4.

INITIALIZATION.
  p_btn1 = 'hit enter'.
  p_btn2 = 'cancle'.


  SELECTION-SCREEN : BEGIN OF BLOCK b99 WITH FRAME TITLE TEXT-333.
    "passing direct table field of matnar

    SELECT-OPTIONS : s_ritesh FOR makt-matnr OBLIGATORY.

  SELECTION-SCREEN : END OF BLOCK b99.
