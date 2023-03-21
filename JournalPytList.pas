unit JournalPytList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DataModule, Mask, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids,
  DBGrids,comobj,ShellApi;

type
  TJournalPytListForm = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    LabeledEdit1: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    MaskEdit3: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    MaskEdit1: TMaskEdit;
    LabeledEdit2: TLabeledEdit;
    Label1: TLabel;
    MaskEdit2: TMaskEdit;
    LabeledEdit3: TLabeledEdit;
    StatusBar1: TStatusBar;
    RadioGroup1: TRadioGroup;
    BitBtn4: TBitBtn;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn3Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    function FillingWordDoc(var WdApp: variant; const NameDoc,Mindate,Maxdate: string): boolean;
  public
    { Public declarations }
  end;

const
  JournalPath='Files\Журналы_учета_путевых_листов\';
  ShablonPath='Files\Шаблоны\Журнал_уч_пут_листов.dot';
var
  JournalPytListForm: TJournalPytListForm;

implementation
uses main,PytList;
{$R *.dfm}

procedure TJournalPytListForm.BitBtn1Click(Sender: TObject);
begin
if (Trim(LabeledEdit1.Text)='') or (Trim(LabeledEdit2.Text)='')
or (Trim(MaskEdit1.Text)='') or (Trim(MaskEdit2.Text)='') or (Trim(MaskEdit3.Text)='') then
  begin
    ShowMessage('Необходимо заполнить все поля!');
    exit;
  end;
try
  DM.ADOQuery_Journal.Insert;
  DM.ADOQuery_Journal.FieldValues['N_pytlist']:=Trim(LabeledEdit1.Text);
  DM.ADOQuery_Journal.FieldValues['data_pytlist']:=Trunc(DateTimePicker1.Date);
  DM.ADOQuery_Journal.FieldValues['voditel']:=Trim(LabeledEdit2.Text);
  DM.ADOQuery_Journal.FieldValues['reg_n']:=Trim(MaskEdit3.Text);
  DM.ADOQuery_Journal.FieldValues['time_viez']:=StrToTime(Trim(MaskEdit1.Text));
  DM.ADOQuery_Journal.FieldValues['time_vozv']:=StrToTime(Trim(MaskEdit2.Text));
  DM.ADOQuery_Journal.FieldValues['primech']:=Trim(LabeledEdit3.Text);
  DM.ADOQuery_Journal.Next;
except
  on E: Exception do
  begin
    ShowMessage('Error: '+E.Message);
    DM.ADOQuery_Journal.Cancel;
  end;
end;
end;

procedure TJournalPytListForm.BitBtn2Click(Sender: TObject);
var p: integer;
begin
if (Trim(LabeledEdit1.Text)='') or (Trim(LabeledEdit2.Text)='')
or (Trim(MaskEdit1.Text)='') or (Trim(MaskEdit2.Text)='') or (Trim(MaskEdit3.Text)='') then
  begin
    ShowMessage('Необходимо заполнить все поля!');
    exit;
  end;
try
  DM.ADOQuery_Journal.Edit;
  DM.ADOQuery_Journal.FieldValues['N_pytlist']:=Trim(LabeledEdit1.Text);
  DM.ADOQuery_Journal.FieldValues['data_pytlist']:=Trunc(DateTimePicker1.Date);
  DM.ADOQuery_Journal.FieldValues['voditel']:=Trim(LabeledEdit2.Text);
  DM.ADOQuery_Journal.FieldValues['reg_n']:=Trim(MaskEdit3.Text);
  DM.ADOQuery_Journal.FieldValues['time_viez']:=StrToTime(Trim(MaskEdit1.Text));
  DM.ADOQuery_Journal.FieldValues['time_vozv']:=StrToTime(Trim(MaskEdit2.Text));
  DM.ADOQuery_Journal.FieldValues['primech']:=Trim(LabeledEdit3.Text);
  p:=DM.ADOQuery_Journal.RecNo;
  DM.ADOQuery_Journal.Requery;
  DM.ADOQuery_Journal.RecNo:=p;
except
  on E: Exception do
  begin
    ShowMessage('Error: '+E.Message);
    DM.ADOQuery_Journal.Cancel;
  end;
