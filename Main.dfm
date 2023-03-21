object MainForm: TMainForm
  Left = 0
  Top = 0
  AlphaBlendValue = 225
  Caption = #1040#1056#1052' '#1044#1080#1089#1087#1077#1090#1095#1077#1088#1072' '#1087#1072#1089#1089#1072#1078#1080#1088#1089#1082#1080#1093' '#1087#1077#1088#1077#1074#1086#1079#1086#1082
  ClientHeight = 614
  ClientWidth = 1233
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    1233
    614)
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 183
    Top = 54
    Width = 63
    Height = 14
    Caption = #1043#1088#1072#1092#1080#1082#1086#1074': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 32
    Height = 14
    Caption = #1041#1072#1079#1072': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 26
    Width = 57
    Height = 14
    Caption = #1043#1088#1072#1092#1080#1082#1080': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 705
    Top = 52
    Width = 5
    Height = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 600
    Top = 54
    Width = 98
    Height = 16
    Caption = #1057#1077#1081#1095#1072#1089' '#1087#1086#1082#1072#1079#1072#1085':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 0
    Top = 46
    Width = 177
    Height = 24
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object TreeViewMain: TTreeView
    Left = 0
    Top = 76
    Width = 177
    Height = 534
    Anchors = [akLeft, akTop, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Indent = 19
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    OnChange = TreeViewMainChange
    OnContextPopup = TreeViewMainContextPopup
    OnMouseUp = TreeViewMainMouseUp
    Items.NodeData = {
      03010000002C0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      000C0000000107130440043004440438043A0438042A00000000000000000000
      00FFFFFFFFFFFFFFFF00000000000000000000000001062F043D043204300440
      044C042C0000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
      0000000107240435043204400430043B044C04260000000000000000000000FF
      FFFFFFFFFFFFFF00000000000000000000000001041C043004400442042A0000
      000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000010610
      043F04400435043B044C04240000000000000000000000FFFFFFFFFFFFFFFF00
      000000000000000000000001031C0430043904260000000000000000000000FF
      FFFFFFFFFFFFFF000000000000000000000000010418044E043D044C04260000
      000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000010418
      044E043B044C042A0000000000000000000000FFFFFFFFFFFFFFFF0000000000
      0000000000000001061004320433044304410442042E00000000000000000000
      00FFFFFFFFFFFFFFFF0000000000000000000000000108210435043D0442044F
      04310440044C042C0000000000000000000000FFFFFFFFFFFFFFFF0000000000
      0000000000000001071E043A0442044F04310440044C042A0000000000000000
      000000FFFFFFFFFFFFFFFF00000000000000000000000001061D043E044F0431
      0440044C042C0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      00000000000107140435043A043004310440044C04}
  end
  object JvDBUltimGrid1: TJvDBUltimGrid
    Left = 176
    Top = 76
    Width = 1054
    Height = 534
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DM.DS_Main
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBUltimGrid1DrawColumnCell
    OnDblClick = JvDBUltimGrid1DblClick
    OnMouseUp = JvDBUltimGrid1MouseUp
    TitleArrow = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 22
    TitleRowHeight = 22
    Columns = <
      item
        Expanded = False
        FieldName = 'Nreys'
        Title.Caption = #8470
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nick'
        Title.Alignment = taCenter
        Title.Caption = #1042#1086#1076#1080#1090#1077#1083#1100
        Width = 118
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Time_otp'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1042#1088#1077#1084#1103' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103
        Width = 146
        Visible = True
      end
      item
        DropDownRows = 15
        Expanded = False
        FieldName = 'Marshryt_dvi'
        Title.Alignment = taCenter
        Title.Caption = #1052#1072#1088#1096#1088#1091#1090
        Width = 461
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'in_or_out'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1054#1090#1087#1088#1072#1074#1082#1072' '#1080#1083#1080' '#1087#1088#1080#1073#1099#1090#1080#1077
        Width = 172
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'kol_l'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1051#1102#1076#1077#1081
        Visible = True
      end>
  end
  object CheckBox1: TCheckBox
    Left = 1061
    Top = 16
    Width = 161
    Height = 17
    Caption = #1053#1077' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1086#1090#1084#1077#1090#1082#1080
    Color = clWhite
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 3
    OnClick = CheckBox1Click
  end
  object BitBtn2: TBitBtn
    Left = 1022
    Top = 46
    Width = 203
    Height = 24
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1101#1090#1086#1090' '#1075#1088#1072#1092#1080#1082' '#1080#1079' '#1073#1072#1079#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object MainMenu1: TMainMenu
    Left = 344
    Top = 8
    object N1: TMenuItem
      Caption = #1052#1072#1088#1096#1088#1091#1090#1099
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1042#1086#1076#1080#1090#1077#1083#1080
      OnClick = N2Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N13: TMenuItem
      Caption = #1054#1076#1086#1084#1077#1090#1088#1099
      OnClick = N13Click
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N12: TMenuItem
      Caption = #1055#1091#1090#1077#1074#1099#1077' '#1083#1080#1089#1090#1099
      OnClick = N12Click
    end
    object N17: TMenuItem
      Caption = '-'
    end
    object N18: TMenuItem
      Caption = #1056#1077#1077#1089#1090#1088
      OnClick = N18Click
    end
    object N19: TMenuItem
      Caption = '-'
    end
    object N20: TMenuItem
      Caption = #1054#1090#1095#1077#1090#1099
      object N21: TMenuItem
        Caption = #1056#1077#1081#1089#1099' '#1074#1086#1076#1080#1090#1077#1083#1103
        OnClick = N21Click
      end
      object N24: TMenuItem
        Caption = #1046#1091#1088#1085#1072#1083' '#1091#1095#1077#1090#1072' '#1087#1091#1090#1077#1074#1099#1093' '#1083#1080#1089#1090#1086#1074
        OnClick = N24Click
      end
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object N7: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnClick = N7Click
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object N16: TMenuItem
      Caption = #1063#1080#1089#1090#1082#1072' '#1041#1044
      OnClick = N16Click
    end
    object N15: TMenuItem
      Caption = '-'
    end
    object N23: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      OnClick = N23Click
    end
    object N22: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
      OnClick = N9Click
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 408
    Top = 136
    object N4: TMenuItem
      Caption = #1054#1090#1084#1077#1090#1080#1090#1100
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1090#1084#1077#1090#1082#1091
      OnClick = N5Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 56
    Top = 336
    object N10: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089' '#1087#1072#1087#1082#1080' '#1080' '#1073#1072#1079#1099
      OnClick = N10Click
    end
    object Excel1: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1074' Excel'
      OnClick = Excel1Click
    end
  end
end
