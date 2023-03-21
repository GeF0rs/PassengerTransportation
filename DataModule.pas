unit DataModule;

interface

uses
  SysUtils, Classes, DB, ADODB, Dialogs;

type
  TDM = class(TDataModule)
    ADOC: TADOConnection;
    ADOQuery_MAR: TADOQuery;
    DS_MAR: TDataSource;
    ADOQuery_Main: TADOQuery;
    DS_Main: TDataSource;
    ADOQuery_Vod: TADOQuery;
    DS_Vod: TDataSource;
    ADOQuery_Vodfio: TWideStringField;
    ADOQuery_Vodnick: TWideStringField;
    ADOQuery_Vodrez_z: TWideStringField;
    ADOQuery_Vodvod_yd: TWideStringField;
    ADOQuery_MARMarshryt_dvi: TWideStringField;
    ADOQuery_MARKm: TIntegerField;
    ADOQuery_MARTime: TDateTimeField;
    Query_Work: TADOQuery;
    DS_Work: TDataSource;
    ADOQuery_MARN_mar: TAutoIncField;
    ADOQuery_VodN_tab: TAutoIncField;
    ADOQuery_odom: TADOQuery;
    DS_odom: TDataSource;
    ADOQuery_MARPrice: TIntegerField;
    ADOQuery_odomN_tab_vod: TIntegerField;
    ADOQuery_odomfio: TWideStringField;
    ADOQuery_odomdata_odom: TDateTimeField;
    ADOQuery_odomodom: TWideStringField;
    Query_WorkAll: TADOQuery;
    DS_WorkAll: TDataSource;
    ADOQuery_odomN_odom: TAutoIncField;
    ADOQuery_Reestr: TADOQuery;
    DS_Reestr: TDataSource;
    ADOQuery_MainNreys: TAutoIncField;
    ADOQuery_MainN_mar_reys: TIntegerField;
    ADOQuery_Mainin_or_out: TBooleanField;
    ADOQuery_Mainkol_l: TIntegerField;
    ADOQuery_Mainnick: TWideStringField;
    ADOQuery_MainMarshryt_dvi: TWideStringField;
    ADOQuery_MainN_tab_vod: TIntegerField;
    ADOQuery_MARPriceVod: TIntegerField;
    ADOQuery_Journal: TADOQuery;
    DS_Journal: TDataSource;
    ADOQuery_MainTime_otp: TDateTimeField;
    ADOQuery_Journalid: TAutoIncField;
    ADOQuery_JournalN_pytlist: TIntegerField;
    ADOQuery_Journaldata_pytlist: TDateTimeField;
    ADOQuery_Journalvoditel: TWideStringField;
    ADOQuery_Journalreg_n: TWideStringField;
    ADOQuery_Journaltime_viez: TDateTimeField;
    ADOQuery_Journaltime_vozv: TDateTimeField;
    ADOQuery_Journalprimech: TWideStringField;
    procedure ADOQuery_MainN_mar_reysChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation
uses main;
{$R *.dfm}


procedure TDM.ADOQuery_MainN_mar_reysChange(Sender: TField);
begin
MainForm.DelOtmetki(MainForm.Label4.Caption,DS_Main.DataSet.RecNo,2);
end;

end.
