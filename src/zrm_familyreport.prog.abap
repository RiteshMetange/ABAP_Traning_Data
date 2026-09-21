*&---------------------------------------------------------------------*
*& Report ZRM_FAMILYREPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_familyreport.

* This is structure ZRM family you can define any DDIC object
TYPES: BEGIN OF zrm_family_str,
         id         TYPE zrm_id,
         First_NAME TYPE zrm_name,
         last_name  TYPE zrm_name,
         age        TYPE zrm_age,
       END OF zrm_family_str.


DATA : int_family TYPE STANDARD TABLE OF zrm_family_str,
             Warea      TYPE zrm_family_str.

Warea-id = '1'.
Warea-first_name = 'Ritesh'.
Warea-last_name = 'Metange'.
Warea-age =  '20.1'.
APPEND warea TO int_family.
CLEAR warea.


Warea-id = '2'.
Warea-first_name = 'Sunil'.
Warea-last_name = 'Metange'.
Warea-age =  '55.7'.
APPEND warea TO int_family.
CLEAR warea.


WRITE:     /6 'ID',sy-vline ,
           18 'first name',sy-vline,
           39 'last name',sy-vline,
           56 'age',sy-vline.
ULINE.

LOOP AT int_family INTO warea.
  WRITE:    warea-id,         9 sy-vline,
         10 warea-first_name, 29 sy-vline,
         30 warea-last_name,  49 sy-vline,
         50 warea-age,        60 sy-vline.
  ULINE.
ENDLOOP.
