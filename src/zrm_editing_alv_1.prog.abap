*&---------------------------------------------------------------------*
*& Report ZRM_FIELD_SPECIFIC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_editing_alv_1.

INCLUDE ZRM_Tables2.   " tables data and initialization of variables


PERFORM fetchdata.
PERFORM field_catalouge.
PERFORM print.



FORM edit_value USING click LIKE sy-ucomm
                      select TYPE slis_selfield.
  CASE click.
    WHEN '&DATA_SAVE'.
      READ TABLE it_ekko INTO wa_ekko INDEX select-tabindex.
      MODIFY ekko FROM wa_ekko.

      IF sy-subrc = 0.
        MESSAGE S002(zrm_msg).
      ENDIF.
  ENDCASE.

ENDFORM.




FORM fetchdata .

  SELECT  bukrs,ebeln,bstyp,bsart,bsakz,loekz,statu,aedat,ernam,rlwrt
     FROM ekko INTO CORRESPONDING FIELDS OF TABLE @it_ekko WHERE ebeln IN @s_ebeln.

ENDFORM.

"end

FORM field_catalouge .

  fwcat-col_pos = 1.
  fwcat-fieldname = 'BUKRS'.
  fwcat-seltext_l = 'BUKRS'.
  fwcat-edit = 'X'.
  APPEND fwcat TO fcat.
  CLEAR fwcat.

  fwcat-col_pos = 2.
  fwcat-fieldname = 'EBELN'.
  fwcat-seltext_l = 'Purchasing document'.
  APPEND fwcat TO fcat.
  CLEAR fwcat.

  fwcat-col_pos = 3.
  fwcat-fieldname = 'BSTYP'.
  fwcat-seltext_l = 'company code'.
  fwcat-just = 'L'.
  APPEND fwcat TO fcat.
  CLEAR fwcat.

  fwcat-col_pos = 4.
  fwcat-fieldname = 'RLWRT'.
  fwcat-seltext_l = 'Num'.
  fwcat-do_sum = 'X'.
  APPEND fwcat TO fcat.
  CLEAR fwcat.
ENDFORM.

"end

FORM print .

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
 EXPORTING
   I_CALLBACK_PROGRAM                = sy-repid
   I_CALLBACK_USER_COMMAND           = 'EDIT_VALUE'
   IT_FIELDCAT                       = fcat
  TABLES
    t_outtab                          = it_ekko
 EXCEPTIONS
   PROGRAM_ERROR                     = 1
   OTHERS                            = 2
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.
ENDFORM.
"end
