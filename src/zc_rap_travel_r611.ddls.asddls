@EndUserText.label: 'Travel BO projection view'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_RAP_Travel_R611
  as projection on ZI_RAP_Travel_R611 as Travel
{
  key TravelUUID,
      @Search.defaultSearchElement: true
      TravelID,
      //valueHelp annotation changed from standard table to Custom Entity to get the Agency details from Backend ODATA Call to external system
      //@Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency', element: 'AgencyID' } }]
      @Consumption.valueHelpDefinition: [{ entity : {name: 'zce_rap_agency_R611', element: 'AgencyId' } }]
      //Comment the Agency name annotation as Custom CDS entity dosent have alias of Name
      //@ObjectModel.text.element: ['AgencyName']
      @Search.defaultSearchElement: true
      AgencyID,
      //Also comment the Agency name as Custom CDS entity dosent have alias of Name
      //_Agency.Name       as AgencyName,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID' } }]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      CustomerID,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [{entity: { name: 'I_Currency', element: 'Currency' } }]
      CurrencyCode,
      Description,
      TravelStatus,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZC_RAP_BOOKING_R611,
      _Currency,
      _Customer
}
