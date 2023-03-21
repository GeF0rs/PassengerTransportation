object PListForm: TPListForm
  Left = 265
  Top = 140
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1087#1091#1090#1077#1074#1099#1093' '#1083#1080#1089#1090#1086#1074
  ClientHeight = 613
  ClientWidth = 879
  Color = clBtnFace
  Constraints.MaxHeight = 651
  Constraints.MaxWidth = 895
  Constraints.MinHeight = 651
  Constraints.MinWidth = 895
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    879
    613)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 165
    Height = 16
    Caption = #1055#1072#1087#1082#1072' '#1076#1083#1103' '#1087#1091#1090#1077#1074#1099#1093' '#1083#1080#1089#1090#1086#1074': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 191
    Top = 46
    Width = 189
    Height = 18
    Caption = #1057#1086#1079#1076#1072#1085#1085#1086' '#1087#1091#1090#1077#1074#1099#1093' '#1083#1080#1089#1090#1086#1074': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 424
    Top = 124
    Width = 86
    Height = 18
    Caption = #1054#1078#1080#1076#1072#1085#1080#1077'...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 386
    Top = 46
    Width = 8
    Height = 18
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object TreeViewPytList: TTreeView
    Left = 0
    Top = 32
    Width = 185
    Height = 563
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
    OnChange = TreeViewPytListChange
    Items.NodeData = {
      03010000003A0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      000C000000010E130440043004440438043A0438042000320420003104300437
      0435042A0000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
      00000001062F043D043204300440044C042C0000000000000000000000FFFFFF
      FFFFFFFFFF0000000000000000000000000107240435043204400430043B044C
      04260000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
      0001041C043004400442042A0000000000000000000000FFFFFFFFFFFFFFFF00
      0000000000000000000000010610043F04400435043B044C0424000000000000
      0000000000FFFFFFFFFFFFFFFF00000000000000000000000001031C04300439
      04260000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
      00010418044E043D044C04260000000000000000000000FFFFFFFFFFFFFFFF00
      0000000000000000000000010418044E043B044C042A00000000000000000000
      00FFFFFFFFFFFFFFFF0000000000000000000000000106100432043304430441
      0442042E0000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
      0000000108210435043D0442044F04310440044C042C00000000000000000000
      00FFFFFFFFFFFFFFFF00000000000000000000000001071E043A0442044F0431
      0440044C042A0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      000000000001061D043E044F04310440044C042C0000000000000000000000FF
      FFFFFFFFFFFFFF0000000000000000000000000107140435043A043004310440
      044C04}
  end
  object ShellTreeView1: TShellTreeView
    Left = 700
    Top = 32
    Width = 179
    Height = 563
    ObjectTypes = [otFolders]
    Root = 'rfMyComputer'
    ShellListView = ShellListView1
    UseShellImages = True
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoRefresh = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Indent = 19
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    RightClickSelect = True
    ShowHint = False
    ShowRoot = False
    TabOrder = 0
    OnClick = ShellTreeView1Click
  end
  object ShellListView1: TShellListView
    Left = 184
    Top = 229
    Width = 517
    Height = 369
    ObjectTypes = [otFolders, otNonFolders]
    Root = 'rfMyComputer'
    ShellTreeView = ShellTreeView1
    Sorted = True
    ReadOnly = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLines = True
    HideSelection = False
    RowSelect = True
    ParentFont = False
    TabOrder = 2
    ViewStyle = vsReport
  end
  object RadioGroup1: TRadioGroup
    Left = 191
    Top = 78
    Width = 189
    Height = 73
    Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1087#1091#1090#1077#1074#1099#1077' '#1083#1080#1089#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      #1055#1086' '#1074#1089#1077#1084' '#1074#1086#1076#1080#1090#1077#1083#1103#1084
      #1055#1086' '#1082#1086#1085#1082#1088#1077#1090#1085#1086#1084#1091' '#1074#1086#1076#1080#1090#1077#1083#1102)
    ParentFont = False
    TabOrder = 3
    OnClick = RadioGroup1Click
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 191
    Top = 157
    Width = 189
    Height = 24
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'N_tab'
    ListField = 'fio'
    ListSource = DM.DS_Vod
    ParentFont = False
    TabOrder = 4
  end
  object LabeledEdit1: TLabeledEdit
    Left = 520
    Top = 86
    Width = 57
    Height = 24
    Alignment = taCenter
    EditLabel.Width = 108
    EditLabel.Height = 16
    EditLabel.Caption = #8470' '#1087#1091#1090#1077#1074#1086#1075#1086' '#1083#1080#1089#1090#1072
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = '1024'
  end
  object ProgressBar1: TProgressBar
    Left = 418
    Top = 148
    Width = 257
    Height = 33
    TabOrder = 6
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 594
    Width = 879
    Height = 19
    Panels = <
      item
        Text = #1064#1072#1073#1083#1086#1085': '
        Width = 1000
      end>
  end
end
