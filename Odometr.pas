unit Odometr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,DataModule, StdCtrls, dblookup, DBCtrls, ExtCtrls,
  ComCtrls, Buttons,ADODB;

type
  TOdomForm = class(TForm)
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel1: TPanel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    LabeledEdit1: TLabeledEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OdomForm: TOdomForm;

implementation

uses Main;

{$R *.dfm}

procedure TOdomForm.BitBtn1Click(Sender: TObject);
begin
if (Trim(LabeledEdit1.Text)='') or (Trim(DBLookupComboBox1.Text)='') then
  begin
    ShowMessage('Необходимо заполнить все поля!');
    exit;
  end;
try
  DM.ADOQuery_odom.Insert;
  DM.ADOQuery_odom.FieldValues['N_tab_vod']:=DBLookupComboBox1.KeyValue;
  DM.ADOQuery_odom.FieldValues['data_odom']:=Trunc(DateTimePicker1.Date);
  DM.ADOQuery_odom.FieldValues['odom']:=StrToInt(Trim(LabeledEdit1.Text));
  DM.ADOQuery_odom.Requery;
except
  on E: Exception do
  begin
    ShowMessage('Error: '+E.Message);
    DM.ADOQuery_odom.Cancel;
  end;
end;
end;

procedure TOdomForm.BitBtn2Click(Sender: TObject);
var
p:integer;
begin
if (Trim(LabeledEdit1.Text)='') or (Trim(DBLookupComboBox1.Text)='') then
  begin
    ShowMessage('Необходимо заполнить все поля!');
    exit;
  end;
try
  DM.ADOQuery_odom.Edit;
  DM.ADOQuery_odom.FieldValues['N_tab_vod']:=DBLookupComboBox1.KeyValue;
  DM.ADOQuery_odom.FieldValues['data_odom']:=Trunc(DateTimePicker1.Date);
  DM.ADOQuery_odom.FieldValues['odom']:=StrToInt(Trim(LabeledEdit1.Text));
  p:=DM.ADOQuery_odom.RecNo;
  DM.ADOQuery_odom.Requery;
  DM.ADOQuery_odom.RecNo:=p;
except
  on E: Exception do
  begin
    ShowMessage('Error: '+E.Message);
    DM.ADOQuery_odom.Cancel;
  end;
end;
end;

procedure TOdomForm.BitBtn3Click(Sender: TObject);
var
n:integer;
begin
if DM.ADOQuery_odom.RecordCount<=0 then exit;
if MessageBox(handle,PChar('Удалить?'),PChar('Подтвердите'),MB_YESNO+MB_ICONQUESTION)=IDYES then
begin
N:=DM.ADOQuery_odom.FieldByName('N_odom').AsInteger;
MainForm.SELECT_SQL(DM.ADOQuery_odom,false,'DELETE FROM Odometry WHERE N_odom='+inttostr(N));
MainForm.SELECT_SQL(DM.ADOQuery_odom,true,'SELECT N_odom, N_tab_vod, fio, data_odom, odom FROM Voditeli, Odometry WHERE Voditeli.N_tab=Odometry.N_tab_vod',true,'data_odom','DESC');
end;
DBGrid1CellClick(DBGrid1.Columns[2]);
end;

procedure TOdomForm.DBGrid1CellClick(Column: TColumn);
begin
if DM.ADOQuery_odom.RecordCount<=0 then exit;
DBLookupComboBox1.KeyValue:=DM.ADOQuery_odom.FieldByName('N_tab_vod').AsInteger;
DateTimePicker1.Date:=DM.ADOQuery_odom.FieldByName('data_odom').AsDateTime;
LabeledEdit1.Text:=DM.ADOQuery_odom.FieldByName('odom').AsString;
end;

procedure TOdomForm.DBGrid1TitleClick(Column: TColumn);
var
s:string;
begin
s:=DM.ADOQuery_odom.Sort;
if pos('ASC',s)<>0 then
DM.ADOQuery_odom.Sort:=Column.FieldName+' DESC' else
DM.ADOQuery_odom.Sort:=Column.FieldName+' ASC';
end;

procedure TOdomForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DM.ADOQuery_odom.Close;
end;

procedure TOdomForm.FormShow(Sender: TObject);
begin
DBGrid1CellClick(DBGrid1.Columns[0]);
end;

end.
