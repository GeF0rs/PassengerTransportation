object ClearDBForm: TClearDBForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1063#1080#1089#1090#1082#1072' '#1041#1044
  ClientHeight = 528
  ClientWidth = 480
  Color = clBtnFace
  Constraints.MaxWidth = 496
  Constraints.MinHeight = 496
  Constraints.MinWidth = 496
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TreeViewClearDB: TTreeView
    Left = 0
    Top = 0
    Width = 201
    Height = 528
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Indent = 19
    ParentFont = False
    TabOrder = 0
    OnChange = TreeViewClearDBChange
    Items.NodeData = {
      03010000003A0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      0000000000010E2204300431043B04380446044B042000320420003104300437
      043504}
  end
  object RadioGroup1: TRadioGroup
    Left = 215
    Top = 8
    Width = 250
    Height = 113
    Caption = #1056#1072#1073#1086#1090#1072' '#1089#1086' '#1074#1089#1077#1084#1080' '#1090#1072#1073#1083#1080#1094#1072#1084#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 1
    Items.Strings = (
      #1059#1076#1072#1083#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
      #1054#1095#1080#1089#1090#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091)
    ParentFont = False
    TabOrder = 1
  end
  object RadioGroup2: TRadioGroup
    Left = 215
    Top = 242
    Width = 250
    Height = 113
    Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1090#1072#1073#1083#1080#1094#1077#1081' '#1086#1076#1086#1084#1077#1090#1088#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086' '#1076#1072#1090#1091
      #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086' '#1074#1086#1076#1080#1090#1077#1083#1102
      #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086' '#1076#1072#1090#1077' '#1080' '#1074#1086#1076#1080#1090#1077#1083#1102)
    ParentFont = False
    TabOrder = 2
    OnClick = RadioGroup2Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 215
    Top = 423
    Width = 234
    Height = 27
    Date = 42145.567318206020000000
    Time = 42145.567318206020000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 215
    Top = 374
    Width = 234
    Height = 27
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'N_tab'
    ListField = 'fio'
    ListSource = DM.DS_Vod
    ParentFont = False
    TabOrder = 4
  end
  object Button1: TButton
    Left = 279
    Top = 469
    Width = 106
    Height = 33
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 5
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 215
    Top = 136
    Width = 250
    Height = 90
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1075#1088#1072#1092#1080#1082#1080' '#1079#1072' '#1084#1077#1089#1103#1094
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object ComboBox1: TComboBox
      Left = 40
      Top = 36
      Width = 153
      Height = 26
      Style = csDropDownList
      TabOrder = 0
      OnCloseUp = ComboBox1CloseUp
      Items.Strings = (
        #1071#1085#1074#1072#1088#1100
        #1060#1077#1074#1088#1072#1083#1100
        #1052#1072#1088#1090
        #1040#1087#1088#1077#1083#1100
        #1052#1072#1081
        #1048#1102#1085#1100
        #1048#1102#1083#1100
        #1040#1074#1075#1091#1089#1090
        #1057#1077#1085#1090#1103#1073#1088#1100
        #1054#1082#1090#1103#1073#1088#1100
        #1053#1086#1103#1073#1088#1100
        #1044#1077#1082#1072#1073#1088#1100)
    end
  end
end
