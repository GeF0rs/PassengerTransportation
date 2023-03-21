unit PytList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,ADODB,DataModule, StdCtrls, ExtCtrls, FileCtrl, ShellCtrls,
  Comobj, DateUtils,DBCtrls, Mask,ShellApi, jpeg;

type
  TPListForm = class(TForm)
    TreeViewPytList: TTreeView;
    Label2: TLabel;
    Label3: TLabel;
    ShellTreeView1: TShellTreeView;
    ShellListView1: TShellListView;
    RadioGroup1: TRadioGroup;
    DBLookupComboBox1: TDBLookupComboBox;
    LabeledEdit1: TLabeledEdit;
    Label4: TLabel;
    ProgressBar1: TProgressBar;
    StatusBar1: TStatusBar;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure TreeViewPytListChange(Sender: TObject; Node: TTreeNode);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ShellTreeView1Click(Sender: TObject);
  private
    procedure FillingTreePytList;
    function SetBmText(var aBms : Variant; const aBmName, aText : String) : Boolean;
    function CreatePytList(NGraf:ShortString; const NoPList,NameVod: string; const NtabVod: integer; OpenDoc: boolean): boolean;
    procedure CreateOnePytList(NGraf:ShortString);
    procedure CreateAllPytList(NGraf:ShortString);
    Procedure ErrorProg(TextShow: ShortString);
    function CheckMar_Transodom(const NGraf:ShortString; const NtabVod: integer; const NameVod: string): boolean;
    function Odom_Insert_Update(const NGraf:ShortString; const NtabVod: integer; const odom: string): boolean;
    procedure StartPreparation;
    function PytListInsertJournal(const NoPList,date_plist,FIOVod,Reg_z,TimeOtp,TimeVoz,Prim: string): boolean;
  public
    function OpenShablonWord(var wdApp: variant; const NameDoc: string; const CreateBookmark: boolean=(false)):boolean;
  end;

const
 ShablonPath='Files\Шаблоны\Путевой_лист.dot';

var
  PListForm: TPListForm;
  wdApp,wdBms,wdDoc: Variant;
implementation

uses Main,Load;

{$R *.dfm}

{ TPListForm }

procedure TPListForm.FillingTreePytList;
var
i,j: integer;
Tables:Tstringlist;
begin
try
Tables:=TStringList.Create;
DM.ADOC.GetTableNames(Tables,False);
TreeViewPytList.Items.Clear;
TreeViewPytList.Items.Add(nil,'Графики в базе');
for I:=1 to 12 do
  begin
    TreeViewPytList.Items.Addchild(TreeViewPytList.Items.Item[0],Month[i])
  end;
for I:=0 to Tables.Count-1 do
  begin
    for J:=1 to 12 do
      begin
        try
          if TreeViewPytList.Items[j].Text=Month[strtoint(copy(Tables[i],4,2))] then
          TreeViewPytList.Items.Addchild(TreeViewPytList.Items.Item[j],StringReplace(Tables[i],'_','.',[rfReplaceAll, rfIgnoreCase]));
        except
        end;
      end;
    end;
if Settings.FullTree then TreeViewPytList.FullExpand else TreeViewPytList.Items[0].Expand(false);
  finally
    FreeAndNil(Tables);
  end;
end;

procedure TPListForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Settings.NoPytList:=StrToInt(LabeledEdit1.Text);
MainForm.WriteAllSettings(ProgPath+'Settings.save');
MainForm.SELECT_SQL(DM.ADOQuery_MAR,'Marshryti',true,'Km');
MainForm.SELECT_SQL(DM.ADOQuery_Vod,'Voditeli');
DM.Query_Work.SQL.Clear;
DM.Query_Work.Close;
DM.Query_WorkAll.SQL.Clear;
DM.Query_WorkAll.Close;
  try
    try
      if not VarIsEmpty(wdApp) then wdApp.Quit(0, EmptyParam, EmptyParam);
    except
    end;
  finally
    wdApp:=Unassigned;
  end;
if not VarIsEmpty(wdBms) then wdBms:=Unassigned;
if not VarIsEmpty(wdDoc) then wdDoc:=Unassigned;
end;

