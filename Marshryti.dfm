object MarForm: TMarForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1052#1072#1088#1096#1088#1091#1090#1099
  ClientHeight = 625
  ClientWidth = 1159
  Color = clBtnFace
  Constraints.MaxWidth = 1200
  Constraints.MinWidth = 1029
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1159
    Height = 492
    Align = alClient
    BorderStyle = bsNone
    DataSource = DM.DS_MAR
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
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'N_mar'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Marshryt_dvi'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 657
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Km'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 79
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Time'
        Title.Alignment = taCenter
        Title.Caption = #1042#1088#1077#1084#1103' ('#1095':'#1084')'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price'
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100', '#1088#1091#1073
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 115
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PriceVod'
        Title.Alignment = taCenter
        Title.Caption = #1054#1087#1083#1072#1090#1072' '#1074#1086#1076#1080#1090#1077#1083#1102', '#1088#1091#1073
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 164
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 492
    Width = 1159
    Height = 133
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 498
    object Label1: TLabel
      Left = 774
      Top = 9
      Width = 81
      Height = 19
      Caption = #1042#1088#1077#1084#1103'('#1095':'#1084')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object MaskEdit3: TMaskEdit
      Left = 767
      Top = 32
      Width = 94
      Height = 27
      Alignment = taCenter
      EditMask = '!00:00;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 2
      Text = '  :  '
    end
    object LabeledEdit1: TLabeledEdit
      Left = 8
      Top = 32
      Width = 665
      Height = 27
      Alignment = taCenter
      EditLabel.Width = 143
      EditLabel.Height = 19
      EditLabel.BiDiMode = bdLeftToRight
      EditLabel.Caption = #1052#1072#1088#1096#1088#1091#1090' '#1076#1074#1080#1078#1077#1085#1080#1103
      EditLabel.Font.Charset = RUSSIAN_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -16
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentBiDiMode = False
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object LabeledEdit2: TLabeledEdit
      Left = 679
      Top = 32
      Width = 82
      Height = 27
      Alignment = taCenter
      EditLabel.Width = 20
      EditLabel.Height = 19
      EditLabel.Caption = #1050#1084
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -16
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 200
      Top = 73
      Width = 129
      Height = 34
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 367
      Top = 73
      Width = 122
      Height = 34
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 1006
      Top = 73
      Width = 135
      Height = 34
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = BitBtn3Click
    end
    object LabeledEdit3: TLabeledEdit
      Left = 867
      Top = 32
      Width = 134
      Height = 27
      Alignment = taCenter
      EditLabel.Width = 114
      EditLabel.Height = 19
      EditLabel.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100', '#1088#1091#1073
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -16
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 3
    end
    object LabeledEdit4: TLabeledEdit
      Left = 1007
      Top = 32
      Width = 134
      Height = 27
      Alignment = taCenter
      EditLabel.Width = 131
      EditLabel.Height = 19
      EditLabel.Caption = #1054#1087#1083#1072#1090#1072' '#1074#1086#1076#1080#1090#1077#1083#1102
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -16
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 4
    end
  end
end
