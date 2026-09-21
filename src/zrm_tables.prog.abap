*&---------------------------------------------------------------------*
*& Include          ZRM_TABLES
*&---------------------------------------------------------------------*
TABLES: ekpo.

TYPES: BEGIN OF ty_ekpo,
         matnr    TYPE matnr,
         ebeln    TYPE  ebeln,
         ebelp    TYPE  ebelp,
         uniqueid TYPE  purchasingdocumentitemuniqueid,
         loekz    TYPE eloek,
         statu    TYPE   astat,
         aedat    TYPE paedt,
         txz01    TYPE txz01,
         abmng     TYPE noram,
       END OF  ty_ekpo.

DATA: it_ekpo TYPE STANDARD TABLE OF  ty_ekpo,
      wa_ekpo TYPE ty_ekpo.


SELECTION-SCREEN: BEGIN OF BLOCK b1.

  SELECT-OPTIONS : s_ebeln FOR ekpo-ebeln.

SELECTION-SCREEN: END OF BLOCK b1.

AT SELECTION-SCREEN.
  IF s_ebeln IS INITIAL.
    MESSAGE w000(ZRM_msg).
  ENDIF.


START-OF-SELECTION.
  SELECT FROM ekpo FIELDS
    matnr,ebeln,  ebelp   ,uniqueid,loekz  , statu  ,  aedat  , txz01 , abmng
    WHERE ebeln IN @s_ebeln INTO CORRESPONDING FIELDS OF TABLE @it_ekpo.

END-OF-SELECTION.
