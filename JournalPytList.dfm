object JournalPytListForm: TJournalPytListForm
  Left = 0
  Top = 0
  Caption = #1046#1091#1088#1085#1072#1083' '#1091#1095#1077#1090#1072' '#1087#1091#1090#1077#1074#1099#1093' '#1083#1080#1089#1090#1086#1074
  ClientHeight = 648
  ClientWidth = 1108
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 440
    Width = 1108
    Height = 189
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 150
      Top = 9
      Width = 154
      Height = 19
      Caption = #1044#1072#1090#1072' '#1074#1099#1076'. '#1087#1091#1090'. '#1083#1080#1089#1090#1072
    end
    object Label3: TLabel
      Left = 502
      Top = 9
      Width = 167
      Height = 19
      Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#1079#1085#1072#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 682
      Top = 9
      Width = 100
      Height = 19
      Caption = #1042#1088#1077#1084#1103' '#1074#1099#1077#1079#1076#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 794
      Top = 9
      Width = 86
      Height = 19
      Caption = #1042#1088#1077#1084#1103' '#1074#1086#1079#1074'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DateTimePicker1: TDateTimePicker
      Left = 150
      Top = 34
      Width = 154
      Height = 27
      Date = 42145.567318206020000000
      Time = 42145.567318206020000000
      TabOrder = 1
    end
    object LabeledEdit1: TLabeledEdit
      Left = 23
      Top = 34
      Width = 121
      Height = 27
      Alignment = taCenter
      EditLabel.Width = 99
      EditLabel.Height = 19
      EditLabel.Caption = #8470' '#1087#1091#1090'. '#1083#1080#1089#1090#1072
      LabelSpacing = 5
      NumbersOnly = True
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 462
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
      TabOrder = 7
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 634
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
      TabOrder = 8
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 983
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
      TabOrder = 9
      OnClick = BitBtn3Click
    end
    object MaskEdit3: TMaskEdit
      Left = 502
      Top = 34
      Width = 174
      Height = 27
      Alignment = taCenter
      EditMask = '>L 000 LL - 009;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 3
      Text = '         -    '
    end
    object MaskEdit1: TMaskEdit
      Left = 682
      Top = 34
      Width = 100
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
      TabOrder = 4
      Text = '  :  '
    end
    object LabeledEdit2: TLabeledEdit
      Left = 310
      Top = 34
      Width = 186
      Height = 27
      Alignment = taCenter
      EditLabel.Width = 124
      EditLabel.Height = 19
      EditLabel.BiDiMode = bdLeftToRight
      EditLabel.Caption = #1060'.'#1048'.'#1054'. '#1042#1086#1076#1080#1090#1077#1083#1103
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
      TabOrder = 2
    end
    object MaskEdit2: TMaskEdit
      Left = 788
      Top = 34
      Width = 100
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
      TabOrder = 5
      Text = '  :  '
    end
    object LabeledEdit3: TLabeledEdit
      Left = 894
      Top = 34
      Width = 186
      Height = 27
      Alignment = taCenter
      EditLabel.Width = 90
      EditLabel.Height = 19
      EditLabel.BiDiMode = bdLeftToRight
      EditLabel.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
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
      TabOrder = 6
    end
    object RadioGroup1: TRadioGroup
      Left = 23
      Top = 75
      Width = 394
      Height = 108
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1086#1090#1095#1077#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        #1047#1072' '#1074#1077#1089#1100' '#1087#1077#1088#1080#1086#1076
        #1047#1072' '#1087#1077#1088#1080#1086#1076':')
      ParentFont = False
      TabOrder = 10
      OnClick = RadioGroup1Click
    end
    object BitBtn4: TBitBtn
      Left = 212
      Top = 94
      Width = 178
      Height = 35
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090'-'#1078#1091#1088#1085#1072#1083
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnClick = BitBtn4Click
    end
    object DateTimePicker2: TDateTimePicker
      Left = 138
      Top = 146
      Width = 119
      Height = 27
      Date = 42145.567318206020000000
      Time = 42145.567318206020000000
      Enabled = False
      TabOrder = 12
    end
    object DateTimePicker3: TDateTimePicker
      Left = 271
      Top = 146
      Width = 119
      Height = 27
      Date = 42145.567318206020000000
      Time = 42145.567318206020000000
      Enabled = False
      TabOrder = 13
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 629
    Width = 1108
    Height = 19
    Panels = <
      item
        Text = #1055#1072#1087#1082#1072' '#1076#1083#1103' '#1086#1090#1095#1077#1090#1072'-'#1078#1091#1088#1085#1072#1083#1072': '
        Width = 50
      end>
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1108
    Height = 440
    Align = alClient
    DataSource = DM.DS_Journal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
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
        FieldName = 'N_pytlist'
        Title.Caption = #8470' '#1087#1091#1090#1077#1074#1086#1075#1086' '#1083#1080#1089#1090#1072
        Width = 133
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'data_pytlist'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080' '#1087#1091#1090'. '#1083#1080#1089#1090#1072
        Width = 173
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'voditel'
        Title.Alignment = taCenter
        Title.Caption = #1060'.'#1048'.'#1054'. '#1042#1086#1076#1080#1090#1077#1083#1103
        Width = 176
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'reg_n'
        Title.Alignment = taCenter
        Title.Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#1079#1085#1072#1082
        Width = 165
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'time_viez'
        Title.Alignment = taCenter
        Title.Caption = #1042#1088#1077#1084#1103' '#1074#1099#1077#1079#1076#1072
        Width = 113
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'time_vozv'
        Title.Alignment = taCenter
        Title.Caption = #1042#1088#1077#1084#1103' '#1074#1086#1079#1074#1088#1072#1090#1072
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'primech'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Visible = True
      end>
  end
end
