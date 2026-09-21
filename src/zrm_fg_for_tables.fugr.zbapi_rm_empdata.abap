FUNCTION zbapi_rm_empdata.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(PEMPLOYEE) TYPE  ZRM_BAPI_EMPSTRUCT
*"  EXPORTING
*"     VALUE(RETURN) TYPE  BAPIRET1
*"----------------------------------------------------------------------
  TABLES: zrm_bapi_empdata.
  DATA: wa_employee TYPE zrm_bapi_empdata,
        error       TYPE bapiret1.

  wa_employee-eid = pemployee-eid.
  wa_employee-ename = pemployee-ename.
  wa_employee-eage = pemployee-eage.
  INSERT zrm_bapi_empdata FROM wa_employee.

if sy-subrc = 0.
  error-type = 'S'.
  error-id = 'ZRM_MSG'.
  error-number = '005'.
  error-message_v1 = pemployee-eid.
  else.
  error-type = 'E'.
  error-id = 'ZRM_MSG'.
  error-number = '004'.
  error-message_v1 = pemployee-eid.
ENDIF.





ENDFUNCTION.
