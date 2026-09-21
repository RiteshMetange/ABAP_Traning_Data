*&---------------------------------------------------------------------*
*& Report ZRM_FILE_HANDELING3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_file_handeling3.

INCLUDE ZRM_data2.

DATA(filepath) = '/tmp/order.txt'.

"sql query
SELECT id , first_name , last_name , age , income , spouse_age
  FROM zrm_t1_family WHERE id IN @s_id INTO CORRESPONDING FIELDS OF TABLE @int_table.


*    using application server.
OPEN DATASET filepath FOR OUTPUT IN TEXT MODE ENCODING DEFAULT.
IF sy-subrc = 0 .
  LOOP AT int_table INTO warea.
     data(lv_string) = |{ warea-id }~{ warea-first_name }~{ warea-last_name }~{ warea-age }~{ warea-income }~{ warea-spouse_age }|.
    TRANSFER lv_string TO filepath.
  ENDLOOP.
  CLOSE DATASET filepath.
  MESSAGE s002(Zrm_msg).
ENDIF.