procedure TPListForm.FormShow(Sender: TObject);
begin
StatusBar1.Panels[0].Text:='Шаблон:  '+ProgPath+ShablonPath;
PytListPath:=ProgPath+'Files\Путевые_листы\';
Label2.Caption:='Папка для путевых листов: '+PytListPath;
MainForm.ReadAllSettings(ProgPath+'Settings.save');
LabeledEdit1.Text:=IntTostr(Settings.NoPytList);
ShellTreeView1.Root:=PytListPath;
FillingTreePytList;
Label4.Caption:='Ожидание...';
ProgressBar1.Max:=MaxProg;
ProgressBar1.Position:=0;
ProgressBar1.State:=pbsNormal;
RadioGroup1.SetFocus;
end;

function TPListForm.SetBmText(var aBms : Variant; const aBmName, aText : String) : Boolean;
var
  Bm, Rng : Variant;
begin
  Result := aBms.Exists(aBmName);
  if not Result then begin showmessage('Закладка "'+aBmName+'" не найдена! Проверь шаблон'); Exit; end;
  Bm := aBms.Item(aBmName);
  Rng := Bm.Range;
  Rng.Text := aText;
end;

procedure TPListForm.ShellTreeView1Click(Sender: TObject);
begin
ShellListView1.Column[0].Width:=215;
end;

function TPListForm.Odom_Insert_Update(const NGraf: ShortString; const NtabVod: integer;
  const odom: string): boolean;
begin
  try
    DM.Query_Work.SQL.Text:='SELECT * FROM Odometry WHERE N_tab_vod='+inttostr(NtabVod)+' and data_odom=:data';
    DM.Query_Work.Parameters.ParamByName('data').Value:=NGraf;
    DM.Query_Work.Open;
    if DM.DS_Work.DataSet.RecordCount<=0 then
       DM.Query_Work.SQL.Text:='INSERT INTO Odometry (N_tab_vod,data_odom,odom) VALUES ('+IntToStr(NtabVod)+','+':data_odom'+','+odom+')'
    else
       DM.Query_Work.SQL.Text:='UPDATE Odometry SET N_tab_vod='+IntToStr(NtabVod)+',data_odom=:data_odom,odom='+odom+' WHERE N_odom='+inttostr(DM.Query_Work.FieldByName('N_odom').AsInteger);
       DM.Query_Work.Parameters.ParamByName('data_odom').Value:=NGraf;
       DM.Query_Work.ExecSQL;
    Result:=true;
  except
    on E: Exception do
      begin
        Result:=false;
        ShowMessage('Error: '+E.Message);
      end;
    end;
end;

procedure TPListForm.StartPreparation;
begin
ProgressBar1.State:=pbsNormal;
Label4.Caption:='Создание...';
ProgressBar1.Position:=0;
Label6.Caption:='0';
end;

function TPListForm.OpenShablonWord(var wdApp: variant; const NameDoc: string; const CreateBookmark: boolean=(false)): boolean;
begin
  try
    wdApp:=CreateOleObject('Word.Application');
    wdApp.Visible:=false;
    wdDoc:=wdApp.Documents.Add(NameDoc,EmptyParam);
    if CreateBookmark then
    wdBms:=wdDoc.Bookmarks;
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
        if CreateBookmark then
        if not VarIsEmpty(wdBms) then wdBms:=Unassigned;
        if not VarIsEmpty(wdDoc) then wdDoc:=Unassigned;
      end;
  end;
end;

function TPListForm.PytListInsertJournal(const NoPList, date_plist, FIOVod,
  Reg_z, TimeOtp, TimeVoz, Prim: string): boolean;
begin
try
Result:=false;
DM.Query_Work.SQL.Text:='INSERT INTO JournalPytList (N_pytlist,data_pytlist,voditel,reg_n,time_viez,time_vozv,primech) VALUES ('
+NoPList+','+':date_plist'+','+':FIOVod'+','+':Reg_z'+','+':TimeOtp'+','+':TimeVoz'+','+':Prim'+')';
DM.Query_Work.Parameters.ParamByName('FIOVod').Value:=FIOVod;
DM.Query_Work.Parameters.ParamByName('Reg_z').Value:=Reg_z;
DM.Query_Work.Parameters.ParamByName('date_plist').Value:=date_plist;
DM.Query_Work.Parameters.ParamByName('TimeOtp').Value:=TimeOtp;
DM.Query_Work.Parameters.ParamByName('TimeVoz').Value:=TimeVoz;
DM.Query_Work.Parameters.ParamByName('Prim').Value:=Prim;
DM.Query_Work.ExecSQL;
Result:=true;
except
    on E: Exception do
    begin
      Result:=false;
      ShowMessage('Error: '+E.Message);
    end;
