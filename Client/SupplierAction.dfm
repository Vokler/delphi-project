object fmNewSupplier: TfmNewSupplier
  Left = 280
  Top = 128
  Width = 1044
  Height = 540
  Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbName: TLabel
    Left = 32
    Top = 40
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object lbAddress: TLabel
    Left = 32
    Top = 64
    Width = 31
    Height = 13
    Caption = #1040#1076#1088#1077#1089
  end
  object edName: TEdit
    Left = 128
    Top = 40
    Width = 177
    Height = 21
    TabOrder = 0
    Text = 'edName'
    OnChange = edNameChange
  end
  object edAddress: TEdit
    Left = 128
    Top = 64
    Width = 177
    Height = 21
    TabOrder = 1
    Text = 'edAddress'
    OnChange = edNameChange
  end
  object btnOK: TBitBtn
    Left = 56
    Top = 112
    Width = 137
    Height = 25
    Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077
    TabOrder = 2
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 208
    Top = 112
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    Kind = bkCancel
  end
end
