unit Marshryti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Mask,DataModule, Buttons;

type
  TMarForm = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit3: TMaskEdit;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MarForm: TMarForm;

implementation

uses Main;

{$R *.dfm}

procedure TMarForm.BitBtn1Click(Sender: TObject);
begin
if (Trim(LabeledEdit1.Text)='') or (Trim(LabeledEdit2.Text)='') or (Trim(MaskEdit3.Text)='') or (Trim(LabeledEdit3.Text)='') then
  begin
    ShowMessage('Необходимо заполнить все поля!');
    exit;
  end;
try
  DM.ADOQuery_MAR.Insert;
  DM.ADOQuery_MAR.FieldByName('Marshryt_dvi').AsString:=Trim(LabeledEdit1.Text);
  DM.ADOQuery_MAR.FieldByName('Km').AsInteger:=StrToint(Trim(LabeledEdit2.Text));
  DM.ADOQuery_MAR.FieldByName('Time').AsDateTime:=StrToTime(Trim(MaskEdit3.Text));
  DM.ADOQuery_MAR.FieldByName('Price').AsInteger:=StrToint(Trim(LabeledEdit3.Text));
  DM.ADOQuery_MAR.FieldByName('PriceVod').AsInteger:=StrToint(Trim(LabeledEdit4.Text));
  DM.ADOQuery_MAR.Next;
except
  on E: Exception do
  begin
    ShowMessage('Error: '+E.Message);
    DM.ADOQuery_MAR.Cancel;
  end;
end;

end;

procedure TMarForm.BitBtn2Click(Sender: TObject);
var
p:integer;
begin
if (Trim(LabeledEdit1.Text)='') or (Trim(LabeledEdit2.Text)='') or (Trim(MaskEdit3.Text)='') or (Trim(LabeledEdit3.Text)='') then
  begin
    ShowMessage('Необходимо заполнить все поля!');
    exit;
  end;
try
  DM.ADOQuery_MAR.Edit;
  DM.ADOQuery_MAR.FieldByName('Marshryt_dvi').AsString:=Trim(LabeledEdit1.Text);
  DM.ADOQuery_MAR.FieldByName('Km').AsInteger:=StrToint(Trim(LabeledEdit2.Text));
  DM.ADOQuery_MAR.FieldByName('Time').AsDateTime:=StrToTime(Trim(MaskEdit3.Text));
  DM.ADOQuery_MAR.FieldByName('Price').AsInteger:=StrToint(Trim(LabeledEdit3.Text));
  DM.ADOQuery_MAR.FieldByName('PriceVod').AsInteger:=StrToint(Trim(LabeledEdit4.Text));
  p:=DM.ADOQuery_MAR.RecNo;
  DM.ADOQuery_MAR.Requery;
  DM.ADOQuery_MAR.RecNo:=p;
except
  on E: Exception do
  begin
    ShowMessage('Error: '+E.Message);
    DM.ADOQuery_MAR.Cancel;
  end;
end;
end;

procedure TMarForm.BitBtn3Click(Sender: TObject);
begin
if DM.ADOQuery_MAR.RecordCount<=0 then exit;
if MessageBox(handle,PChar('Удалить?'),PChar('Подтвердите'),MB_YESNO+MB_ICONQUESTION)=IDYES then
begin
DM.ADOQuery_MAR.Delete;
end;
DBGrid1CellClick(DBGrid1.Columns[0]);
end;

procedure TMarForm.DBGrid1CellClick(Column: TColumn);
begin
if DM.ADOQuery_MAR.RecordCount<=0 then exit;
LabeledEdit1.Text:=DM.ADOQuery_MAR.FieldByName('Marshryt_dvi').AsString;
LabeledEdit2.Text:=IntToStr(DM.ADOQuery_MAR.FieldByName('Km').AsInteger);
LabeledEdit3.Text:=CurrToStr(DM.ADOQuery_MAR.FieldByName('Price').AsInteger);
LabeledEdit4.Text:=CurrToStr(DM.ADOQuery_MAR.FieldByName('PriceVod').AsInteger);
MaskEdit3.Text:=FormatDateTime('hh:nn',DM.ADOQuery_MAR.FieldByName('Time').AsDateTime);
end;

procedure TMarForm.DBGrid1TitleClick(Column: TColumn);
var s:string;
begin
s:=DM.ADOQuery_MAR.Sort;
if pos('ASC',s)<>0 then
DM.ADOQuery_MAR.Sort:=Column.FieldName+' DESC' else
DM.ADOQuery_MAR.Sort:=Column.FieldName+' ASC';
end;

procedure TMarForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if MainForm.JvDBUltimGrid1.DataSource.DataSet.Active then
DM.ADOQuery_Main.Requery;
end;

procedure TMarForm.FormShow(Sender: TObject);
begin
DBGrid1CellClick(DBGrid1.Columns[0]);
end;

end.
