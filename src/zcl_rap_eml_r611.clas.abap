CLASS zcl_rap_eml_r611 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_eml_r611 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    SELECT SINGLE TravelUUID
      FROM zi_rap_travel_R611
      INTO @DATA(lv_traveluuid).

*    " step 1 - READ
*    READ ENTITIES OF ZI_RAP_Travel_R611
*      ENTITY Travel
*        FIELDS ( AgencyID CustomerID TravelID )
*        WITH VALUE #( ( TravelUUID = lv_traveluuid ) )
*        RESULT DATA(travel)
*      ENTITY Booking
*        ALL FIELDS
*        WITH VALUE #( ( BookingUUID = travel[ 1 ]-CustomerID ) )
*        RESULT DATA(booking).
*    "       _booking
*    "        All fields
*    "        with value #( ( TravelID = travel-travelid ) ).//
*
*    out->write( travel ).

*" step 4 - READ By Association
*    READ ENTITIES OF ZI_RAP_Travel_R611
*      ENTITY travel BY \_Booking
*        ALL FIELDS WITH VALUE #( ( TravelUUID = '111111111111111111111' ) )
*      RESULT DATA(bookings)
*      FAILED DATA(failed)
*      REPORTED DATA(reported).
*
*    out->write( bookings ).

*     " step 6 - MODIFY Update
*     MODIFY ENTITIES OF ZI_RAP_Travel_R611
*       ENTITY travel
*         UPDATE
*           SET FIELDS WITH VALUE
*             #( ( TravelUUID  = lv_traveluuid
*                  Description = 'I like RAP@openSAP' ) )
*
*      FAILED DATA(failed)
*      REPORTED DATA(reported).
*
* " step 6b - Commit Entities
*     COMMIT ENTITIES
*       RESPONSE OF ZI_RAP_Travel_R611
*       FAILED     DATA(failed_commit)
*       REPORTED   DATA(reported_commit).
*
*     out->write( 'Update done' ).

*    MODIFY ENTITY zi_rap_travel_r611
*         CREATE
*            SET FIELDS WITH VALUE
*             #( (  %cid        = 'MyContentID_1'
*                     AgencyID    = '70012'
*                     CustomerID  = '14'
*                     BeginDate   = cl_abap_context_info=>get_system_date( )
*                     EndDate     = cl_abap_context_info=>get_system_date( ) + 10
*                     Description = 'I like RAP@openSAP' ) )
*
*         MAPPED DATA(mapped)
*         FAILED     DATA(failed)
*         REPORTED   DATA(reported).
*
*    out->write( mapped-travel ).
*
*    COMMIT ENTITIES
*        RESPONSE OF zi_rap_travel_r611
*        FAILED     DATA(failed_commit)
*         REPORTED   DATA(reported_commit).
*
*    out->write( 'Create done' ).

    select *
    from /dmo/flight
    into table @data(lt_flight).

    out->write( lines( lt_flight ) ).
"   out->write( lt_flight ).


  ENDMETHOD.
ENDCLASS.
