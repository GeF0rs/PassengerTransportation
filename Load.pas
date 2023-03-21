unit Load;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ComObj, ComCtrls, ExtCtrls,FindCompare,DataModule,ADODB, StdCtrls,StrUtils;

type
  TLoadsForm = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
  function loadGraph(const TName: string; const LenS: byte; const Lvl:byte) :boolean;
  function CreateTable(const TName: string):boolean;
  function OpenBook(const BName: string):boolean;
  function SravStr(const ADOQuery:TADOQuery; const Colum:byte; Str:string; Step:byte; var StrOut: integer):integer;
  procedure IncProgress(Z: integer);
  end;

const
 MaxProg=3000;

var
  LoadsForm: TLoadsForm;
  Ex: Variant;
  Graphs: string;
implementation

uses Main;

{$R *.dfm}

function DelSkobStr(s:String):String;
var s1 : String;
    i,k : Integer;
begin
  if (pos('(',s)=0) or ((pos(')',s)=0)) then begin Result:=s; exit; end;
  s1:='';
  i:=1;
  k:=0;
  while i<=StrLen(PChar(s)) do
  begin
    if s[i]<>'(' then
    begin
      if k=0 then
      begin
        s1:=s1+s[i];
      end;
    end else
    begin
      k:=k+1;
    end;
    if (s[i]=')') AND (k>0) then
    begin
      k:=k-1;
    end;
    i:=i+1;
  end;
  Result:=s1;
end;

procedure pause(col:integer);
var wtim:ttime;
begin
wtim:=encodetime(0,0,col,0)+time;
repeat
application.processmessages;
sleep(10);
until time>=wtim;
end;

function TLoadsForm.CreateTable(const TName: string): boolean;
begin
try
  DM.ADOQuery_Main.Close;
  DM.ADOQuery_Main.SQL.Clear;
  DM.ADOQuery_Main.SQL.Text:='CREATE TABLE '+TName+' (Nreys Counter,N_tab_vod int,Time_otp datetime,N_mar_reys int,in_or_out logical,kol_l int)';
  DM.ADOQuery_Main.ExecSQL;
except
  on E: Exception do
    begin
      ShowMessage('Error: '+E.Message);
      Result:=false;
      exit;
    end;
end;
Result:=true;
end;

