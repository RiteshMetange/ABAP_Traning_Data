*&---------------------------------------------------------------------*
*& Include          ZRM_INNER_JOIN
*&---------------------------------------------------------------------*


*inner join for 2 tables

select  ernam , laeda , aenam , vpsta ,spras , maktx , maktg
  from mara as ma
  join makt as mt
  on ma~matnr = mt~matnr
  into table @data(int_table1).

*inner join for 3 tables

select ma~matnr, mt~spras , mt~maktx , mc~MAABC , mc~mmstd , ma~ernam
 from mara as ma
  join makt as mt
  on ma~matnr = mt~matnr
  join marc as mc
  on mt~matnr = mc~matnr
  into table @data(int_table2).
*
*
*loop at int_table2 ASSIGNING FIELD-SYMBOL(<fs>).
*  write: / <fs>-ernam , <fs>-laeda , <fs>-aenam , <fs>-vpsta ,<fs>-spras , <fs>-maktx , <fs>-maktg.
*    write: / <fs>-ernam  , <fs>-maktx , <fs>-maabc ,<fs>-mmstd.
*  ENDLOOP.
