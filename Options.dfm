object OptionsDlg: TOptionsDlg
  Left = 227
  Top = 108
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 341
  ClientWidth = 454
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 454
    Height = 341
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1099#1077
      object Shape1: TShape
        Left = 243
        Top = 190
        Width = 41
        Height = 29
        Hint = #1057#1077#1081#1095#1072#1089' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '#1101#1090#1086#1090' '#1094#1074#1077#1090
        Brush.Color = clRed
        ParentShowHint = False
        ShowHint = True
      end
      object CheckBox1: TCheckBox
        Left = 48
        Top = 16
        Width = 257
        Height = 17
        Hint = #1056#1072#1079#1074#1086#1088#1072#1095#1080#1074#1072#1090#1100' '#1083#1080' '#1074#1089#1105' '#1076#1077#1088#1077#1074#1086' '#1089' '#1075#1088#1072#1092#1080#1082#1072#1084#1080
        Caption = ' '#1056#1072#1079#1074#1086#1088#1072#1095#1080#1074#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1087#1086#1083#1085#1086#1089#1090#1100#1102
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object CheckBox2: TCheckBox
        Left = 48
        Top = 49
        Width = 217
        Height = 17
        Hint = #1054#1090#1082#1088#1099#1074#1072#1090#1100' '#1083#1080' '#1087#1091#1090#1077#1074#1099#1077' '#1083#1080#1089#1090#1099' '#1087#1086#1089#1083#1077' '#1089#1086#1079#1076#1072#1085#1080#1103
        Caption = ' '#1054#1090#1082#1088#1099#1074#1072#1090#1100' '#1087#1091#1090#1077#1074#1099#1077' '#1083#1080#1089#1090#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object CheckBox3: TCheckBox
        Left = 48
        Top = 80
        Width = 329
        Height = 25
        Hint = #1054#1089#1090#1072#1085#1086#1074#1082#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1087#1091#1090#1077#1074#1086#1082', '#1077#1089#1083#1080' '#1074#1086#1079#1085#1080#1082#1083#1072' '#1086#1096#1080#1073#1082#1072
        Caption = ' '#1054#1089#1090#1072#1085#1072#1074#1083#1080#1074#1072#1090#1100' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1088#1080' '#1086#1096#1080#1073#1082#1072#1093
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object LabeledEdit1: TLabeledEdit
        Left = 243
        Top = 111
        Width = 41
        Height = 26
        Hint = 
          #1044#1083#1080#1085#1072' '#1092#1088#1072#1079#1099' '#1089#1088#1072#1074#1085#1077#1085#1080#1103' '#1074#1083#1080#1103#1077#1090' '#1085#1072' '#1089#1082#1086#1088#1086#1089#1090#1100' '#1089#1088#1072#1074#1085#1080#1074#1072#1085#1080#1103'. '#13#1048#1079#1084#1077#1085#1103#1081' '#1077 +
          #1077' '#1086#1090' 3 '#1080' '#1074#1099#1096#1077
        EditLabel.Width = 173
        EditLabel.Height = 18
        EditLabel.Caption = #1044#1083#1080#1085#1072' '#1092#1088#1072#1079#1099' '#1089#1088#1072#1074#1085#1077#1085#1080#1103':'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -15
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        LabelPosition = lpLeft
        LabelSpacing = 22
        NumbersOnly = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object LabeledEdit2: TLabeledEdit
        Left = 243
        Top = 148
        Width = 41
        Height = 26
        Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1089#1088#1072#1074#1085#1077#1085#1080#1103' '#1084#1077#1085#1100#1096#1077' '#1101#1090#1086#1075#1086' '#1091#1088#1086#1074#1085#1103' '#1073#1091#1076#1091#1090' '#1086#1090#1084#1077#1095#1072#1090#1100#1089#1103
        EditLabel.Width = 182
        EditLabel.Height = 18
        EditLabel.Caption = #1059#1088#1086#1074#1077#1085#1100' '#1085#1072#1095#1072#1083#1072' '#1086#1090#1084#1077#1090#1086#1082': '
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -15
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        LabelPosition = lpLeft
        LabelSpacing = 13
        NumbersOnly = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
      object Button1: TButton
        Left = 48
        Top = 190
        Width = 113
        Height = 29
        Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1094#1074#1077#1090' '#1082#1086#1090#1086#1088#1099#1084' '#1087#1086#1084#1077#1095#1072#1102#1090#1089#1103' '#1089#1090#1088#1086#1082#1080
        Caption = #1062#1074#1077#1090' '#1086#1090#1084#1077#1090#1086#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = Button1Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1087#1072#1088#1086#1083#1103' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072
      ImageIndex = 1
      ExplicitLeft = 8
      ExplicitTop = 28
      ExplicitWidth = 0
      ExplicitHeight = 0
      object PWord1: TLabeledEdit
        Left = 99
        Top = 63
        Width = 238
        Height = 26
        Alignment = taCenter
        EditLabel.Width = 180
        EditLabel.Height = 18
        EditLabel.Caption = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1091#1097#1080#1081' '#1087#1072#1088#1086#1083#1100':'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -15
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        LabelSpacing = 10
        ParentFont = False
        ParentShowHint = False
        PasswordChar = '*'
        ShowHint = False
        TabOrder = 0
      end
      object PWord2: TLabeledEdit
        Left = 99
        Top = 143
        Width = 238
        Height = 26
        Alignment = taCenter
        EditLabel.Width = 162
        EditLabel.Height = 18
        EditLabel.Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1074#1099#1081' '#1087#1072#1088#1086#1083#1100':'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -15
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        LabelSpacing = 10
        ParentFont = False
        ParentShowHint = False
        PasswordChar = '*'
        ShowHint = False
        TabOrder = 1
      end
      object CheckBox4: TCheckBox
        Left = 343
        Top = 67
        Width = 34
        Height = 17
        Caption = '*'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        State = cbChecked
        TabOrder = 2
        OnClick = CheckBox4Click
      end
      object CheckBox5: TCheckBox
        Left = 343
        Top = 147
        Width = 34
        Height = 17
        Caption = '*'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        State = cbChecked
        TabOrder = 3
        OnClick = CheckBox5Click
      end
      object Button2: TButton
        Left = 160
        Top = 200
        Width = 121
        Height = 33
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = Button2Click
      end
    end
  end
  object OKBtn: TButton
    Left = 123
    Top = 299
    Width = 75
    Height = 25
    Caption = #1054#1050
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 1
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 247
    Top = 299
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 2
  end
  object ColorOtmetki: TColorDialog
    Color = clRed
    Options = [cdFullOpen]
    Left = 400
    Top = 24
  end
end
