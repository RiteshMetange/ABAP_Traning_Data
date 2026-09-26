*&---------------------------------------------------------------------*
*& Report ZRM_NEW_SYNTAX
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZRM_NEW_SYNTAX.

START-OF-SELECTION.
  " 1. Inline declaration of the internal table directly from the SELECT
  SELECT * FROM zrm_t1_family INTO TABLE @DATA(it_family).

  " 2. Inline declaration of the work area inside the LOOP
  LOOP AT it_family INTO DATA(wa_family).

    " 3. Format the ID directly in the WRITE statement using a string template
    WRITE : / |{ wa_family-id ALPHA = out }| , wa_family-first_name.

  ENDLOOP.
