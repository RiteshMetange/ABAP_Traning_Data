*&---------------------------------------------------------------------*
*& Report ZRM_INNER_FORALL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_inner_forall.
TABLES : mara , marc , makt ,ekpo.

INCLUDE zrm_inner_join.




"for all entries
SELECT matnr, mtart, matkl
FROM mara
INTO TABLE @DATA(it_mara).

IF it_mara IS NOT INITIAL.

select matnr, bwtty,xchar,mmsta,mmstd,maabc FROM marc FOR ALL ENTRIES IN @it_mara
WHERE matnr = @it_mara-matnr
INTO TABLE @DATA(it_final).
ENDIF.


LOOP AT it_final ASSIGNING FIELD-SYMBOL(<fs_final>).

  READ TABLE it_mara ASSIGNING FIELD-SYMBOL(<fs_mara>)
                     WITH KEY matnr = <fs_final>-matnr
                     BINARY SEARCH.

  IF sy-subrc = 0.
    " Now you can print/process fields from both tables
    WRITE: / <fs_final>-matnr,
             <fs_mara>-mtart,
             <fs_mara>-matkl,
             <fs_final>-bwtty,
             <fs_final>-mmsta.
  ENDIF.

ENDLOOP.