end;
end;

procedure TPListForm.RadioGroup1Click(Sender: TObject);
begin
if RadioGroup1.ItemIndex=1 then DBLookupComboBox1.Enabled:=true
else DBLookupComboBox1.Enabled:=false;
end;

procedure TPListForm.TreeViewPytListChange(Sender: TObject; Node: TTreeNode);
begin
if (TreeViewPytList.Selected=nil) or (TreeViewPytList.Selected.Level=0) or (TreeViewPytList.Selected.Level=1) then
exit;
if MessageBox(handle,PChar('Сформировать из графика: '+TreeViewPytList.Items[TreeViewPytList.Selected.AbsoluteIndex].Text+' путевые листы?'),PChar('Подтвердите'),MB_YESNO+MB_ICONQUESTION)=IDYES then
if RadioGroup1.ItemIndex=0 then
CreateAllPytList(TreeViewPytList.Items[TreeViewPytList.Selected.AbsoluteIndex].Text) else
if DBLookupComboBox1.Text='' then begin showmessage('Выбери сначала водителя!'); exit; end else
CreateOnePytList(TreeViewPytList.Items[TreeViewPytList.Selected.AbsoluteIndex].Text);
end;

function TPListForm.CheckMar_Transodom(const NGraf: ShortString;
  const NtabVod: integer; const NameVod: string): boolean;
var TablGraf:ShortString;
odomOt:string;
begin
  try
    TablGraf:=StringReplace(NGraf,'.','_',[rfReplaceAll, rfIgnoreCase]);
    DM.Query_Work.SQL.Text:='SELECT N_mar_reys FROM '+TablGraf+' LEFT JOIN Marshryti ON Marshryti.N_mar=['+TablGraf+'].N_mar_reys Where ['+TablGraf+'].N_tab_vod='+inttostr(NtabVod);
    DM.Query_Work.Open;
    if DM.DS_Work.DataSet.RecordCount>0 then begin Result:=true; exit; end
      else
        begin
          Result:=false;
          if MessageBox(handle,PChar('У водителя '+NameVod+' не найдено маршрутов. Перенести одометр на следующий день без изменений?'),PChar('Подтвердите'),MB_YESNO+MB_ICONQUESTION)=IDYES then
            begin
              DM.Query_Work.SQL.Text:='SELECT * FROM Odometry WHERE N_tab_vod='+inttostr(NtabVod)+' and data_odom=:date';
              DM.Query_Work.Parameters.ParamByName('date').Value:=IncDay(StrToDate(NGraf),-1);
              DM.Query_Work.Open;
              if DM.DS_Work.DataSet.RecordCount<=0 then Raise Exception.Create('У водителя "'+NameVod+'" нет одометра за предыдущий день: '+DateToStr(IncDay(StrToDate(NGraf),-1)))
                else
                  odomOt:=DM.Query_Work.FieldByName('odom').AsString;
              if not odom_Insert_Update(NGraf,NtabVod,odomOt) then Raise Exception.Create('Ошибка при работе с одометром, водитель - '+NameVod);
            end;
        end;
  except
    on E: Exception do
      begin
        ShowMessage('Error: '+E.Message);
        Result:=false;
      end;
  end;
end;

procedure TPListForm.CreateAllPytList(NGraf:ShortString);
begin
StartPreparation;
TreeViewPytList.Enabled:=false;
DM.Query_WorkAll.SQL.Text:='SELECT N_tab,fio FROM Voditeli';
DM.Query_WorkAll.Open;
while not DM.Query_WorkAll.Eof do
  begin
    TreeViewPytList.Enabled:=false;
    if CheckMar_Transodom(NGraf,DM.Query_WorkAll.FieldByName('N_tab').AsInteger,DM.Query_WorkAll.FieldByName('fio').AsString) then
      begin
        if not OpenShablonWord(wdApp,ProgPath+ShablonPath,true) then begin ErrorProg('Ошибка при открытии шаблона!'); exit; end;
        if not CreatePytList(NGraf,LabeledEdit1.Text,DM.Query_WorkAll.FieldByName('fio').AsString,DM.Query_WorkAll.FieldByName('N_tab').AsInteger,Settings.OpenDoc) and (Settings.StopErrors=true) then exit;
      end;
    DM.Query_WorkAll.Next;
  end;
DM.Query_WorkAll.Close;
end;

