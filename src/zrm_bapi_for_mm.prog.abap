*&---------------------------------------------------------------------*
*& Report ZRM_BAPI_FOR_MM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_bapi_for_mm.


" FM / BAPI/ RFC            |            report  mhdhe
*  importing paras          ->  exporting hotil  (input values)  num1 , num2
*  exporting/changing paras -> (display)      return



DATA: wa_header     TYPE bapimathead,
      wa_client     TYPE bapi_mara,
      wa_clientx    TYPE bapi_marax,

      wa_plantdata  TYPE bapi_marc,
      wa_plantdatax TYPE bapi_marcx,

      " return parameter
      error_handle  TYPE bapiret2,

      "tables
      it_matdes     TYPE TABLE OF bapi_makt,
      wa_matdes     TYPE bapi_makt.



"for header data
wa_header-basic_view = 'X'.
wa_header-material = 'Ritesh Material'.
wa_header-material_long = 'RiteshMat1'.                   " serching in mm01 name of or mara (matnr)
wa_header-ind_sector = 'C'.
wa_header-matl_type = 'ROH'.
" not require to append the data into workarea
" it is a part of workarea itself


"for clientdata ; no append - : same for this also
wa_client-base_uom = 'EA'.
wa_client-matl_group = '7777'.
wa_client-division = '51'.

" for clientdata X ; its chaning parameter to tell sap system what i am chaning in clientdata
wa_clientx-base_uom = 'X'.
wa_clientx-matl_group = 'X'.
wa_clientx-division = 'X'.


wa_plantdata-plant = '1011'.
wa_plantdatax-plant = '1011'.


"for table material description.
wa_matdes-langu = 'E'.
wa_matdes-matl_desc = 'RM-M1'.
APPEND wa_matdes TO it_matdes.
CLEAR wa_matdes.







CALL FUNCTION 'BAPI_MATERIAL_SAVEDATA'
  EXPORTING
    headdata            = wa_header
    clientdata          = wa_client
    clientdatax         = wa_clientx
    plantdata           = wa_plantdata
    plantdatax          = wa_plantdatax
  IMPORTING
    return              = error_handle
  TABLES
    materialdescription = it_matdes
*   UNITSOFMEASURE      =
*   UNITSOFMEASUREX     =
*   INTERNATIONALARTNOS =
*   MATERIALLONGTEXT    =
*   TAXCLASSIFICATIONS  =
*   RETURNMESSAGES      =
*   PRTDATA             =
*   PRTDATAX            =
*   EXTENSIONIN         =
*   EXTENSIONINX        =
*   UNITSOFMEASURECWM   =
*   UNITSOFMEASURECWMX  =
*   SEGMRPGENERALDATA   =
*   SEGMRPGENERALDATAX  =
*   SEGMRPQUANTITYDATA  =
*   SEGMRPQUANTITYDATAX =
*   SEGVALUATIONTYPE    =
*   SEGVALUATIONTYPEX   =
*   SEGSALESSTATUS      =
*   SEGSALESSTATUSX     =
*   SEGWEIGHTVOLUME     =
*   SEGWEIGHTVOLUMEX    =
*   DEMAND_PENALTYDATA  =
*   DEMAND_PENALTYDATAX =
*   NFMCHARGEWEIGHTS    =
*   NFMCHARGEWEIGHTSX   =
*   NFMSTRUCTURALWEIGHTS        =
*   NFMSTRUCTURALWEIGHTSX       =
  .

IF error_handle-type = 'S'.
  MESSAGE 'materail create succesfully' TYPE 'S'.
ELSE.
  MESSAGE 'somwthing went wrong' TYPE 'E' DISPLAY LIKE 'S'.
ENDIF.


.
