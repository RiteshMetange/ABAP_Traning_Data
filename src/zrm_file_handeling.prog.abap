*&---------------------------------------------------------------------*
*& Report ZRM_FILE_HANDELING
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_file_handeling.

* reading the data from file from non sap to sap reading using gui upload



TYPES : BEGIN OF user_data,
          eid       TYPE i,
          ename(50) TYPE  c,
        END OF user_data.

DATA: int_table TYPE TABLE OF user_data,
      workarea  TYPE user_data,
      lv_file   TYPE string.

PARAMETERS : P_file TYPE localfile.




AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.
  " for help to select from your desktop (search help)
  CALL FUNCTION 'F4_FILENAME'
    EXPORTING
      program_name  = syst-cprog
      dynpro_number = syst-dynnr
      field_name    = ' '
    IMPORTING
      file_name     = P_file.

  "logic part is imp

START-OF-SELECTION.
  lv_file = p_file.

  "now file reading part
  CALL FUNCTION 'GUI_UPLOAD'
    EXPORTING
      filename                = lv_file
      filetype                = 'DAT'
      has_field_separator     = 'X'
    TABLES
      data_tab                = int_table
    EXCEPTIONS
      file_open_error         = 1
      file_read_error         = 2
      no_batch                = 3
      gui_refuse_filetransfer = 4
      invalid_type            = 5
      no_authority            = 6
      unknown_error           = 7
      bad_data_format         = 8
      header_not_allowed      = 9
      separator_not_allowed   = 10
      header_too_long         = 11
      unknown_dp_error        = 12
      access_denied           = 13
      dp_out_of_memory        = 14
      disk_full               = 15
      dp_timeout              = 16
      OTHERS                  = 17.
  IF sy-subrc <> 0.

  ENDIF.
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program = sy-repid
      i_structure_name   = 'user_data'
    TABLES
      t_outtab           = int_table
    exceptions
      program_error      = 1
      OTHERS             = 2.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
