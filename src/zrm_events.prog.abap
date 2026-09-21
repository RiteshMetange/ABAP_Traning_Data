*&---------------------------------------------------------------------*
*& Report ZRM_EVENTS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_events.

*data declaration part
TYPES: BEGIN OF orderheader ,
         ono   TYPE zrm_orderno,
         odate TYPE zrm_date,
         pm    TYPE zrm_payment,
         curr  TYPE zrmcur,
       END OF orderheader.

DATA: int_table TYPE TABLE OF orderheader,
      warea     TYPE orderheader.

* variables for select-options.
DATA: lv_date TYPE zrm_date,
      lv_pm   TYPE ZRM_payment,
      lv_curr TYPE  zrmcur.

SELECTION-SCREEN: BEGIN OF BLOCK b1 WITH FRAME.
  "select options
  SELECT-OPTIONS: s_date  FOR lv_date NO-EXTENSION ," default sy-datum to sy-datum ,
                  s_pm    FOR lv_pm  NO INTERVALS,
                  s_curr  FOR lv_curr  NO INTERVALS.

SELECTION-SCREEN : END OF BLOCK b1.


*data declaration done


*initialization part
INITIALIZATION.
  s_date-sign = 'I'.
  s_date-option = 'BT'.
  s_date-low = sy-datum - 100.
  s_date-high = sy-datum.
  APPEND s_date.

AT SELECTION-SCREEN OUTPUT.
  IF s_pm-low IS NOT INITIAL.
    IF S_pm-low <> 'C' AND s_pm-low <> 'D' AND s_pm-low <> 'N'.
      MESSAGE 'invalid value' TYPE 'W'.
    ENDIF.
  ENDIF.





START-OF-SELECTION.
*  SELECT ono , odate , payment ,curr
*    FROM zriteshorders
*    WHERE odate IN @s_date AND
*          payment IN @s_pm AND
*          curr IN @s_curr
*    into table @int_table.

  "  another way to select command

  SELECT FROM zriteshorders
    FIELDS ono , odate , payment , curr
    WHERE odate IN @s_date AND payment IN @s_pm AND curr IN @s_curr
    INTO TABLE @int_table.


  "WRITE : / 'order number','order date','payment','currency'.
  if int_table is not INITIAL.
  LOOP AT int_table INTO warea.
    WRITE: / warea-ono UNDER TEXT-001, warea-odate UNDER TEXT-002, warea-pm UNDER TEXT-003,warea-curr UNDER TEXT-004.
  ENDLOOP.
  else.
    MESSAGE 'not found' type 'I'.

    endif.

END-OF-SELECTION.

*end of main logic





TOP-OF-PAGE.
  WRITE:/ TEXT-000 , sy-pagno.
  SKIP.
  WRITE:/3
     TEXT-001 ,sy-vline,
  25 TEXT-002 ,sy-vline,
  38 TEXT-003 , sy-vline,
  49 TEXT-004,sy-vline.
