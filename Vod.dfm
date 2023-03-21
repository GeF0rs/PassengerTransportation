object VodForm: TVodForm
  Left = 0
  Top = 0
  Caption = #1042#1086#1076#1080#1090#1077#1083#1080
  ClientHeight = 608
  ClientWidth = 827
  Color = clBtnFace
  Constraints.MaxWidth = 923
  Constraints.MinWidth = 843
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
    Width = 827
    Height = 482
    Align = alClient
    BiDiMode = bdLeftToRight
    BorderStyle = bsNone
    DataSource = DM.DS_Vod
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'N_tab'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'fio'
        Title.Alignment = taCenter
        Width = 181
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nick'
        Title.Alignment = taCenter
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reg_z'
        Title.Alignment = taCenter
        Width = 197
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vod_yd'
        Title.Alignment = taCenter
        Width = 261
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 482
    Width = 827
    Height = 126
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 416
      Top = 8
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
    object Label2: TLabel
      Left = 628
      Top = 9
      Width = 169
      Height = 19
      Caption = #8470' '#1042#1086#1076'. '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object MaskEdit3: TMaskEdit
      Left = 413
      Top = 33
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
      TabOrder = 2
      Text = '         -    '
    end
    object LabeledEdit1: TLabeledEdit
      Left = 15
      Top = 33
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
      TabOrder = 0
    end
    object LabeledEdit2: TLabeledEdit
      Left = 218
      Top = 33
      Width = 162
      Height = 27
      Alignment = taCenter
      EditLabel.Width = 140
      EditLabel.Height = 19
      EditLabel.Caption = #1054#1073#1086#1079#1085#1072#1095#1077#1085#1080#1077' ('#1085#1080#1082')'
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
      ParentFont = False
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 226
      Top = 73
      Width = 127
      Height = 34
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      DoubleBuffered = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 403
      Top = 73
      Width = 118
      Height = 34
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 699
      Top = 73
      Width = 109
      Height = 34
      Caption = #1059#1076#1072#1083#1080#1090#1100
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 6
      OnClick = BitBtn3Click
    end
    object MaskEdit1: TMaskEdit
      Left = 619
      Top = 33
      Width = 189
      Height = 27
      Alignment = taCenter
      EditMask = '!>00 AA 000000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 12
      ParentFont = False
      TabOrder = 3
      Text = '            '
    end
  end
end