end;
end;

procedure TJournalPytListForm.BitBtn3Click(Sender: TObject);
begin
if DM.ADOQuery_Journal.RecordCount<=0 then exit;
if MessageBox(handle,PChar('Удалить?'),PChar('Подтвердите'),MB_YESNO+MB_ICONQUESTION)=IDYES then
DM.ADOQuery_Journal.Delete;
DBGrid1CellClick(DBGrid1.Columns[0]);
end;

procedure TJournalPytListForm.BitBtn4Click(Sender: TObject);
var
Mindate,Maxdate: string;
WdApp: variant;
begin
if not PListForm.OpenShablonWord(WdApp,ProgPath+ShablonPath) then begin ShowMessage('Ошибка при загрузке шаблона!'); exit; end;
if RadioGroup1.ItemIndex=0 then
  begin
    DM.Query_Work.SQL.Text:='SELECT MIN(data_pytlist) as Mind,MAX(data_pytlist) as Maxd FROM JournalPytList';
    DM.Query_Work.Open;
    Mindate:=DM.Query_Work.FieldValues['Mind'];
    Maxdate:=DM.Query_Work.FieldValues['Maxd'];
    DM.Query_Work.SQL.Text:='SELECT N_pytlist,data_pytlist,voditel,reg_n,time_viez,time_vozv,primech FROM JournalPytList order by N_pytlist';
  end
    else
      begin
        Mindate:=FormatDateTime('dd.mm.yyyy',DateTimePicker2.Date);
        Maxdate:=FormatDateTime('dd.mm.yyyy',DateTimePicker3.Date);
        DM.Query_Work.SQL.Text:='SELECT N_pytlist,data_pytlist,voditel,reg_n,time_viez,time_vozv,primech FROM JournalPytList where data_pytlist BETWEEN :Mindate and :Maxdate order by N_pytlist';
        DM.Query_Work.Parameters.ParamByName('Mindate').Value:=Mindate;
        DM.Query_Work.Parameters.ParamByName('Maxdate').Value:=Maxdate;
      end;
  DM.Query_Work.Open;
  if FillingWordDoc(WdApp,ProgPath+JournalPath+'Журнал_уч_пут_листов с '+Mindate+' по '+Maxdate+'.doc',Mindate,Maxdate) then
  if MessageBox(handle,PChar('Экспорт завершен успешно! Открыть созданный документ?'),PChar('Подтвердите'),MB_YESNO+MB_ICONQUESTION)=IDYES
  then shellexecute(Handle, 'open',PChar(ProgPath+JournalPath+'Журнал_уч_пут_листов с '+Mindate+' по '+Maxdate+'.doc'), '', '', SW_SHOWNORMAL);
end;

function TJournalPytListForm.FillingWordDoc(var WdApp: variant; const NameDoc,
  Mindate, Maxdate: string): boolean;
const MonthPad: Array [1..12] of String = ('Января', 'Февраля', 'Марта', 'Апреля',
                                'Мая', 'Июня', 'Июля', 'Августа',
                                'Сентября', 'Октября', 'Ноября', 'Декабря');
var
i: integer;
begin
try
  wdApp.ActiveDocument.Tables.Item(1).Cell(1,2).Range.Text:=Copy(Mindate,1,2);
  wdApp.ActiveDocument.Tables.Item(1).Cell(1,4).Range.Text:=MonthPad[strtoint(Copy(Mindate,4,2))];
  wdApp.ActiveDocument.Tables.Item(1).Cell(1,6).Range.Text:=Copy(Mindate,7,4);
  wdApp.ActiveDocument.Tables.Item(1).Cell(1,8).Range.Text:=Copy(Maxdate,1,2);
  wdApp.ActiveDocument.Tables.Item(1).Cell(1,10).Range.Text:=MonthPad[strtoint(Copy(Maxdate,4,2))];
  wdApp.ActiveDocument.Tables.Item(1).Cell(1,12).Range.Text:=Copy(Maxdate,7,4);
