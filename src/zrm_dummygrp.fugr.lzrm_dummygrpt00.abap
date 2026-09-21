*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZRM_MAINTVW.....................................*
TABLES: ZRM_MAINTVW, *ZRM_MAINTVW. "view work areas
CONTROLS: TCTRL_ZRM_MAINTVW
TYPE TABLEVIEW USING SCREEN '0007'.
DATA: BEGIN OF STATUS_ZRM_MAINTVW. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZRM_MAINTVW.
* Table for entries selected to show on screen
DATA: BEGIN OF ZRM_MAINTVW_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZRM_MAINTVW.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZRM_MAINTVW_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZRM_MAINTVW_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZRM_MAINTVW.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZRM_MAINTVW_TOTAL.

*.........table declarations:.................................*
TABLES: ZRM_ITEMTABLE                  .
TABLES: ZRM_ORDERHEADER                .
