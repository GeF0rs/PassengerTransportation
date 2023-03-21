object ReysVodForm: TReysVodForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1056#1077#1081#1089#1099' '#1074#1086#1076#1080#1090#1077#1083#1103
  ClientHeight = 540
  ClientWidth = 1107
  Color = clBtnFace
  Constraints.MaxWidth = 1223
  Constraints.MinWidth = 1123
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    1107
    540)
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 49
    Height = 18
    Caption = #1052#1077#1089#1103#1094':'
  end
  object Label2: TLabel
    Left = 8
    Top = 68
    Width = 144
    Height = 18
    Caption = #1043#1088#1072#1092#1080#1082#1086#1074' '#1079#1072' '#1084#1077#1089#1103#1094': '
  end
  object Label4: TLabel
    Left = 799
    Top = 463
    Width = 184
    Height = 18
    Anchors = [akBottom]
    Caption = #1057#1091#1084#1084#1072' '#1074#1086#1076#1080#1090#1077#1083#1102' '#1079#1072' '#1076#1077#1085#1100': '
  end
  object Label3: TLabel
    Left = 230
    Top = 463
    Width = 108
    Height = 18
    Anchors = [akBottom]
    Caption = #1050#1086#1083'-'#1074#1086' '#1088#1077#1081#1089#1086#1074': '
  end
  object Label5: TLabel
    Left = 799
    Top = 495
    Width = 194
    Height = 18
    Anchors = [akBottom]
    Caption = #1057#1091#1084#1084#1072' '#1074#1086#1076#1080#1090#1077#1083#1102' '#1079#1072' '#1084#1077#1089#1103#1094': '
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 16
    Top = 183
    Width = 177
    Height = 26
    KeyField = 'N_tab'
    ListField = 'fio'
    ListSource = DM.DS_Vod
    TabOrder = 0
  end
  object Button1: TButton
    Left = 55
    Top = 228
    Width = 97
    Height = 33
    Caption = #1053#1072#1081#1090#1080
    TabOrder = 1
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 16
    Top = 104
    Width = 177
    Height = 65
    Caption = #1042#1086#1076#1080#1090#1077#1083#1100
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #1060'.'#1048'.'#1054'.'
      #1053#1080#1082)
    TabOrder = 2
    OnClick = RadioGroup1Click
  end
  object DBGrid1: TJvDBGrid
    Left = 207
    Top = 36
    Width = 892
    Height = 421
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DM.DS_Work
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 21
    TitleRowHeight = 22
  end
  object ComboBox1: TComboBox
    Left = 16
    Top = 36
    Width = 177
    Height = 26
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 4
    Text = #1071#1085#1074#1072#1088#1100
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
  object ComboBox2: TComboBox
    Left = 562
    Top = 4
    Width = 169
    Height = 26
    Style = csDropDownList
    TabOrder = 5
    OnCloseUp = ComboBox2CloseUp
  end
  object UpDown1: TUpDown
    Left = 737
    Top = 4
    Width = 48
    Height = 26
    Orientation = udHorizontal
    TabOrder = 6
    OnClick = UpDown1Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 521
    Width = 1107
    Height = 19
    Panels = <
      item
        Text = #1055#1072#1087#1082#1072' '#1076#1083#1103' '#1086#1090#1095#1077#1090#1072'-'#1088#1077#1081#1089#1086#1074': '
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 16
    Top = 288
    Width = 177
    Height = 211
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1077#1088#1080#1086#1076
    TabOrder = 8
    VerticalAlignment = taAlignTop
    object Label6: TLabel
      Left = 80
      Top = 30
      Width = 14
      Height = 18
      Caption = #1057':'
    end
    object Label7: TLabel
      Left = 80
      Top = 92
      Width = 23
      Height = 18
      Caption = #1055#1086':'
    end
    object ComboBox3: TComboBox
      Left = 16
      Top = 54
      Width = 145
      Height = 26
      Style = csDropDownList
      TabOrder = 0
    end
    object ComboBox4: TComboBox
      Left = 16
      Top = 116
      Width = 145
      Height = 26
      Style = csDropDownList
      TabOrder = 1
    end
    object Button2: TButton
      Left = 31
      Top = 161
      Width = 121
      Height = 34
      Caption = #1042#1099#1074#1086#1076' '#1074' Excel'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
end
