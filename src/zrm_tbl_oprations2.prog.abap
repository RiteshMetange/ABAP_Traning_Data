*&---------------------------------------------------------------------*
*& Report ZRM_TBL_OPRATIONS2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_tbl_oprations2.

* append
* insert
* read
* sort
* delete
* loop
* modify
* clear
*


*defining the data.
TYPES: BEGIN OF family_table,

         id         TYPE i,
         first_name TYPE c LENGTH 20,
         last_name  TYPE c LENGTH 20,
         age        TYPE p LENGTH 3,
         address    TYPE string,
         mobile     TYPE p LENGTH 10,
         relation   TYPE c LENGTH 20,
       END OF family_table.


*defining the internal table her
DATA: int_table TYPE STANDARD TABLE OF family_table,
      warea     TYPE family_table.

warea-id = 1.
warea-first_name = 'Ritesh'.
warea-last_name  =  'metange'.
warea-age = 20.
warea-address = 'Bhosari'.
warea-mobile = 8668313751.
warea-relation = 'son'.

*appending to internal table
APPEND warea TO int_table.
CLEAR : warea.

warea-id = 2.
warea-first_name = 'Sunil'.
warea-last_name  =  'metange'.
warea-age = 56.
warea-address = 'Bhosari'.
warea-mobile = 9921980050.
warea-relation = 'father'.

*appending
APPEND warea TO int_table.
CLEAR:warea.

*inserting record to table
warea-id = 3.
warea-first_name = 'Anita'.
warea-last_name  =  'metange'.
warea-age = 40.
warea-address = 'Bhosari'.
warea-mobile = 9545741571.
warea-relation = 'mother'.

INSERT warea INTO int_table INDEX 1.
CLEAR warea.

warea-id = 4.
warea-first_name = 'Pranay'.
warea-last_name  =  'mankar'.
warea-age = 22.
warea-address = 'jaulka railway washim'.
warea-mobile = 947007400.
warea-relation = 'Brother'.

INSERT warea INTO int_table INDEX 4.
CLEAR warea.





* reading the single record from the table
warea-id = 5.
warea-first_name = 'vaishnavi'.
warea-last_name  =  'mankar'.
warea-age = 30.
warea-address = 'warje pune'.
warea-mobile = 9307778965.
warea-relation = 'sister'.
APPEND warea TO int_table.
CLEAR warea.

READ TABLE int_table INTO warea INDEX 1.
IF sy-subrc IS INITIAL.
  WRITE: / 'reading the record at index 1 ',warea-first_name,warea-last_name.
ELSE.
  WRITE :'error is there'.
ENDIF.
CLEAR warea.


READ TABLE int_table INTO warea WITH KEY id = 2.
DATA(agecheck) = COND string( WHEN warea-age > 30 THEN 'age is greater than 30 ' ELSE 'age is less than 30').
WRITE : / 'reading the age which is >30 : ',agecheck.
CLEAR warea.
ULINE.

LOOP AT int_table INTO warea.
  IF warea-age GT 25.
    WRITE: / 'person,s age is ',warea-first_name , warea-age.
  ELSE.
    WRITE: / 'smaller than 25 not allowed'.
    ENDIF.
ENDLOOP.


* sorting the table
*   SORT int_table ASCENDING BY age.
*   SORT int_table DESCENDING by name.
*   sort int_table by age.




*modifying the records
  LOOP AT int_table INTO warea.
    IF warea-mobile = 8668313751.
      warea-mobile = 999999999999.
    ENDIF.
    MODIFY int_table FROM warea TRANSPORTING mobile.
    CLEAR warea.

  ENDLOOP.











  ULINE.
*data printing
 LOOP AT int_table INTO warea.
    WRITE :/
    warea-id,
    warea-first_name ,
    warea-last_name,
    warea-age ,
    warea-address,
    warea-mobile ,
    warea-relation .

 ENDLOOP.

  ULINE.

*LOOP AT int_table INTO  warea.
*  IF warea-age BETWEEN 20 AND 30.
*    WRITE: / warea-first_name ,' age is ' , warea-age.
*  ELSE.
*    WRITE: / 'no one is less than 10'.
*  ENDIF.
*ENDLOOP.
