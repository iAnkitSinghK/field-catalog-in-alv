*&---------------------------------------------------------------------*
*& Report zaks_fc_alv_classical
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaks_fc_alv_classical.
DATA : lv_vbeln TYPE vbeln_va.
SELECT-OPTIONS : s_vbeln FOR lv_vbeln.

TYPES : BEGIN OF ty_vbak,
          vbeln TYPE vbeln_va,
          erdat TYPE erdat,
          erzet TYPE erzet,
          ernam TYPE ernam,
          vbtyp TYPE vbtypl,
        END OF ty_vbak.
DATA : lt_vbak TYPE TABLE OF ty_vbak,
       wa_vbak TYPE ty_vbak.

TYPES : BEGIN OF ty_vbap,
          vbeln TYPE vbeln_va,
          posnr TYPE posnr_va,
          matnr TYPE matnr,
        END OF ty_vbap.
DATA : lt_vbap TYPE TABLE OF ty_vbap,
       wa_vbap TYPE ty_vbap.

DATA : lt_res TYPE STANDARD TABLE OF zaks_fc_str,
       wa_res TYPE zaks_fc_str.

DATA : lv_keyinfo TYPE slis_keyinfo_alv.

SELECT FROM vbak
FIELDS vbeln, erdat, erzet, ernam, vbtyp
WHERE vbeln IN @s_vbeln
INTO TABLE @lt_vbak.

IF lt_vbak IS NOT INITIAL.
  SELECT FROM vbap
  FIELDS vbeln, posnr, matnr
  FOR ALL ENTRIES IN @lt_vbak
  WHERE vbeln = @lt_vbak-vbeln
  INTO TABLE @lt_vbap.
ENDIF.

LOOP AT lt_vbak INTO wa_vbak.
  LOOP AT lt_vbap INTO wa_vbap WHERE vbeln = wa_vbak-vbeln.
    wa_res-vbeln = wa_vbak-vbeln.
    wa_res-erdat = wa_vbak-erdat.
    wa_res-erzet = wa_vbak-erzet.
    wa_res-ernam = wa_vbak-ernam.
    wa_res-vbtyp = wa_vbak-vbtyp.
    wa_res-posnr = wa_vbap-posnr.
    wa_res-matnr = wa_vbap-matnr.
    APPEND wa_res TO lt_res.
  ENDLOOP.
ENDLOOP.


* Field Catalog in Classical ALV Report ----------------------------------------------------
DATA : lt_fieldcat TYPE  slis_t_fieldcat_alv,
       wa_fieldcat TYPE slis_fieldcat_alv.

*1.1. Create a Field Catalog (for binding in LIST or GRID) ----------------------------------
*( a ) -- Use SAP Function Module ( REUSE_ALV_FIELDCATALOG_MERGE ) to create a Field Catalog.
*CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
*  EXPORTING
*    i_structure_name = 'zaks_fc_str'
*  CHANGING
*    ct_fieldcat      = lt_fieldcat.

*( b ) -- Manually create a Field Catalog.
*CLEAR : wa_fieldcat.
*wa_fieldcat-col_pos = '1'.
*wa_fieldcat-fieldname = 'VBELN'.
*wa_fieldcat-tabname = 'LT_RES'.
*wa_fieldcat-seltext_l = 'Sales Document Number'.
*wa_fieldcat-seltext_s = 'SDoc No'.
*APPEND wa_fieldcat TO lt_fieldcat.
*
*CLEAR : wa_fieldcat.
*wa_fieldcat-col_pos = '2'.
*wa_fieldcat-fieldname = 'ERDAT'.
*wa_fieldcat-tabname = 'LT_RES'.
*wa_fieldcat-seltext_l = 'Creation Date'.
*wa_fieldcat-seltext_s = 'Date'.
*APPEND wa_fieldcat TO lt_fieldcat.
*
*CLEAR : wa_fieldcat.
*wa_fieldcat-col_pos = '3'.
*wa_fieldcat-fieldname = 'ERZET'.
*wa_fieldcat-tabname = 'LT_RES'.
*wa_fieldcat-seltext_l = 'Entry Time'.
*wa_fieldcat-seltext_s = 'Time'.
*APPEND wa_fieldcat TO lt_fieldcat.
*
*CLEAR : wa_fieldcat.
*wa_fieldcat-col_pos = '4'.
*wa_fieldcat-fieldname = 'ERNAM'.
*wa_fieldcat-tabname = 'LT_RES'.
*wa_fieldcat-seltext_l = 'Object Creator'.
*wa_fieldcat-seltext_s = 'Creator'.
*APPEND wa_fieldcat TO lt_fieldcat.
*
*CLEAR : wa_fieldcat.
*wa_fieldcat-col_pos = '5'.
*wa_fieldcat-fieldname = 'VBTYP'.
*wa_fieldcat-tabname = 'LT_RES'.
*wa_fieldcat-seltext_l = 'Document Category'.
*wa_fieldcat-seltext_s = 'Category'.
*APPEND wa_fieldcat TO lt_fieldcat.
*
*CLEAR : wa_fieldcat.
*wa_fieldcat-col_pos = '6'.
*wa_fieldcat-fieldname = 'POSNR'.
*wa_fieldcat-tabname = 'LT_RES'.
*wa_fieldcat-seltext_l = 'Sales Document Item'.
*wa_fieldcat-seltext_s = 'Item'.
*APPEND wa_fieldcat TO lt_fieldcat.
*
*CLEAR : wa_fieldcat.
*wa_fieldcat-col_pos = '7'.
*wa_fieldcat-fieldname = 'MATNR'.
*wa_fieldcat-tabname = 'LT_RES'.
*wa_fieldcat-seltext_l = 'Material Number'.
*wa_fieldcat-seltext_s = 'Material'.
*APPEND wa_fieldcat TO lt_fieldcat.

