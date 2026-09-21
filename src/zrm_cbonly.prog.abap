*&---------------------------------------------------------------------*
*& Report ZRM_CBONLY
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_cbonly.
TABLES:ekpo.

*demonstration of control break statements

SELECTION-SCREEN : BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-000.
  SELECT-OPTIONS: s_pdoc FOR ekpo-ebeln.
SELECTION-SCREEN : END OF BLOCK b1.
*
DATA: netvalue1  TYPE ekpo-netwr.
*      netvalue2 TYPE ekpo-netpr.

TYPES: BEGIN OF ty_ekpo,
         ebeln TYPE ekpo-ebeln,
         ebelp TYPE ekpo-ebelp,
         menge TYPE ekpo-menge,
         meins TYPE ekpo-meins,
         netwr TYPE ekpo-netwr,
       END OF ty_ekpo.

DATA: it_table TYPE TABLE OF ty_ekpo,
      workarea TYPE ty_ekpo.


START-OF-SELECTION.
  IF s_pdoc-low IS NOT INITIAL.
    SELECT FROM ekpo
      FIELDS ebeln , ebelp , menge ,  meins , netwr
      WHERE ebeln IN @S_pdoc
      INTO CORRESPONDING FIELDS OF TABLE @it_table.
  ELSE.
    MESSAGE 'enter the value in field' TYPE 'E'.
  ENDIF.

END-OF-SELECTION.

  LOOP AT it_table INTO workarea.

    AT FIRST.
      WRITE : / 'Purchasing deatils'.
      WRITE : / workarea-ebeln , workarea-ebelp.
    ENDAT.


    AT NEW  menge.
      WRITE:/ 'new amount', workarea-menge.
    ENDAT.


    netvalue1 = workarea-netwr.
    AT END OF menge.
      WRITE : 'grand total ',netvalue1.

    ENDAT.

    at last.
      write:/ 'end of report'.
      endat.

  ENDLOOP.
