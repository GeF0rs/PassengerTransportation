object OdomForm: TOdomForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1054#1076#1086#1084#1077#1090#1088#1099
  ClientHeight = 641
  ClientWidth = 587
  Color = clBtnFace
  Constraints.MaxWidth = 685
  Constraints.MinWidth = 603
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 520
    Width = 587
    Height = 121
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      587
      121)
    object Label1: TLabel
      Left = 84
      Top = 9
      Width = 50
      Height = 19
      Caption = #1060'.'#1048'.'#1054'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 266
      Top = 9
      Width = 110
      Height = 19
      Caption = #1044#1072#1090#1072' '#1086#1076#1086#1084#1077#1090#1088#1072
    end
    object DateTimePicker1: TDateTimePicker
      Left = 250
      Top = 34
      Width = 143
      Height = 27
      Date = 42145.567318206020000000
      Time = 42145.567318206020000000
      TabOrder = 1
    end
    object LabeledEdit1: TLabeledEdit
      Left = 440
      Top = 34
      Width = 121
      Height = 27
      Alignment = taCenter
      EditLabel.Width = 65
      EditLabel.Height = 19
      EditLabel.Caption = #1054#1076#1086#1084#1077#1090#1088
      LabelSpacing = 5
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 134
      Top = 75
      Width = 106
      Height = 33
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 258
      Top = 75
      Width = 106
      Height = 33
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 464
      Top = 75
      Width = 97
      Height = 33
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn3Click
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 24
      Top = 34
      Width = 193
      Height = 27
      Anchors = [akLeft, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'N_tab'
      ListField = 'fio'
      ListSource = DM.DS_Vod
      ParentFont = False
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 587
    Height = 520
    Align = alClient
    DataSource = DM.DS_odom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'N_tab_vod'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'fio'
        Title.Alignment = taCenter
        Width = 195
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_odom'
        Title.Alignment = taCenter
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'odom'
        Title.Alignment = taCenter
        Width = 169
        Visible = True
      end>
  end
end
