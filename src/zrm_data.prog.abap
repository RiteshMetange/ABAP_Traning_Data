*&---------------------------------------------------------------------*
*& Include          ZRM_DATA
*&---------------------------------------------------------------------*
tables: zrm_t1_family.

TYPES : BEGIN OF ty_family,
          id         TYPE  zrm_id,
          first_name TYPE ZRM_name,
          last_name  TYPE ZRM_name,
          age        TYPE ZRM_age,
          income     TYPE p DECIMALS 2,
          spouse_age TYPE ZRM_age,
        END OF ty_family.


        data: int_table type STANDARD TABLE OF ty_family,
              changing type string,
              warea type ty_family.


SELECTION-SCREEN : begin of block b1 with frame TITLE text-000.

  SELECT-OPTIONS :
                    S_id for zrm_t1_family-id.

  PARAMETERS:
                    P_file type localfile.

  SELECTION-SCREEN: end of block b1.
