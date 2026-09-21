*&---------------------------------------------------------------------*
*& Report ZRM_SCREEN_FOR_PO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_screen_for_gnp_po.



"first block
SELECTION-SCREEN: BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-000.

  PARAMETERS:
    P_rb1 TYPE c RADIOBUTTON GROUP one DEFAULT 'X',
    P_rb2 TYPE c RADIOBUTTON GROUP one.

SELECTION-SCREEN: END OF BLOCK b1.
SKIP.



"second block for file input
SELECTION-SCREEN: BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-001.

  SELECTION-SCREEN:PUSHBUTTON 3(25) p_btn1 USER-COMMAND btnclick.

  PARAMETERS:
    P_rb3 TYPE c RADIOBUTTON GROUP two DEFAULT 'X',
    P_rb4 TYPE c RADIOBUTTON GROUP two.

SELECTION-SCREEN: END OF BLOCK b2.

INITIALIZATION.
  p_btn1 = 'Download File Template'.
  SKIP.



  "third block for file  upload
 SELECTION-SCREEN: BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-002.

    "file upload logic
 SELECTION-SCREEN: END OF BLOCK b3.
 SKIP.



  "fourth block for purchase orders
SELECTION-SCREEN: BEGIN OF BLOCK b4 WITH FRAME TITLE TEXT-003.

    PARAMETERS:
      P_rb5 RADIOBUTTON GROUP thre DEFAULT 'X',
      P_rb6 RADIOBUTTON GROUP thre.


    " insider block for grouping criteria
    SELECTION-SCREEN: BEGIN OF BLOCK b5 WITH FRAME TITLE TEXT-004.
      PARAMETERS:
        P_ch1 AS CHECKBOX,
        P_ch2 AS CHECKBOX,
        P_ch3 AS CHECKBOX,
        P_ch4 AS CHECKBOX,
        P_ch5 AS CHECKBOX,
        P_ch6 AS CHECKBOX.

    SELECTION-SCREEN:END OF BLOCK b5.
SELECTION-SCREEN: END OF BLOCK b4.
