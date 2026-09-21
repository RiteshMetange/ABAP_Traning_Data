*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZORVENDOR.......................................*
DATA:  BEGIN OF STATUS_ZORVENDOR                     .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZORVENDOR                     .
CONTROLS: TCTRL_ZORVENDOR
            TYPE TABLEVIEW USING SCREEN '0006'.
*...processing: ZPROJ26_VW......................................*
TABLES: ZPROJ26_VW, *ZPROJ26_VW. "view work areas
CONTROLS: TCTRL_ZPROJ26_VW
TYPE TABLEVIEW USING SCREEN '0003'.
DATA: BEGIN OF STATUS_ZPROJ26_VW. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZPROJ26_VW.
* Table for entries selected to show on screen
DATA: BEGIN OF ZPROJ26_VW_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZPROJ26_VW.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZPROJ26_VW_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZPROJ26_VW_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZPROJ26_VW.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZPROJ26_VW_TOTAL.

*...processing: ZRMORSTAT.......................................*
DATA:  BEGIN OF STATUS_ZRMORSTAT                     .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZRMORSTAT                     .
CONTROLS: TCTRL_ZRMORSTAT
            TYPE TABLEVIEW USING SCREEN '0005'.
*...processing: ZRM_DUMVW.......................................*
TABLES: ZRM_DUMVW, *ZRM_DUMVW. "view work areas
CONTROLS: TCTRL_ZRM_DUMVW
TYPE TABLEVIEW USING SCREEN '0001'.
DATA: BEGIN OF STATUS_ZRM_DUMVW. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZRM_DUMVW.
* Table for entries selected to show on screen
DATA: BEGIN OF ZRM_DUMVW_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZRM_DUMVW.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZRM_DUMVW_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZRM_DUMVW_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZRM_DUMVW.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZRM_DUMVW_TOTAL.

*...processing: ZRM_PEOPLEMAINVW................................*
TABLES: ZRM_PEOPLEMAINVW, *ZRM_PEOPLEMAINVW. "view work areas
CONTROLS: TCTRL_ZRM_PEOPLEMAINVW
TYPE TABLEVIEW USING SCREEN '0004'.
DATA: BEGIN OF STATUS_ZRM_PEOPLEMAINVW. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZRM_PEOPLEMAINVW.
* Table for entries selected to show on screen
DATA: BEGIN OF ZRM_PEOPLEMAINVW_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZRM_PEOPLEMAINVW.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZRM_PEOPLEMAINVW_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZRM_PEOPLEMAINVW_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZRM_PEOPLEMAINVW.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZRM_PEOPLEMAINVW_TOTAL.

*...processing: ZRM_T2_FRIENDS..................................*
DATA:  BEGIN OF STATUS_ZRM_T2_FRIENDS                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZRM_T2_FRIENDS                .
CONTROLS: TCTRL_ZRM_T2_FRIENDS
            TYPE TABLEVIEW USING SCREEN '0007'.
*.........table declarations:.................................*
TABLES: *ZORVENDOR                     .
TABLES: *ZRMORSTAT                     .
TABLES: *ZRM_T2_FRIENDS                .
TABLES: ZORVENDOR                      .
TABLES: ZPD2                           .
TABLES: ZRMORSTAT                      .
TABLES: ZRM_D1                         .
TABLES: ZRM_D2                         .
TABLES: ZRM_INTMASTER                  .
TABLES: ZRM_PEOPLEINT                  .
TABLES: ZRM_PERSON                     .
TABLES: ZRM_T2_FRIENDS                 .
TABLES: ZTRPROJECT26                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