procedure TLoadsForm.FormActivate(Sender: TObject);
var
t:integer;
begin
if OpenBook(GrafPath+'\'+Hint+'.xls') then
  IncProgress(100) else
   begin
    Label1.Caption:='Ошибка при открытии графика!';
    ProgressBar1.Position:=MaxProg;
    ProgressBar1.State:=pbsError;
    exit;
   end;
Graphs:=StringReplace(Hint,'.','_',[rfReplaceAll, rfIgnoreCase]);
if CreateTable(Graphs) then
  IncProgress(100) else
   begin
    Label1.Caption:='Ошибка при создании таблицы!';
    ProgressBar1.Position:=MaxProg;
    ProgressBar1.State:=pbsError;
    exit;
   end;
if loadGraph(Graphs,Settings.LenStr,Settings.LvltoOtm) then
  IncProgress(2000) else
    begin
     Label1.Caption:='Ошибка при загрузке графика!';
     ProgressBar1.Position:=MaxProg;
     ProgressBar1.State:=pbsError;
     exit;
    end;
showmessage('Готово! Проверьте маршруты');
Label1.Caption:='Завершено успешно...';
ProgressBar1.State:=pbsNormal;
t:=MainForm.TreeViewMain.Selected.AbsoluteIndex;
MainForm.TreeViewMain.Selected:=nil;
MainForm.TreeViewMain.Items[t].Selected:=true;
pause(1);
PostMessage (Handle, WM_CLOSE, 0, 0);
end;

procedure TLoadsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
try
  if not VarIsEmpty(Ex) then Ex.Quit;
except
  Ex:=Unassigned;
end;
MainForm.SELECT_SQL(DM.ADOQuery_MAR,'Marshryti',true,'Km');
MainForm.SELECT_SQL(DM.ADOQuery_Vod,'Voditeli');
if MainForm.JvDBUltimGrid1.DataSource.DataSet.Active then
  begin
    DM.ADOQuery_Main.Requery;
    MainForm.WriteOtmetki(ProgPath+'Otmetki.save');
  end;
end;

procedure TLoadsForm.FormShow(Sender: TObject);
begin
ProgressBar1.Position:=0;
ProgressBar1.Max:=MaxProg;
Label1.Caption:='Загрузка...';
ProgressBar1.State:=pbsNormal;
end;

procedure TLoadsForm.IncProgress(Z: integer);
var
proc,i: integer;
begin
for i:=1 to Z do
begin
proc := ((Z * 100) div MaxProg);
ProgressBar1.Position:=ProgressBar1.Position+proc;
Application.ProcessMessages;
end;
end;

function TLoadsForm.loadGraph(const TName: string; const LenS: byte; const Lvl:byte): boolean;
var
i,StartPos,CurrPos,StrO,j,ResultSrav: integer;
SQL,Fios:string;
t_otpr: TDateTime;
begin
 try
  try
   Result:=true;
   SQL:='INSERT INTO '+TName+' (N_tab_vod,Time_otp,N_mar_reys,in_or_out,kol_l) VALUES (:N_tab_vod,:Time_otp,:N_mar_reys,:in_or_out,:kol_l)';
   DM.ADOQuery_Main.SQL.Clear;
   DM.ADOQuery_Main.SQL.Text:=SQL;
   i:=3;
   j:=0;
   ResultSrav:=0;
   if not MainForm.SELECT_SQL(DM.ADOQuery_MAR,'Marshryti') then exit;
   if not MainForm.SELECT_SQL(DM.ADOQuery_Vod,'Voditeli') then exit;
   while Ex.ActiveSheet.Cells[i,4].Value<>'' do
    begin
     Fios:=Trim(Ex.Sheets[1].Cells[i,2].Value);
     if Trim(Ex.Sheets[1].Cells[i,4].Value)='ПК' then
      begin
        DM.ADOQuery_Main.Parameters.ParamByName('in_or_out').Value:=false;
        ResultSrav:=SravStr(DM.ADOQuery_Mar,1,DelSkobStr(Trim(Ex.Sheets[1].Cells[i,7].Value)),LenS,StrO);
      end
        else
          begin
            DM.ADOQuery_Main.Parameters.ParamByName('in_or_out').Value:=true;
            ResultSrav:=SravStr(DM.ADOQuery_Mar,1,DelSkobStr(Trim(Ex.Sheets[1].Cells[i,4].Value)),LenS,StrO);
          end;
     DM.ADOQuery_Main.Parameters.ParamByName('N_mar_reys').Value:=StrO;
     t_otpr:=Ex.Sheets[1].Cells[i,3].Value;
     DM.ADOQuery_Main.Parameters.ParamByName('Time_otp').Value:=t_otpr;
     StartPos:=0;
     CurrPos:=0;
     While true do
       begin
        CurrPos:=PosEx('/', Fios, StartPos+1);
        if CurrPos > 0 then
          begin
           DM.ADOQuery_Vod.SQL.Text:='SELECT * FROM Voditeli WHERE nick LIKE '''+'%'+Trim(copy(Fios,StartPos+1,CurrPos-(StartPos+1)))+'%''';
           DM.ADOQuery_Vod.Open;
           DM.ADOQuery_Main.Parameters.ParamByName('N_tab_vod').Value:=DM.ADOQuery_Vod.FieldByName('N_tab').AsInteger;
           DM.ADOQuery_Main.Parameters.ParamByName('kol_l').Value:=strtoint(Trim(Ex.Sheets[1].Cells[i,8].Value)) div strtoint(Trim(Ex.Sheets[1].Cells[i,9].Value));
           StartPos:=CurrPos;
           DM.ADOQuery_Main.ExecSQL;
           inc(j);
           if ResultSrav<Lvl then MainForm.AddOtmetki(hint,j,3);
          end
            else
              begin
                DM.ADOQuery_Vod.SQL.Text:='SELECT * FROM Voditeli WHERE nick LIKE '''+'%'+Trim(copy(Fios,StartPos+1,Length(Fios)-StartPos+1))+'%''';
                DM.ADOQuery_Vod.Open;
                DM.ADOQuery_Main.Parameters.ParamByName('N_tab_vod').Value:=DM.ADOQuery_Vod.FieldByName('N_tab').AsInteger;
                DM.ADOQuery_Main.Parameters.ParamByName('kol_l').Value:=(strtoint(Trim(Ex.Sheets[1].Cells[i,8].Value)) div strtoint(Trim(Ex.Sheets[1].Cells[i,9].Value)))+(strtoint(Trim(Ex.Sheets[1].Cells[i,8].Value)) mod strtoint(Trim(Ex.Sheets[1].Cells[i,9].Value)));
                DM.ADOQuery_Main.ExecSQL;
                inc(j);
                if ResultSrav<Lvl then MainForm.AddOtmetki(hint,j,3);
                Break;
              end;
       end;
     inc(i);
     IncProgress(50);
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Error: '+E.Message);
      Result:=false;
    end;
  end;
  finally
    DM.ADOQuery_Mar.Close;
    DM.ADOQuery_Vod.Close;
  end;
end;

function TLoadsForm.OpenBook(const BName: string): boolean;
begin
try
  if VarIsEmpty(Ex) then
  Ex:=CreateOleObject('Excel.Application');
  Ex.Application.EnableEvents:=false;
  Ex.DisplayAlerts := False;
  Ex.Workbooks.Open(BName,0,True);
except
  on E: Exception do
    begin
      ShowMessage('Error: '+E.Message);
      try
        try
         if not VarIsEmpty(Ex) then Ex.Quit;
        except
        end;
      finally
        Ex:=Unassigned;
      end;
      Result:=false;
      exit;
    end;
end;
Result:=true;
end;

function TLoadsForm.SravStr(const ADOQuery:TADOQuery; const Colum:byte; Str:string; Step:byte; var StrOut: integer):integer;
var
max,i: integer;
begin
Result:=0;
max:=0;
i:=0;
if Step<=0 then Step:=1;
ADOQuery.First;
while not ADOQuery.Eof do
  begin
    max:=IndistinctMatching(Step,Str,ADOQuery.Fields[Colum].AsString);
    if max>Result then
      begin
      Result:=max;
      i:=ADOQuery.RecNo;
      end;
    ADOQuery.Next;
  end;
ADOQuery.RecNo:=i;
StrOut:=ADOQuery.FieldByName('N_mar').AsInteger;
end;

end.