i:=3;
  while not DM.Query_Work.Eof do
    begin
      wdApp.ActiveDocument.Tables.Item(2).Rows.Add(EmptyParam);
      wdApp.ActiveDocument.Tables.Item(2).Cell(i,1).Range.Text:=inttostr(i-2);
      wdApp.ActiveDocument.Tables.Item(2).Cell(i,2).Range.Text:=DM.Query_Work.FieldByName('N_pytlist').AsString;
      wdApp.ActiveDocument.Tables.Item(2).Cell(i,3).Range.Text:=DM.Query_Work.FieldByName('data_pytlist').AsString;
      wdApp.ActiveDocument.Tables.Item(2).Cell(i,4).Range.Text:=DM.Query_Work.FieldByName('voditel').AsString;
      wdApp.ActiveDocument.Tables.Item(2).Cell(i,5).Range.Text:=DM.Query_Work.FieldByName('reg_n').AsString;
      wdApp.ActiveDocument.Tables.Item(2).Cell(i,6).Range.Text:=FormatDateTime('hh:nn',DM.Query_Work.FieldByName('time_viez').AsDateTime);
      wdApp.ActiveDocument.Tables.Item(2).Cell(i,7).Range.Text:=FormatDateTime('hh:nn',DM.Query_Work.FieldByName('time_vozv').AsDateTime);
      wdApp.ActiveDocument.Tables.Item(2).Cell(i,8).Range.Text:=DM.Query_Work.FieldByName('primech').AsString;
      DM.Query_Work.Next;
      inc(i);
    end;
  if wdApp.ActiveDocument.Saved=false then
      begin
        wdApp.ActiveDocument.SaveAs(ProgPath+JournalPath+'Журнал_уч_пут_листов с '+Mindate+' по '+Maxdate+'.doc', 0, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, EmptyParam);
      end;
    wdApp.ActiveDocument.Close(false,EmptyParam,EmptyParam);
    wdApp.Quit(0, EmptyParam, EmptyParam);
    Result:=true;
except
   on E: Exception do
    begin
      Result:=false;
      ShowMessage('Error: '+E.Message);
      try
        try
          if not VarIsEmpty(wdApp) then wdApp.Quit(0, EmptyParam, EmptyParam);
        except
        end;
      finally
        wdApp:=Unassigned;
      end;
    end;
  end;
end;

procedure TJournalPytListForm.DBGrid1CellClick(Column: TColumn);
begin
if DM.ADOQuery_Journal.RecordCount<=0 then exit;
LabeledEdit1.Text:=DM.ADOQuery_Journal.FieldValues['N_pytlist'];
DateTimePicker1.Date:=DM.ADOQuery_Journal.FieldValues['data_pytlist'];
LabeledEdit2.Text:=DM.ADOQuery_Journal.FieldValues['voditel'];
MaskEdit3.Text:=DM.ADOQuery_Journal.FieldValues['reg_n'];
MaskEdit1.Text:=FormatDateTime('hh:nn',DM.ADOQuery_Journal.FieldValues['time_viez']);
MaskEdit2.Text:=FormatDateTime('hh:nn',DM.ADOQuery_Journal.FieldValues['time_vozv']);
LabeledEdit3.Text:=DM.ADOQuery_Journal.FieldValues['primech'];
end;

procedure TJournalPytListForm.DBGrid1TitleClick(Column: TColumn);
var s:string;
begin
s:=DM.ADOQuery_Journal.Sort;
if pos('ASC',s)<>0 then
DM.ADOQuery_Journal.Sort:=Column.FieldName+' DESC' else
DM.ADOQuery_Journal.Sort:=Column.FieldName+' ASC';
end;

procedure TJournalPytListForm.FormShow(Sender: TObject);
begin
DateTimePicker1.Date:=Date;
DateTimePicker2.Date:=Date;
DateTimePicker3.Date:=Date;
StatusBar1.Panels[0].Text:='Папка для отчета-журнала:  '+ProgPath+JournalPath;
DBGrid1CellClick(DBGrid1.Columns[0]);
end;

procedure TJournalPytListForm.RadioGroup1Click(Sender: TObject);
begin
if RadioGroup1.ItemIndex=0 then
  begin
    DateTimePicker2.Enabled:=false;
    DateTimePicker3.Enabled:=false;
  end
    else
      begin
        DateTimePicker2.Enabled:=true;
        DateTimePicker3.Enabled:=true;
      end;
end;

end.
