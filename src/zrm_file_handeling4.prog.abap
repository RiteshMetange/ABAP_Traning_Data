*&---------------------------------------------------------------------*
*& Report ZRM_FILE_HANDELING4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_file_handeling4.

INCLUDE ZRM_data99.


DATA(filepath) =  '/tmp/order.txt'.
DATA : lv_string type string.



*input if for reading and output is for writing


OPEN DATASET filepath FOR INPUT IN TEXT MODE ENCODING UTF-8.
IF sy-subrc = 0.

  DO.
    READ DATASET filepath INTO lv_string.
    IF sy-subrc = 0.
      SPLIT lv_string AT '~' INTO DATA(lv_id)
                                  DATA(lv_first)
                                  DATA(lv_last)
                                  DATA(lv_age_str)
                                  DATA(lv_income_str)
                                  DATA(lv_spouse_str).
* casting
      warea-id         = lv_id.
      warea-first_name = lv_first.
      warea-last_name  = lv_last.
      warea-age        = lv_age_str.
      warea-income     = lv_income_str.
      warea-spouse_age = lv_spouse_str.

      APPEND warea TO int_table.
      CLEAR : warea.

    ELSE.
      EXIT.
    ENDIF.

  ENDDO.
ENDIF.


PERFORM print.

FORM print .
CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
  EXPORTING
    i_program_name         = sy-repid
    i_structure_name       = 'ZRM_FAMILY_STR2'
  CHANGING
    ct_fieldcat            = fcat
  EXCEPTIONS
    inconsistent_interface = 1
    program_error          = 2
    OTHERS                 = 3.
IF sy-subrc = 0.
  message S002(ZRM_msg). " opration success !~!
ENDIF.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    i_callback_program = 'ZRM_FILE_HANDELING4'
    it_fieldcat        = fcat
  TABLES
    t_outtab           = int_table
  EXCEPTIONS
    program_error      = 1
    OTHERS             = 2.
IF sy-subrc = 0.
  message S002(ZRM_msg). " opration success !~!
ENDIF.
ENDFORM.
