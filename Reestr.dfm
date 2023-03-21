object ReestrForm: TReestrForm
  Left = 0
  Top = 0
  Caption = #1056#1077#1077#1089#1090#1088
  ClientHeight = 688
  ClientWidth = 1228
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 19
    Width = 1228
    Height = 57
    Align = alTop
    TabOrder = 0
    DesignSize = (
      1228
      57)
    object Label1: TLabel
      Left = 8
      Top = 13
      Width = 42
      Height = 16
      Caption = #1052#1077#1089#1103#1094':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 38
      Width = 103
      Height = 13
      Caption = #1043#1088#1072#1092#1080#1082#1086#1074' '#1079#1072' '#1084#1077#1089#1103#1094': '
    end
    object Label3: TLabel
      Left = 239
      Top = 38
      Width = 103
      Height = 13
      Caption = #1047#1072#1090#1088#1072#1095#1077#1085#1085#1086#1077' '#1074#1088#1077#1084#1103':'
    end
    object ComboBox1: TComboBox
      Left = 56
      Top = 11
      Width = 177
      Height = 22
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Text = #1071#1085#1074#1072#1088#1100
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
    object BitBtn1: TBitBtn
      Left = 1080
      Top = 8
      Width = 129
      Height = 43
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1074#1086#1076' '#1074' Excel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object JvgStringGrid1: TJvgStringGrid
    Left = 0
    Top = 76
    Width = 1228
    Height = 612
    Align = alClient
    ColCount = 35
    DefaultColWidth = 20
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLineWidth = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing, goRowSelect]
    ParentFont = False
    TabOrder = 1
    OnDrawCell = JvgStringGrid1DrawCell
    CaptionTextAlignment = taLeftJustify
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -12
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    Captions.Strings = (
      #1053#1072#1079#1074#1072#1085#1080#1077' / '#1044#1072#1090#1072
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16'
      '17'
      '18'
      '19'
      '20'
      '21'
      '22'
      '23'
      '24'
      '25'
      '26'
      '27'
      '28'
      '29'
      '30'
      '31'
      #1042#1089#1077#1075#1086
      #1057#1090#1086#1080#1084#1086#1089#1090#1100
      #1057#1091#1084#1084#1072)
    ExtOptions = []
    EditorFont.Charset = DEFAULT_CHARSET
    EditorFont.Color = clWindowText
    EditorFont.Height = -11
    EditorFont.Name = 'Tahoma'
    EditorFont.Style = []
    ExplicitTop = 82
    ColWidths = (
      317
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      45
      70
      176)
    RowHeights = (
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20)
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 0
    Width = 1228
    Height = 19
    Align = alTop
    Panels = <
      item
        Text = #1055#1072#1087#1082#1072' '#1076#1083#1103' '#1088#1077#1077#1089#1090#1088#1086#1074': '
        Width = 50
      end>
  end
end
