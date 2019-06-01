object fmMain: TfmMain
  Left = 296
  Top = 157
  Width = 1084
  Height = 585
  Caption = #1055#1088#1086#1076#1072#1078#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlWaybill: TPanel
    Left = 0
    Top = 0
    Width = 1068
    Height = 170
    Align = alTop
    Caption = 'pnlWaybill'
    TabOrder = 0
    object pnlWaybillModify: TPanel
      Left = 1
      Top = 109
      Width = 1066
      Height = 60
      Align = alBottom
      BevelWidth = 5
      TabOrder = 0
      object Label3: TLabel
        Left = 120
        Top = 8
        Width = 127
        Height = 13
        Caption = #1059#1082#1072#1078#1080#1090#1077' '#1076#1072#1090#1091' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      end
      object btnNewWaybill: TButton
        Left = 456
        Top = 16
        Width = 130
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
        TabOrder = 0
        OnClick = btnNewWaybillClick
      end
      object btnDeleteWaybill: TButton
        Left = 608
        Top = 16
        Width = 130
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
        TabOrder = 1
        OnClick = btnDeleteWaybillClick
      end
      object dtWaybill: TDateTimePicker
        Left = 120
        Top = 24
        Width = 186
        Height = 21
        Date = 43611.932242245370000000
        Time = 43611.932242245370000000
        TabOrder = 2
      end
      object btnPay: TButton
        Left = 792
        Top = 16
        Width = 75
        Height = 25
        Caption = #1054#1087#1083#1072#1090#1080#1090#1100
        TabOrder = 3
        OnClick = btnPayClick
      end
    end
    object dbgWaybill: TDBGrid
      Left = 1
      Top = 1
      Width = 1066
      Height = 108
      Align = alClient
      DataSource = dsWaybill
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object pnlWaybillInfo: TPanel
    Left = 0
    Top = 170
    Width = 1068
    Height = 356
    Align = alClient
    Caption = 'pnlWaybillInfo'
    TabOrder = 1
    object pnlWaybillInfoModify: TPanel
      Left = 1
      Top = 255
      Width = 1066
      Height = 100
      Align = alBottom
      BevelOuter = bvLowered
      BevelWidth = 5
      TabOrder = 0
      object lbProduct: TLabel
        Left = 152
        Top = 24
        Width = 3
        Height = 13
      end
      object btnAddProduct: TButton
        Left = 832
        Top = 32
        Width = 130
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1076#1091#1082#1090' '
        Enabled = False
        TabOrder = 0
        OnClick = btnAddProductClick
      end
      object btnDeleteProduct: TButton
        Left = 832
        Top = 64
        Width = 130
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1086#1076#1091#1082#1090
        Enabled = False
        TabOrder = 1
        OnClick = btnDeleteProductClick
      end
      object btnProductSelect: TButton
        Left = 176
        Top = 48
        Width = 75
        Height = 25
        Caption = #1055#1088#1086#1076#1091#1082#1090
        TabOrder = 2
        OnClick = btnProductSelectClick
      end
      object gbNumbers: TGroupBox
        Left = 360
        Top = 16
        Width = 345
        Height = 81
        Caption = #1059#1082#1072#1078#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1103
        TabOrder = 3
        Visible = False
        object Label1: TLabel
          Left = 8
          Top = 24
          Width = 59
          Height = 13
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        end
        object Label2: TLabel
          Left = 8
          Top = 48
          Width = 26
          Height = 13
          Caption = #1062#1077#1085#1072
        end
        object edQuantity: TEdit
          Left = 80
          Top = 24
          Width = 177
          Height = 21
          TabOrder = 0
          Text = 'edQuantity'
          OnChange = edQuantityChange
        end
        object edPrice: TEdit
          Left = 80
          Top = 48
          Width = 177
          Height = 21
          TabOrder = 1
          Text = 'edPrice'
          OnChange = edQuantityChange
        end
      end
    end
    object dbgWaybillInfo: TDBGrid
      Left = 1
      Top = 1
      Width = 1066
      Height = 254
      Align = alClient
      DataSource = dsWaybillInfo
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object MainMenu1: TMainMenu
    Left = 192
    Top = 24
    object miData: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077
      object miProduct: TMenuItem
        Caption = #1055#1088#1086#1076#1091#1082#1090#1099
        OnClick = miProductClick
      end
      object miProvider: TMenuItem
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082#1080
        OnClick = miProviderClick
      end
    end
    object miReport: TMenuItem
      Caption = #1054#1090#1095#1077#1090
      object miReportMSWord: TMenuItem
        Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072#1084
        OnClick = miReportMSWordClick
      end
    end
    object miClose: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = miCloseClick
    end
  end
  object dsWaybill: TDataSource
    OnDataChange = dsWaybillDataChange
    Left = 240
    Top = 24
  end
  object dsWaybillInfo: TDataSource
    Left = 120
    Top = 232
  end
end
