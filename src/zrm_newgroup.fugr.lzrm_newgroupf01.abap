*----------------------------------------------------------------------*
***INCLUDE LZRM_NEWGROUPF01.
*----------------------------------------------------------------------*

FORM new_entry.
  " Ensure you check the table work area fields
  IF zrm_t2_friends-id = 5.
    MESSAGE 'This is the 5th entry' TYPE 'I'.
  ENDIF.
ENDFORM.
