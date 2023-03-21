object UAC_dlg: TUAC_dlg
  Left = 245
  Top = 108
  BorderStyle = bsDialog
  Caption = #1047#1072#1087#1088#1086#1089' '#1085#1072' '#1087#1086#1074#1099#1096#1077#1085#1080#1077' '#1087#1088#1072#1074
  ClientHeight = 93
  ClientWidth = 325
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 9
    Width = 310
    Height = 14
    Caption = #1044#1083#1103' '#1087#1088#1086#1076#1086#1083#1078#1077#1085#1080#1103' - '#1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object UACPWord: TEdit
    Left = 8
    Top = 29
    Width = 309
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 0
  end
  object OKBtn: TButton
    Left = 79
    Top = 60
    Width = 75
    Height = 25
    Caption = #1054#1050
    Default = True
    TabOrder = 1
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 160
    Top = 60
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
end
