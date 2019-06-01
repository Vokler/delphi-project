object fmReport: TfmReport
  Left = 339
  Top = 142
  Width = 1044
  Height = 538
  Caption = #1054#1090#1095#1105#1090#1085#1086#1089#1090#1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 300
    Top = 0
    Width = 728
    Height = 499
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 300
    Height = 499
    Align = alLeft
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 76
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object Label2: TLabel
      Left = 192
      Top = 8
      Width = 76
      Height = 13
      Caption = #8470' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
    end
    object Label3: TLabel
      Left = 16
      Top = 328
      Width = 13
      Height = 13
      Caption = #1054#1090
    end
    object Label4: TLabel
      Left = 16
      Top = 368
      Width = 15
      Height = 13
      Caption = #1044#1086
    end
    object listName: TListBox
      Left = 16
      Top = 24
      Width = 177
      Height = 241
      ItemHeight = 13
      TabOrder = 0
    end
    object listID: TListBox
      Left = 192
      Top = 24
      Width = 89
      Height = 241
      ItemHeight = 13
      TabOrder = 1
    end
    object btnAddSupplier: TButton
      Left = 56
      Top = 280
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = btnAddSupplierClick
    end
    object btnRemoveSupplier: TButton
      Left = 152
      Top = 280
      Width = 113
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      TabOrder = 3
      OnClick = btnRemoveSupplierClick
    end
    object btnReport: TButton
      Left = 72
      Top = 432
      Width = 161
      Height = 17
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1086#1090#1095#1105#1090
      TabOrder = 4
      OnClick = btnReportClick
    end
    object btnClearReport: TButton
      Left = 72
      Top = 448
      Width = 161
      Height = 17
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090' '#1086#1090#1095#1105#1090#1072
      Enabled = False
      TabOrder = 5
      OnClick = btnClearReportClick
    end
    object dtStart: TDateTimePicker
      Left = 16
      Top = 344
      Width = 186
      Height = 21
      Date = 43616.976039224540000000
      Time = 43616.976039224540000000
      TabOrder = 6
    end
    object dtEnd: TDateTimePicker
      Left = 16
      Top = 384
      Width = 186
      Height = 21
      Date = 43616.976127835650000000
      Time = 43616.976127835650000000
      TabOrder = 7
    end
    object btnReportExcel: TButton
      Left = 72
      Top = 464
      Width = 161
      Height = 17
      Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1086#1090#1095#1105#1090' '#1074' Excel'
      Enabled = False
      TabOrder = 8
      OnClick = btnReportExcelClick
    end
  end
  object DataSource1: TDataSource
    Left = 440
    Top = 88
  end
end
