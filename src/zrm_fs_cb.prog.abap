*&---------------------------------------------------------------------*
*& Report ZRM_FS_CB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_fs_cb.


DATA:  lv_matnr TYPE matnr.                    " using inside  internal table
SELECT-OPTIONS: s_matnr FOR lv_matnr.


START-OF-SELECTION.

 select from mara
   FIELDS matnr  , mtart , adspc_spc
   where matnr in @s_matnr
   into table @data(it_table11).
 end-of-SELECTION.

loop at it_table11 ASSIGNING FIELD-SYMBOL(<fs>).
  write :  / <fs>-matnr.
 endloop.
 UNASSIGN <fs>.





*  field symbols
FIELD-SYMBOLS: <fs22> TYPE char20.
DATA: change_name TYPE char20 VALUE 'Ritesh'.

ASSIGN change_name TO <fs22>.
<fs22> = 'metange'.
WRITE: / 'current value to field symbol :',<fs22>.
UNASSIGN <fs22>.




SELECT netwr FROM ZBS_mara
  INTO TABLE @DATA(new_inttable).


LOOP AT new_inttable INTO DATA(workarea).
  workarea-netwr  = workarea-netwr + 10.
  MODIFY new_inttable FROM workarea.
  WRITE:/ 'modifying value by old way : ' ,workarea-netwr.
ENDLOOP.

uline.
WRITE:/ 'this will assign memory only when needed'.
LOOP AT new_inttable ASSIGNING FIELD-SYMBOL(<fsint>).
  <fsint>-netwr = <fsint>-netwr + 100.
  WRITE:/ 'modifying value field symbol: ' ,<fsint>-netwr.
ENDLOOP.
UNASSIGN <fsint>.
