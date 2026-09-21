*&---------------------------------------------------------------------*
*& Report ZRM_INTERACTIVE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_interactive_alv.

TABLES: vbak, vbap.
"vbak parent  id 1
"vbap child   id 1 ture = show

SELECT-OPTIONS: s_vbak FOR vbak-vbeln.

DATA: it_vbak    TYPE STANDARD TABLE OF vbak,  " parent table
      workarea   LIKE LINE OF it_vbak,

      "field catalog and its workarea
      fcat       TYPE slis_t_fieldcat_alv,
      fwcat      TYPE slis_fieldcat_alv,

      "data for child table
      it_vbap    TYPE STANDARD TABLE OF vbap.


  SELECT vbeln, erdat, erzet, ernam, angdt, bnddt, audat
    FROM vbak
    INTO CORRESPONDING FIELDS OF TABLE @it_vbak
    WHERE vbeln IN @s_vbak.

  "field catalog
  fwcat-col_pos   = 1.
  fwcat-fieldname = 'VBELN'.
  fwcat-seltext_l = 'sale number'.
  fwcat-seltext_s = 'SD number'.
  fwcat-hotspot = 'x'.
  fwcat-emphasize = 'X'.
  APPEND fwcat TO fcat.
  CLEAR fwcat.

  fwcat-col_pos   = 2.
  fwcat-fieldname = 'ERDAT'.
  fwcat-seltext_l = 'date'.
  APPEND fwcat TO fcat.
  CLEAR fwcat.

  fwcat-col_pos   = 3.
  fwcat-fieldname = 'ERZET'.
  fwcat-seltext_l = 'time'.
  APPEND fwcat TO fcat.
  CLEAR fwcat.

  fwcat-col_pos   = 4.
  fwcat-fieldname = 'ERNAM'.
  fwcat-seltext_l = 'name'.
  APPEND fwcat TO fcat.
  CLEAR fwcat.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'   " parent sathi
    EXPORTING
      it_fieldcat             = fcat
      i_callback_program      = sy-repid
      " to get the data from child use this
      i_callback_user_command = 'CHILD_DATA'
    TABLES
      t_outtab                = it_vbak
    EXCEPTIONS
      program_error           = 1
      OTHERS                  = 2.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.





FORM child_data USING    ritesh  LIKE sy-ucomm            " captures whatever user clicked
                         metange TYPE slis_selfield.      " selection field table 3 row = 3

  CASE ritesh.
    WHEN '&IC1'.                                           " when user clicks on first column
      READ TABLE it_vbak INDEX metange-tabindex INTO workarea.
      IF sy-subrc = 0.
        SELECT vbeln, posnr, matnr, charg, matkl, arktx
          FROM vbap
          INTO CORRESPONDING FIELDS OF TABLE @it_vbap
          WHERE vbeln = @workarea-vbeln."parent table vbeln

        CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
          EXPORTING
            i_structure_name = 'VBAP'
            i_callback_program = sy-repid
          TABLES
            t_outtab         = it_vbap
          EXCEPTIONS
            program_error    = 1
            OTHERS           = 2.
        IF sy-subrc <> 0.
* Implement suitable error handling here
        ENDIF.
      ENDIF.
  ENDCASE.

ENDFORM.
