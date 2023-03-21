object DM: TDM
  OldCreateOrder = False
  Height = 457
  Width = 306
  object ADOC: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=BD\mjdb.mdb;Persist' +
      ' Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 8
    Top = 8
  end
  object ADOQuery_MAR: TADOQuery
    Connection = ADOC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Marshryti')
    Left = 88
    Top = 8
    object ADOQuery_MARN_mar: TAutoIncField
      FieldName = 'N_mar'
      ReadOnly = True
    end
    object ADOQuery_MARMarshryt_dvi: TWideStringField
      DisplayLabel = #1052#1072#1088#1096#1088#1091#1090
      FieldName = 'Marshryt_dvi'
      Size = 255
    end
    object ADOQuery_MARKm: TIntegerField
      DisplayLabel = #1050#1084
      FieldName = 'Km'
    end
    object ADOQuery_MARTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103'/'#1095
      FieldName = 'Time'
      DisplayFormat = 'hh:nn'
    end
    object ADOQuery_MARPrice: TIntegerField
      Alignment = taCenter
      DisplayLabel = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      FieldName = 'Price'
    end
    object ADOQuery_MARPriceVod: TIntegerField
      FieldName = 'PriceVod'
    end
  end
  object DS_MAR: TDataSource
    DataSet = ADOQuery_MAR
    Left = 192
    Top = 8
  end
  object ADOQuery_Main: TADOQuery
    Connection = ADOC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM 01_04_2015')
    Left = 88
    Top = 72
    object ADOQuery_MainNreys: TAutoIncField
      DisplayWidth = 6
      FieldName = 'Nreys'
      ReadOnly = True
    end
    object ADOQuery_Mainnick: TWideStringField
      FieldKind = fkLookup
      FieldName = 'nick'
      LookupDataSet = ADOQuery_Vod
      LookupKeyFields = 'N_tab'
      LookupResultField = 'nick'
      KeyFields = 'N_tab_vod'
      Lookup = True
    end
    object ADOQuery_MainMarshryt_dvi: TWideStringField
      FieldKind = fkLookup
      FieldName = 'Marshryt_dvi'
      LookupDataSet = ADOQuery_MAR
      LookupKeyFields = 'N_mar'
      LookupResultField = 'Marshryt_dvi'
      KeyFields = 'N_mar_reys'
      Size = 0
      Lookup = True
    end
    object ADOQuery_MainN_mar_reys: TIntegerField
      FieldName = 'N_mar_reys'
      Visible = False
      OnChange = ADOQuery_MainN_mar_reysChange
    end
    object ADOQuery_MainN_tab_vod: TIntegerField
      FieldName = 'N_tab_vod'
      Visible = False
    end
    object ADOQuery_MainTime_otp: TDateTimeField
      FieldName = 'Time_otp'
      DisplayFormat = 'hh:mm'
    end
    object ADOQuery_Mainin_or_out: TBooleanField
      FieldName = 'in_or_out'
    end
    object ADOQuery_Mainkol_l: TIntegerField
      FieldName = 'kol_l'
    end
  end
  object DS_Main: TDataSource
    DataSet = ADOQuery_Main
    Left = 192
    Top = 72
  end
  object ADOQuery_Vod: TADOQuery
    Connection = ADOC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Voditeli')
    Left = 88
    Top = 128
    object ADOQuery_VodN_tab: TAutoIncField
      FieldName = 'N_tab'
      ReadOnly = True
    end
    object ADOQuery_Vodfio: TWideStringField
      DisplayLabel = #1060'.'#1048'.'#1054'.'
      FieldName = 'fio'
      Size = 255
    end
    object ADOQuery_Vodnick: TWideStringField
      Alignment = taCenter
      DisplayLabel = #1053#1080#1082
      FieldName = 'nick'
      Size = 255
    end
    object ADOQuery_Vodrez_z: TWideStringField
      Alignment = taCenter
      DisplayLabel = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#1079#1085#1072#1082
      FieldName = 'reg_z'
      Size = 255
    end
    object ADOQuery_Vodvod_yd: TWideStringField
      Alignment = taCenter
      DisplayLabel = #8470' '#1042#1086#1076#1080#1090#1077#1083#1100#1089#1082#1086#1075#1086' '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1077#1085#1080#1103
      FieldName = 'vod_yd'
      Size = 255
    end
  end
  object DS_Vod: TDataSource
    DataSet = ADOQuery_Vod
    Left = 192
    Top = 128
  end
  object Query_Work: TADOQuery
    Connection = ADOC
    CursorType = ctStatic
    Parameters = <>
    Left = 88
    Top = 360
  end
  object DS_Work: TDataSource
    DataSet = Query_Work
    Left = 192
    Top = 360
  end
  object ADOQuery_odom: TADOQuery
    Connection = ADOC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT N_odom, N_tab_vod, fio, data_odom, odom FROM Voditeli, Od' +
        'ometry WHERE Voditeli.N_tab=Odometry.N_tab_vod')
    Left = 88
    Top = 192
    object ADOQuery_odomN_odom: TAutoIncField
      FieldName = 'N_odom'
      ReadOnly = True
    end
    object ADOQuery_odomN_tab_vod: TIntegerField
      FieldName = 'N_tab_vod'
    end
    object ADOQuery_odomfio: TWideStringField
      DisplayLabel = #1060'.'#1048'.'#1054'.'
      FieldName = 'fio'
      Size = 255
    end
    object ADOQuery_odomdata_odom: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1076#1086#1084#1077#1090#1088#1072
      FieldName = 'data_odom'
    end
    object ADOQuery_odomodom: TWideStringField
      DisplayLabel = #1054#1076#1086#1084#1077#1090#1088
      FieldName = 'odom'
      Size = 255
    end
  end
  object DS_odom: TDataSource
    DataSet = ADOQuery_odom
    Left = 192
    Top = 192
  end
  object Query_WorkAll: TADOQuery
    Connection = ADOC
    Parameters = <>
    Left = 88
    Top = 408
  end
  object DS_WorkAll: TDataSource
    DataSet = Query_WorkAll
    Left = 192
    Top = 408
  end
  object ADOQuery_Reestr: TADOQuery
    Connection = ADOC
    Parameters = <>
    Left = 88
    Top = 304
  end
  object DS_Reestr: TDataSource
    DataSet = ADOQuery_Reestr
    Left = 192
    Top = 304
  end
  object ADOQuery_Journal: TADOQuery
    Connection = ADOC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * From JournalPytList')
    Left = 88
    Top = 248
    object ADOQuery_Journalid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ADOQuery_JournalN_pytlist: TIntegerField
      FieldName = 'N_pytlist'
    end
    object ADOQuery_Journaldata_pytlist: TDateTimeField
      FieldName = 'data_pytlist'
    end
    object ADOQuery_Journalvoditel: TWideStringField
      FieldName = 'voditel'
      Size = 255
    end
    object ADOQuery_Journalreg_n: TWideStringField
      FieldName = 'reg_n'
      Size = 255
    end
    object ADOQuery_Journaltime_viez: TDateTimeField
      FieldName = 'time_viez'
      DisplayFormat = 'hh:nn'
    end
    object ADOQuery_Journaltime_vozv: TDateTimeField
      FieldName = 'time_vozv'
      DisplayFormat = 'hh:nn'
    end
    object ADOQuery_Journalprimech: TWideStringField
      FieldName = 'primech'
      Size = 255
    end
  end
  object DS_Journal: TDataSource
    DataSet = ADOQuery_Journal
    Left = 192
    Top = 248
  end
end
