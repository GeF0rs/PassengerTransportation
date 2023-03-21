unit Vod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask,DataModule;

type
  TVodForm = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit3: TMaskEdit;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VodForm: TVodForm;

implementation

uses Main;

{$R *.dfm}

procedure TVodForm.BitBtn1Click(Sender: TObject);
begin
if (Trim(LabeledEdit1.Text)='') or (Trim(LabeledEdit2.Text)='') or (Trim(MaskEdit3.Text)='') or (Trim(MaskEdit1.Text)='')
then
  begin
    ShowMessage('Необходимо заполнить все поля!');
    exit;
  end;
try
  DM.ADOQuery_Vod.Insert;
  DM.ADOQuery_Vod.FieldByName('fio').AsString:=Trim(LabeledEdit1.Text);
  DM.ADOQuery_Vod.FieldByName('nick').AsString:=Trim(LabeledEdit2.Text);
  DM.ADOQuery_Vod.FieldByName('reg_z').AsString:=Trim(MaskEdit3.Text);
  DM.ADOQuery_Vod.FieldByName('vod_yd').AsString:=Trim(MaskEdit1.Text);
  DM.ADOQuery_Vod.Requery;
except
  on E: Exception do
  begin
    ShowMessage('Error: '+E.Message);
    DM.ADOQuery_Vod.Cancel;
  end;
end;
end;

procedure TVodForm.BitBtn2Click(Sender: TObject);
var
p:integer;
begin
if (Trim(LabeledEdit1.Text)='') or (Trim(LabeledEdit2.Text)='') or (Trim(MaskEdit3.Text)='') or (Trim(MaskEdit1.Text)='')
then
  begin
    ShowMessage('Необходимо заполнить все поля!');
    exit;
  end;
try
  DM.ADOQuery_Vod.Edit;
  DM.ADOQuery_Vod.FieldByName('fio').AsString:=Trim(LabeledEdit1.Text);
  DM.ADOQuery_Vod.FieldByName('nick').AsString:=Trim(LabeledEdit2.Text);
  DM.ADOQuery_Vod.FieldByName('reg_z').AsString:=Trim(MaskEdit3.Text);
  DM.ADOQuery_Vod.FieldByName('vod_yd').AsString:=Trim(MaskEdit1.Text);
  p:=DM.ADOQuery_Vod.RecNo;
  DM.ADOQuery_Vod.Requery;
  DM.ADOQuery_Vod.RecNo:=p;
except
  on E: Exception do
  begin
    ShowMessage('Error: '+E.Message);
    DM.ADOQuery_Vod.Cancel;
  end;
end;
end;

procedure TVodForm.BitBtn3Click(Sender: TObject);
var
n:integer;
begin
if DM.ADOQuery_Vod.RecordCount<=0 then exit;
if MessageBox(handle,PChar('Удалить? Будут удалены и все его одометры!'),PChar('Подтвердите'),MB_YESNO+MB_ICONQUESTION)=IDYES then
begin
n:=DM.ADOQuery_Vod.FieldByName('N_tab').AsInteger;
MainForm.SELECT_SQL(DM.ADOQuery_Vod,false,'DELETE FROM Odometry WHERE N_tab_vod='+inttostr(n));
MainForm.SELECT_SQL(DM.ADOQuery_Vod,false,'DELETE FROM Voditeli WHERE N_tab='+inttostr(n));
MainForm.SELECT_SQL(DM.ADOQuery_Vod,'Voditeli');
end;
DBGrid1CellClick(DBGrid1.Columns[0]);
end;

procedure TVodForm.DBGrid1CellClick(Column: TColumn);
begin
if DM.ADOQuery_Vod.RecordCount<=0 then exit;
LabeledEdit1.Text:=DM.ADOQuery_Vod.FieldByName('fio').AsString;
LabeledEdit2.Text:=DM.ADOQuery_Vod.FieldByName('nick').AsString;
MaskEdit3.Text:=DM.ADOQuery_Vod.FieldByName('reg_z').AsString;
MaskEdit1.Text:=DM.ADOQuery_Vod.FieldByName('vod_yd').AsString;
end;

procedure TVodForm.DBGrid1TitleClick(Column: TColumn);
var s:string;
begin
s:=DM.ADOQuery_Vod.Sort;
if pos('ASC',s)<>0 then
DM.ADOQuery_Vod.Sort:=Column.FieldName+' DESC' else
DM.ADOQuery_Vod.Sort:=Column.FieldName+' ASC';
end;

procedure TVodForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if MainForm.JvDBUltimGrid1.DataSource.DataSet.Active then
DM.ADOQuery_Main.Requery;
end;

procedure TVodForm.FormShow(Sender: TObject);
begin
DBGrid1CellClick(DBGrid1.Columns[0]);
end;

end.
