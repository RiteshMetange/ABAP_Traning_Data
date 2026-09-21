*&---------------------------------------------------------------------*
*& Report ZRM_PF_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZRM_PF_REPORT.


START-OF-SELECTION.
set PF-STATUS 'RITESH'.  " always in capital letters
write: 'Hello how are you !'.


at USER-COMMAND.
  case sy-ucomm.
    when 'DISPLAY'.
      message S002(Zrm_msg).
      when 'LION'.
        message 'Lion will roar !' type 'E'.
        when 'TIGER'.
          message 'tigr is our national animal !' type 'I'.
          when 'STOCK'.
            message 'stock crashed out !' type 'E'.
            when 'GOBACK'.
              LEAVE PROGRAM.

          ENDCASE.
