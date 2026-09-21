*&---------------------------------------------------------------------*
*& Include          ZRM_DATA99
*&---------------------------------------------------------------------*


TYPES : BEGIN OF ty_family,
          id         TYPE  zrm_id,
          first_name TYPE ZRM_name,
          last_name  TYPE ZRM_name,
          age        TYPE ZRM_age,
          income     TYPE p DECIMALS 2,
          spouse_age TYPE ZRM_age,
        END OF ty_family.


DATA: int_table TYPE STANDARD TABLE OF ty_family,
      warea     TYPE ty_family,
      fcat      TYPE slis_T_fieldcat_alv.
