*&---------------------------------------------------------------------*
*& Include          ZRM_TABLEDECLARATION
**&---------------------------------------------------------------------*
*TYPES : BEGIN OF ty_ekpo,
*          ebeln TYPE ebeln,
*          ebelp TYPE ebelp,
*          loekz TYPE loekz,
*        END OF ty_ekpo.

DATA: it_ekpo TYPE STANDARD TABLE OF ekpo,
      it_fclog type SLIS_T_FIELDCAT_ALV,
      wa_fclog type SLIS_FIELDCAT_ALV.
*FIELD-SYMBOLS : <fsekpo> TYPE ty_ekpo.
