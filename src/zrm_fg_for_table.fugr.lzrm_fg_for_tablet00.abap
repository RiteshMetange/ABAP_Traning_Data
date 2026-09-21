*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZRMDUMMYMAINT...................................*
TABLES: ZRMDUMMYMAINT, *ZRMDUMMYMAINT. "view work areas
CONTROLS: TCTRL_ZRMDUMMYMAINT
TYPE TABLEVIEW USING SCREEN '0001'.
DATA: BEGIN OF STATUS_ZRMDUMMYMAINT. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZRMDUMMYMAINT.
* Table for entries selected to show on screen
DATA: BEGIN OF ZRMDUMMYMAINT_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZRMDUMMYMAINT.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZRMDUMMYMAINT_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZRMDUMMYMAINT_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZRMDUMMYMAINT.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZRMDUMMYMAINT_TOTAL.

*...processing: ZRM_ORDERHEADER.................................*
DATA:  BEGIN OF STATUS_ZRM_ORDERHEADER               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZRM_ORDERHEADER               .
CONTROLS: TCTRL_ZRM_ORDERHEADER
            TYPE TABLEVIEW USING SCREEN '0005'.
*...processing: ZRM_T4_ANIME....................................*
DATA:  BEGIN OF STATUS_ZRM_T4_ANIME                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZRM_T4_ANIME                  .
CONTROLS: TCTRL_ZRM_T4_ANIME
            TYPE TABLEVIEW USING SCREEN '0007'.
*.........table declarations:.................................*
TABLES: *ZRM_ORDERHEADER               .
TABLES: *ZRM_T4_ANIME                  .
TABLES: ZRM_ORDERHEADER                .
TABLES: ZRM_PEOPLEINT                  .
TABLES: ZRM_PERSON                     .
TABLES: ZRM_T4_ANIME                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
