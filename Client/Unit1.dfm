object dmMy: TdmMy
  OldCreateOrder = False
  OnCreate = DataModulCreate
  OnDestroy = DataModuleDestroy
  Left = 463
  Top = 254
  Height = 365
  Width = 683
  object DCOMConnection1: TDCOMConnection
    ServerGUID = '{C20E026F-2872-4747-B8E6-9ED2B43D41B7}'
    ServerName = 'StoreAppServer.StoreServer'
    Left = 72
    Top = 32
  end
  object cdsProvider: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProvider'
    RemoteServer = DCOMConnection1
    Left = 40
    Top = 128
    object cdsProviderID: TIntegerField
      Alignment = taCenter
      DisplayLabel = #8470
      FieldName = 'ID'
      Required = True
    end
    object cdsProviderName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'Name'
      Size = 100
    end
    object cdsProviderAddress: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'Address'
      Size = 255
    end
  end
  object cdsProduct: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduct'
    RemoteServer = DCOMConnection1
    Left = 128
    Top = 128
    object cdsProductID: TIntegerField
      Alignment = taCenter
      DisplayLabel = #8470
      FieldName = 'ID'
      Required = True
    end
    object cdsProductName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'Name'
      Size = 100
    end
    object cdsProductUnit: TStringField
      Alignment = taCenter
      DisplayLabel = #1045#1076'. '#1080#1079#1084'.'
      FieldName = 'Unit'
      Size = 10
    end
  end
  object cdsWaybill: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspWaybill'
    RemoteServer = DCOMConnection1
    OnCalcFields = cdsWaybillCalcFields
    Left = 216
    Top = 128
    object cdsWaybillID: TIntegerField
      Alignment = taCenter
      DisplayLabel = #8470
      FieldName = 'ID'
      Required = True
    end
    object cdsWaybillProviderID: TIntegerField
      FieldName = 'ProviderID'
      Visible = False
    end
    object cdsWaybillTotalSum: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 15
      FieldName = 'TotalSum'
      DisplayFormat = ',0.00'
    end
    object cdsWaybillDate: TDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'Date'
    end
    object cdsWaybillisPaid: TIntegerField
      DisplayLabel = #1054#1087#1083#1095#1077#1085#1086
      FieldName = 'isPaid'
      Visible = False
    end
    object cdsWaybillProviderName: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 50
      FieldKind = fkInternalCalc
      FieldName = 'ProviderName'
      Size = 100
    end
    object cdsWaybillProviderAddress: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 100
      FieldKind = fkCalculated
      FieldName = 'ProviderAddress'
      Size = 255
      Calculated = True
    end
    object cdsWaybillPaided: TStringField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldKind = fkCalculated
      FieldName = 'Paided'
      Calculated = True
    end
  end
  object cdsWaybillInfo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspWaybillInfo'
    RemoteServer = DCOMConnection1
    OnCalcFields = cdsWaybillInfoCalcFields
    Left = 304
    Top = 128
    object cdsWaybillInfoWaybillID: TIntegerField
      FieldName = 'WaybillID'
      Required = True
      Visible = False
    end
    object cdsWaybillInfoProductID: TIntegerField
      Alignment = taCenter
      DisplayLabel = #8470
      FieldName = 'ProductID'
    end
    object cdsWaybillInfoName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'Name'
      LookupDataSet = cdsProduct
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'ProductID'
      Size = 100
      Lookup = True
    end
    object cdsWaybillInfoUnit: TStringField
      Alignment = taCenter
      DisplayLabel = #1045#1076'. '#1080#1079#1084'.'
      FieldKind = fkLookup
      FieldName = 'Unit'
      LookupDataSet = cdsProduct
      LookupKeyFields = 'ID'
      LookupResultField = 'Unit'
      KeyFields = 'ProductID'
      Size = 10
      Lookup = True
    end
    object cdsWaybillInfoPrice: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 15
      FieldName = 'Price'
      DisplayFormat = ',0.00'
    end
    object cdsWaybillInfoQuantity: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      DisplayWidth = 15
      FieldName = 'Quantity'
      DisplayFormat = ',0.00'
    end
    object cdsWaybillInfoSum: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'Sum'
      DisplayFormat = ',0.00'
      Calculated = True
    end
  end
  object cdsReport: TClientDataSet
    Aggregates = <>
    Params = <>
    RemoteServer = DCOMConnection1
    Left = 408
    Top = 128
  end
end
