*&---------------------------------------------------------------------*
*& Report ZRM_ALV_EVENTS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_interactive_classic NO STANDARD PAGE HEADING.
TABLES: vbak , vbap.

DATA: it_vbak  TYPE TABLE OF vbak,
      wa_vbak  TYPE vbak,


      lv_matnr TYPE matnr,
      lv_posnr TYPE posnr_va,
      lv_PMATN TYPE pmatn.


START-OF-SELECTION.
  SELECT vbeln,erdat FROM vbak INTO CORRESPONDING FIELDS OF TABLE @it_vbak UP TO 50 ROWS.

  LOOP AT it_vbak INTO wa_vbak.

    WRITE:/ wa_vbak-vbeln UNDER TEXT-000 , sy-vline,
            wa_vbak-erdat UNDER TEXT-001.
    HIDE  wa_vbak-vbeln.

  ENDLOOP.


AT LINE-SELECTION.
  " at line selection for table vbak
  IF sy-lsind = 1 AND wa_vbak-vbeln IS NOT INITIAL.
    WRITE : /'VBAP item deatils :' , wa_vbak-vbeln COLOR COL_HEADING.

    " nnow data fetching for vbap just like interactive report

    SELECT  matnr ,posnr
    FROM vbap INTO (@lv_matnr , @lv_posnr) WHERE vbeln = @wa_vbak-vbeln.
    ENDSELECT.

    ULINE.
    WRITE :
           /'Item Number : ' ,lv_posnr ,
           / 'Material', lv_matnr.

    CLEAR: wa_vbak-vbeln.

  ENDIF.




AT LINE-SELECTION.
  IF sy-lsind = 2 AND lv_matnr IS NOT INITIAL.
    WRITE : / 'Material details for mara : ' ,lv_matnr COLOR COL_HEADING.

    SELECT FROM mara
       FIELDS matnr, matkl,mtart
       WHERE matnr = @lv_matnr
       INTO (@lv_matnr, @DATA(lv_matkl), @DATA(lv_mtart)).

      ULINE.
      WRITE: / 'Material number :',lv_matnr,
             / 'Material group : ', lv_matkl,
             / 'Material type : ',lv_mtart.

      CLEAR:
       lv_matnr, lv_matkl, lv_mtart.
    ENDSELECT.

  ENDIF.




TOP-OF-PAGE.
  WRITE: TEXT-000  ,15 TEXT-001.

END-OF-PAGE.
