*&---------------------------------------------------------------------*
*& Report ZRMPRACTICEREPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_tbl_oprations.


*we will be using a table instead of structure
* you dont need to write code for table type structure you can direclty use table contents

TYPES: BEGIN OF ZRM_t1_family,
         id         TYPE ZRM_id,
         relation   TYPE c LENGTH 20,
         first_name TYPE zrm_name,
         last_name  TYPE zrm_name,
         age        TYPE zrm_age,
         spouse_age TYPE zrm_age,
       END OF zrm_t1_family.


*       internal table and workarea this is variable
*  this is table not structure you can directly do this without defining structure
DATA: int_tbl TYPE TABLE OF zrm_t1_family,
      warea   TYPE zrm_t1_family.

warea-id = 1.
warea-first_name = 'Ritesh'.
warea-last_name  = 'Metange'.
warea-age        = 20.
warea-relation   = 'son of sunil'.
warea-spouse_age = 19.
APPEND warea TO int_tbl.
CLEAR: warea.

warea-id = 2.
warea-first_name    = 'Sunil'.
warea-last_name     = 'Metange'.
warea-relation      = 'father of ritesh'.
warea-age           = 56.
warea-spouse_age    = 49.
APPEND warea TO int_tbl.
CLEAR: warea.

warea-id = 3.
warea-first_name = 'Anita'.
warea-last_name = 'Metange'.
warea-relation = 'mother of ritesh'.
warea-age = 49.
INSERT  warea INTO int_tbl INDEX 1.
CLEAR: warea.

WRITE :/3 'id'            ,sy-vline,
          15'name'        ,sy-vline,
          30'last-name'   ,sy-vline,
          50'age'         ,sy-vline,
          58'spouse age'  ,sy-vline,
          80'relationship',sy-vline.
ULINE /(93).





LOOP AT int_tbl INTO warea.
  WRITE: /2 warea-id          ,sy-vline,
          9 warea-first_name  ,sy-vline,
          29 warea-last_name  ,sy-vline,
          49 warea-age        ,sy-vline,
          64 warea-spouse_age ,sy-vline,
          72 warea-relation   ,sy-vline.

ENDLOOP.
ULINE /(93).
