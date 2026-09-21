*&---------------------------------------------------------------------*
*& Report ZRM_LOOPS_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_loops_report.


PARAMETERS: num1 TYPE i,
            star TYPE i.

DATA: result TYPE i,
      count  TYPE i.





DO 10 TIMES.
  result =  num1 * sy-index.
  WRITE:/ num1,'*',sy-index,sy-vline,result.
ENDDO.
ULINE.

DO 10 TIMES.
  count = count + 1.
  IF count GT 5.
    EXIT.
  ENDIF.
  WRITE: count.
ENDDO.

ULINE.

DO star TIMES.
  DO sy-index TIMES.
    WRITE '*'.
  ENDDO.
  write:/.
ENDDO.
