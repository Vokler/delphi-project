object StoreServer: TStoreServer
  OldCreateOrder = False
  Left = 362
  Top = 223
  Height = 517
  Width = 979
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 184
    Top = 40
  end
  object IBQuery1: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 576
    Top = 160
  end
  object ibtProvider: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'Provider'
    Left = 56
    Top = 160
  end
  object ibtProduct: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'Product'
    Left = 160
    Top = 160
  end
  object ibtWaybill: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'Waybill'
    Left = 264
    Top = 160
  end
  object ibtWaybillInfo: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'WaybillInfo'
    Left = 368
    Top = 160
  end
  object ibtTMP: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TMP'
    Left = 472
    Top = 160
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = 'D:\'#1042#1072#1083#1077#1088#1072'\Delphi\Store\STOREDATABASE.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 72
    Top = 40
  end
  object dspProvider: TDataSetProvider
    DataSet = ibtProvider
    Left = 56
    Top = 256
  end
  object dspProduct: TDataSetProvider
    DataSet = ibtProduct
    Left = 152
    Top = 256
  end
  object dspWaybill: TDataSetProvider
    DataSet = ibtWaybill
    Left = 256
    Top = 256
  end
  object dspWaybillInfo: TDataSetProvider
    DataSet = ibtWaybillInfo
    Left = 360
    Top = 256
  end
  object dspTMP: TDataSetProvider
    DataSet = ibtTMP
    Left = 448
    Top = 256
  end
  object dspQuery: TDataSetProvider
    DataSet = IBQuery1
    Left = 544
    Top = 256
  end
  object ibspUpdateProvider: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UpdateProvider'
    Left = 40
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INNAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INADDRESS'
        ParamType = ptInput
      end>
  end
  object ibspDeleteProvider: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DeleteProvider'
    Left = 136
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end>
  end
  object ibspUpdateProduct: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UpdateProduct'
    Left = 232
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INNAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INUNIT'
        ParamType = ptInput
      end>
  end
  object ibspDeleteProduct: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DeleteProduct'
    Left = 328
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end>
  end
  object ibspUpdateWaybill: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UpdateWaybill'
    Left = 432
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INPROVIDERID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INTOTALSUM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'INDATE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INISPAID'
        ParamType = ptInput
      end>
  end
  object ibspDeleteWaybill: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DeleteWaybill'
    Left = 544
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end>
  end
  object ibspUpdateWaybillInfo: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UpdateWaybillInfo'
    Left = 648
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INWAYBILLID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INPRODUCTID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INQUANTITY'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INPRICE'
        ParamType = ptInput
      end>
  end
  object ibspDeleteWaybillInfo: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DeleteWaybillInfo'
    Left = 792
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INWAYBILLID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INPRODUCTID'
        ParamType = ptInput
      end>
  end
end
