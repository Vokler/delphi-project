object fmNewProduct: TfmNewProduct
  Left = 192
  Top = 125
  Width = 1044
  Height = 540
  Caption = #1053#1086#1074#1099#1081' '#1087#1088#1086#1076#1091#1082#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object lbName: TLabel
    Left = 72
    Top = 40
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object lbUnit: TLabel
    Left = 72
    Top = 64
    Width = 42
    Height = 13
    Caption = #1045#1076'. '#1080#1079#1084'.'
  end
  object edName: TEdit
    Left = 160
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edName'
    OnChange = edNameChange
  end
  object edUnit: TEdit
    Left = 160
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edUnit'
    OnChange = edNameChange
  end
  object btnOK: TBitBtn
    Left = 80
    Top = 104
    Width = 89
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 2
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 184
    Top = 104
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    Kind = bkCancel
  end
end