procedure TPListForm.CreateOnePytList(NGraf:ShortString);
begin
if not CheckMar_Transodom(NGraf,DBLookupComboBox1.KeyValue,DBLookupComboBox1.Text) then exit;
StartPreparation;
TreeViewPytList.Enabled:=false;
if not OpenShablonWord(wdApp,ProgPath+ShablonPath,true) then begin ErrorProg('Ошибка при открытии шаблона!'); exit; end;
if not CreatePytList(NGraf,LabeledEdit1.Text,DBLookupComboBox1.Text,DBLookupComboBox1.KeyValue,Settings.OpenDoc) then exit;
Label6.Caption:='1';
end;

function TPListForm.CreatePytList(NGraf:ShortString; const NoPList,NameVod: string; const NtabVod: integer; OpenDoc: boolean): boolean;
const MonthPad: Array [1..12] of String = ('Января', 'Февраля', 'Марта', 'Апреля',
                                'Мая', 'Июня', 'Июля', 'Августа',
                                'Сентября', 'Октября', 'Ноября', 'Декабря');
var
i:byte;
SumKm,SumL:integer;
odomOt:integer;
SumTime,TimeOtp,TimeVoz: TDateTime;
FioVod,TablGraf:ShortString;
Reg_nomer: string;
begin
 try
  try
   Result:=true;
   SumKm:=0;
   SumL:=0;
   DM.Query_Work.SQL.Text:='SELECT * FROM Odometry WHERE N_tab_vod='+inttostr(NtabVod)+' and data_odom=:date';
   DM.Query_Work.Parameters.ParamByName('date').Value:=IncDay(StrToDate(NGraf),-1);
   DM.Query_Work.Open;
   if DM.DS_Work.DataSet.RecordCount<=0 then Raise Exception.Create('У водителя "'+NameVod+'" нет одометра за предыдущий день: '+DateToStr(IncDay(StrToDate(NGraf),-1)));
   SetBmText(wdBms, 'odomOtp',inttostr(DM.Query_Work.FieldByName('odom').AsInteger));
   odomOt:=DM.Query_Work.FieldByName('odom').AsInteger;
   TablGraf:=StringReplace(NGraf,'.','_',[rfReplaceAll, rfIgnoreCase]);
   DM.Query_Work.SQL.Text:='SELECT * FROM '+TablGraf+' LEFT JOIN Marshryti ON Marshryti.N_mar=['+TablGraf+'].N_mar_reys Where ['+TablGraf+'].N_tab_vod='+inttostr(NtabVod);
   DM.Query_Work.Open;
   i:=15;
   TimeOtp:=DM.Query_Work.FieldByName('Time_otp').AsDateTime;
   while not DM.Query_Work.Eof do
     begin
       if DM.Query_Work.FieldByName('in_or_out').AsBoolean then
       begin
       wdApp.ActiveDocument.Tables.Item(1).Cell(i,2).Range.Text:=DM.Query_Work.FieldByName('Marshryt_dvi').AsString;
       wdApp.ActiveDocument.Tables.Item(1).Cell(i,3).Range.Text:='Птицекомбинат';
       end
        else
          begin
           wdApp.ActiveDocument.Tables.Item(1).Cell(i,2).Range.Text:='Птицекомбинат';
           wdApp.ActiveDocument.Tables.Item(1).Cell(i,3).Range.Text:=DM.Query_Work.FieldByName('Marshryt_dvi').AsString;
          end;
       wdApp.ActiveDocument.Tables.Item(1).Cell(i,4).Range.Text:=inttostr(DM.Query_Work.FieldByName('kol_l').AsInteger);
       SumL:=SumL+DM.Query_Work.FieldByName('kol_l').AsInteger;
       DM.ADOQuery_MAR.SQL.Text:='SELECT * FROM Marshryti WHERE N_mar='+inttostr(DM.Query_Work.FieldByName('N_mar_reys').AsInteger);
       DM.ADOQuery_MAR.Open;
       wdApp.ActiveDocument.Tables.Item(1).Cell(i,5).Range.Text:=inttostr(DM.ADOQuery_MAR.FieldByName('Km').AsInteger);
       SumKm:=SumKm+DM.ADOQuery_MAR.FieldByName('Km').AsInteger;
       SumTime:=SumTime+DM.ADOQuery_MAR.FieldByName('Time').AsDateTime;
       inc(i);
       DM.Query_Work.Next;
     end;
   TimeVoz:=TimeOtp+SumTime;
   wdApp.ActiveDocument.Tables.Item(1).Cell(27,1).Range.Text:=SumKm;
   SetBmText(wdBms, 'odomVoz',inttostr(odomOt+SumKm));
   SetBmText(wdBms, 'N',NoPList);
   SetBmText(wdBms, 'DataC',copy(NGraf,1,2));
   SetBmText(wdBms, 'DataPO',copy(NGraf,1,2));
   SetBmText(wdBms, 'Mec',MonthPad[strtoint(copy(NGraf,4,2))]);
   SetBmText(wdBms, 'G',copy(NGraf,9,2));
   DM.Query_Work.SQL.Text:='SELECT * FROM Voditeli WHERE N_tab='+inttostr(NtabVod);
   DM.Query_Work.Open;
   FioVod:=DM.Query_Work.FieldByName('fio').AsString;
   SetBmText(wdBms, 'FIO',FioVod);
   SetBmText(wdBms, 'FIO2',FioVod);
   SetBmText(wdBms, 'N_yd',DM.Query_Work.FieldByName('vod_yd').AsString);
   Reg_nomer:=DM.Query_Work.FieldByName('reg_z').AsString;
   SetBmText(wdBms, 'Reg_zn',Reg_nomer);
   SetBmText(wdBms, 'DataOtp',NGraf);
   SetBmText(wdBms, 'TimeOtp',FormatDateTime('hh:mm',TimeOtp));
   SetBmText(wdBms, 'DataVoz',NGraf);
   SetBmText(wdBms, 'TimeVoz',FormatDateTime('hh:mm',TimeVoz));
   if not odom_Insert_Update(NGraf,NtabVod,inttostr(odomOt+SumKm)) then Raise Exception.Create('Ошибка при работе с одометром, водитель - '+NameVod);
    if MinuteOf(SumTime)=0 then
      wdApp.ActiveDocument.Tables.Item(1).Cell(27,2).Range.Text:=IntToStr(HourOf(SumTime))+' ч.' else
         wdApp.ActiveDocument.Tables.Item(1).Cell(27,2).Range.Text:=IntToStr(HourOf(SumTime))+' ч. '+IntToStr(MinuteOf(SumTime))+' м.';
    wdApp.ActiveDocument.Tables.Item(1).Cell(27,3).Range.Text:=SumL;
    if wdApp.ActiveDocument.Saved=false then
      begin
        wdApp.ActiveDocument.SaveAs(PytListPath+Month[strtoint(copy(NGraf,4,2))]+'\'+NGraf+'-'+FioVod+'.doc', 0, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, EmptyParam);
      end;
    wdApp.ActiveDocument.Close(false,EmptyParam,EmptyParam);
    wdApp.Quit(0, EmptyParam, EmptyParam);
    if not PytListInsertJournal(NoPList,NGraf,NameVod,Reg_nomer,FormatDateTime('hh:mm',TimeOtp),FormatDateTime('hh:mm',TimeVoz),'') then ShowMessage('Произошла ошибка при добавлении путевого листа в журнал!');
    ProgressBar1.Position:=MaxProg;
    ShellTreeView1.path:=PytListPath+Month[strtoint(copy(NGraf,4,2))];
    ShellListView1.Refresh;
    ShellListView1.Column[0].Width:=215;
    Label4.Caption:='Завершено успешно!';
    Label6.Caption:=inttostr(strtoint(Label6.Caption)+1);
    LabeledEdit1.Text:=inttostr(strtoint(LabeledEdit1.Text)+1);
    if OpenDoc then shellexecute(Handle, 'open',PChar(PytListPath+Month[strtoint(copy(NGraf,4,2))]+'\'+NGraf+'-'+FioVod+'.doc'), '', '', SW_SHOWNORMAL);
  except
   on E: Exception do
    begin
      Result:=false;
      ShowMessage('Error: '+E.Message);
      ErrorProg('Ошибка при создании путевого листа!');
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
 finally
  DM.Query_Work.Close;
  DM.ADOQuery_MAR.Close;
  TreeViewPytList.Enabled:=true;
 end;
end;

procedure TPListForm.ErrorProg(TextShow: ShortString);
begin
Label4.Caption:=TextShow;
ProgressBar1.Position:=MaxProg;
ProgressBar1.State:=pbsError;
TreeViewPytList.Enabled:=true;
Application.ProcessMessages;
end;

end.
