*&---------------------------------------------------------------------*
*& Report zaks_fc_alv_oo
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaks_fc_alv_oo.

DATA : lv_vbeln TYPE vbeln_va.
SELECT-OPTIONS : s_vbeln FOR lv_vbeln.

DATA : lt_data TYPE TABLE OF sflight.

* Field Catalog in Classical ALV Report ----------------------------------------------------
DATA : lt_fieldcat TYPE lvc_t_fcat,
       lw_fieldcat TYPE lvc_s_fcat.

*1. Create a Field Catalog ------------------------------------------------------------------
*( a ) -- Use SAP Function Module ( LVC_FIELDCATALOG_MERGE ) to create a Field Catalog.
*CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
*  EXPORTING
*    i_structure_name = 'SFLIGHT'
*  CHANGING
*    ct_fieldcat      = lt_fieldcat.

*( b ) -- Manually create a Field Catalog.
CLEAR : lw_fieldcat.
lw_fieldcat-fieldname = 'CARRID'.
lw_fieldcat-col_pos = '1'.
lw_fieldcat-scrtext_l = 'Airline ID'.
lw_fieldcat-coltext = 'Airline'.
lw_fieldcat-outputlen = 10.
APPEND lw_fieldcat TO lt_fieldcat.

CLEAR : lw_fieldcat.
lw_fieldcat-fieldname = 'CONNID'.
lw_fieldcat-col_pos = '2'.
lw_fieldcat-scrtext_l = 'Connection ID'.
lw_fieldcat-outputlen = 15.
APPEND lw_fieldcat TO lt_fieldcat.

CLEAR : lw_fieldcat.
lw_fieldcat-fieldname = 'FLDATE'.
lw_fieldcat-col_pos = '3'.
lw_fieldcat-scrtext_l = 'Flight Date'.
lw_fieldcat-outputlen = 15.
APPEND lw_fieldcat TO lt_fieldcat.

CLEAR : lw_fieldcat.
lw_fieldcat-fieldname = 'PRICE'.
lw_fieldcat-col_pos = '4'.
lw_fieldcat-scrtext_l = 'Air Fare'.
lw_fieldcat-outputlen = 10.
APPEND lw_fieldcat TO lt_fieldcat.

CLEAR : lw_fieldcat.
lw_fieldcat-fieldname = 'CURRENCY'.
lw_fieldcat-col_pos = '5'.
lw_fieldcat-scrtext_l = 'Local currency of airline'.
lw_fieldcat-outputlen = 20.
APPEND lw_fieldcat TO lt_fieldcat.

CLEAR : lw_fieldcat.
lw_fieldcat-fieldname = 'SEATSMAX'.
lw_fieldcat-col_pos = '6'.
lw_fieldcat-scrtext_l = 'Maximum Capacity'.
lw_fieldcat-outputlen = 20.
APPEND lw_fieldcat TO lt_fieldcat.

CLEAR : lw_fieldcat.
lw_fieldcat-fieldname = 'SEATSOCC'.
lw_fieldcat-col_pos = '7'.
lw_fieldcat-scrtext_l = 'Occupied Seats'.
lw_fieldcat-outputlen = 20.
APPEND lw_fieldcat TO lt_fieldcat.


*2. Bind Data with Field Catalog -----------------------------------------------------------
*DATA : lo_alv TYPe REF TO cl_gui_alv_grid.
*
*CREATE OBJECT lo_alv
*    EXPORTING
*        i_parent = cl_gui_container=>screen0.
*call METHOD lo_alv->set_table_for_first_display
*    CHANGING
*        it_outtab = lt_data
*        it_fieldcatalog = lt_fieldcat.

DATA : lo_alv TYPE REF TO cl_salv_table.
TRY.
    cl_salv_table=>factory(
        IMPORTING
            r_salv_table = lo_alv
            CHANGING
                t_table = lt_data ).

    lo_alv->display( ).
  CATCH  cx_salv_msg.
ENDTRY.
