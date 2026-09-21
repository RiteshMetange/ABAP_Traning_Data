*&---------------------------------------------------------------------*
*& Report ZRM_TOP_OF_PAGE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_top_of_page.

INCLUDE zrm_tables.
PERFORM print .

FORM ALV_TOP_OF_PAGE.
  DATA: int_header TYPE slis_t_listheader,
        wa_header  TYPE slis_listheader.

*H , S , A
  wa_header-typ = 'H'.
  wa_header-info = 'Ritesh sunil Metange'.
  APPEND wa_header TO int_header.
  CLEAR wa_header.

  wa_header-typ = 'S'.
  wa_header-key = 'DATE: '.
  wa_header-info = sy-datum.
  APPEND wa_header TO int_header.
  CLEAR wa_header.

  wa_header-typ = 'A'.
  wa_header-info = 'confidential - SAP table'.
  APPEND wa_header TO int_header.
  CLEAR wa_header.

CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
  EXPORTING
    it_list_commentary       =  int_header
   I_LOGO                   =   'ENJOYSAP_LOGO'
*   I_END_OF_LIST_GRID       =
*   I_ALV_FORM               =
          .


ENDFORM.
*&---------------------------------------------------------------------*
*& Form print
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM print .
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program                = sy-repid
*     I_CALLBACK_PF_STATUS_SET          = ' '
*     I_CALLBACK_USER_COMMAND           = ' '
      i_callback_top_of_page            = 'ALV_TOP_OF_PAGE'
      i_structure_name                  = 'ZRM_EKPOSTRUCT'

    TABLES
      t_outtab               = it_ekpo
    EXCEPTIONS
      program_error          = 1
      OTHERS                 = 2.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
ENDFORM.