*1.2. Create a Field Catalog (for binding in HIERSEQ LIST) ----------------------------------
*( a ) -- Manual Field Catalog
CLEAR : wa_fieldcat.
wa_fieldcat-col_pos = '1'.
wa_fieldcat-fieldname = 'VBELN'.
wa_fieldcat-tabname = 'LT_VBAK'.
wa_fieldcat-seltext_l = 'Sales Document Number'.
*wa_fieldcat-seltext_s = 'SDoc No'.
APPEND wa_fieldcat TO lt_fieldcat.

CLEAR : wa_fieldcat.
wa_fieldcat-col_pos = '2'.
wa_fieldcat-fieldname = 'ERDAT'.
wa_fieldcat-tabname = 'LT_VBAK'.
wa_fieldcat-seltext_l = 'Creation Date'.
*wa_fieldcat-seltext_s = 'Date'.
APPEND wa_fieldcat TO lt_fieldcat.

CLEAR : wa_fieldcat.
wa_fieldcat-col_pos = '3'.
wa_fieldcat-fieldname = 'ERZET'.
wa_fieldcat-tabname = 'LT_VBAK'.
wa_fieldcat-seltext_l = 'Entry Time'.
*wa_fieldcat-seltext_s = 'Time'.
APPEND wa_fieldcat TO lt_fieldcat.

CLEAR : wa_fieldcat.
wa_fieldcat-col_pos = '4'.
wa_fieldcat-fieldname = 'ERNAM'.
wa_fieldcat-tabname = 'LT_VBAK'.
wa_fieldcat-seltext_l = 'Object Creator'.
*wa_fieldcat-seltext_s = 'Creator'.
APPEND wa_fieldcat TO lt_fieldcat.

CLEAR : wa_fieldcat.
wa_fieldcat-col_pos = '5'.
wa_fieldcat-fieldname = 'VBTYP'.
wa_fieldcat-tabname = 'LT_VBAK'.
wa_fieldcat-seltext_l = 'Document Category'.
*wa_fieldcat-seltext_s = 'Category'.
APPEND wa_fieldcat TO lt_fieldcat.

CLEAR : wa_fieldcat.
wa_fieldcat-col_pos = '6'.
wa_fieldcat-fieldname = 'POSNR'.
wa_fieldcat-tabname = 'LT_VBAP'.
wa_fieldcat-seltext_l = 'Sales Document Item'.
*wa_fieldcat-seltext_s = 'Item'.
APPEND wa_fieldcat TO lt_fieldcat.

CLEAR : wa_fieldcat.
wa_fieldcat-col_pos = '7'.
wa_fieldcat-fieldname = 'MATNR'.
wa_fieldcat-tabname = 'LT_VBAP'.
wa_fieldcat-seltext_l = 'Material Number'.
*wa_fieldcat-seltext_s = 'Material'.
APPEND wa_fieldcat TO lt_fieldcat.

lv_keyinfo-header01 = 'VBELN'.
lv_keyinfo-item01 = 'VBELN'.

*2. Bind Data with Field Catalog -----------------------------------------------------------
*( a ) REUSE_ALV_LIST_DISPLAY -- List Display is Static i.e. the width of the columns are fixed
*CALL FUNCTION 'REUSE_ALV_LIST_DISPLAY'
*  EXPORTING
*    it_fieldcat = lt_fieldcat
*  TABLES
*    t_outtab    = lt_res.


*( b ) REUSE_ALV_GRID_DISPLAY
*CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
*  EXPORTING
*    it_fieldcat = lt_fieldcat
**   i_structure_name = 'zaks_fc_str'
*  TABLES
*    t_outtab    = lt_res.


*( c ) REUSE_ALV_HIERSEQ_LIST_DISPLAY
CALL FUNCTION 'REUSE_ALV_HIERSEQ_LIST_DISPLAY'
  EXPORTING
    it_fieldcat      = lt_fieldcat
    i_tabname_header = 'LT_VBAK'
    i_tabname_item   = 'LT_VBAP'
    is_keyinfo       = lv_keyinfo
  TABLES
    t_outtab_header  = lt_vbak
    t_outtab_item    = lt_vbap.
