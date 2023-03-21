unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DataModule,Marshryti, Menus, StdCtrls, ComObj, ComCtrls,
  Buttons, Grids, DBGrids,JvDBUltimGrid,load, JvExDBGrids, JvDBGrid,vod,ADODB,About,
  ExtCtrls,Options,Odometr,UAC,ClearDB,Reestr,ReysVoditel,JournalPytList, jpeg,shellapi;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    TreeViewMain: TTreeView;
    JvDBUltimGrid1: TJvDBUltimGrid;
    CheckBox1: TCheckBox;
    N2: TMenuItem;
    N3: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    PopupMenu1: TPopupMenu;
    N4: TMenuItem;
    Label4: TLabel;
    N5: TMenuItem;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    PopupMenu2: TPopupMenu;
    N10: TMenuItem;
    Excel1: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure TreeViewMainChange(Sender: TObject; Node: TTreeNode);
    procedure JvDBUltimGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvDBUltimGrid1DblClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure JvDBUltimGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure TreeViewMainContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TreeViewMainMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Excel1Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
  private

  public
  procedure FillingTree(const Glist:array of string);
  function SELECT_SQL(const ADOQuery:TADOQuery; const TabName: string; const Sort:boolean=(false); const ColSort: string=(''); const ASC_DESCSort:string=('ASC')): boolean; overload;
  function SELECT_SQL(const ADOQuery:TADOQuery; const Open_Exe:boolean=(true); const SQL:string=(''); const Sort:boolean=(false); const ColSort: string=(''); const ASC_DESCSort:string=('ASC')): boolean; overload;
  procedure AddOtmetki(const GName: ShortString; const strok,colum: byte);
  procedure DelOtmetki(const GName: ShortString; const strok,colum: byte); overload;
  procedure DelOtmetki(const GName: ShortString); overload;
  procedure ReadOtmetki(const OPath: string);
  procedure WriteOtmetki(const OPath: string);
  procedure WriteAllSettings(const OPath: string);
  procedure ReadAllSettings(const OPath: string);
  end;

type
  TOtmet=record
   name: string[10];
   str: byte;
   col: byte;
  end;

type
  TSetting=record
   FullTree: boolean;
   OpenDoc: boolean;
   StopErrors: boolean;
   ColorOtm: integer;
   LenStr: byte;
   LvltoOtm: byte;
   NoPytList:Integer;
   HPWord: string[32];
  end;

var
  MainForm: TMainForm;
  Graf: array of string;
  GrafPath:string;
  ProgPath:string;
  PytListPath: string;
  fiotext:string;
  otmetki: array of TOtmet;
  Settings: TSetting;
const Month: Array [1..12] of String = ('Январь', 'Февраль', 'Март', 'Апрель',
                                'Май', 'Июнь', 'Июль', 'Август',
                                'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь');

implementation

uses PytList;

{$R *.dfm}
procedure TMainForm.CheckBox1Click(Sender: TObject);
begin
JvDBUltimGrid1.Repaint;
end;

function GetFileAndCount(const Dir: string): integer;
var
  fs: TSearchRec;
begin
Result:=0;
SetLength(Graf,0);
 if not DirectoryExists(Dir) then
  begin
    showmessage('Error: Указанный каталог не найден');
    exit;
  end;
  if FindFirst(Dir + '\??.??.????.xls',faAnyFile-faDirectory-faVolumeID-faHidden-faSysFile, fs) = 0
    then
    repeat
      SetLength(Graf, Succ(Length(Graf)));
      Graf[Result]:=fs.Name;
      inc(Result);
    until
      FindNext(fs) <> 0;
  FindClose(fs);
end;

procedure TMainForm.FillingTree(const GList:array of string);
var
i,j: integer;
begin
if Length(GList)<=0 then exit;
  for I:=0 to Length(GList)-1 do
    begin
      for J:=1 to TreeViewMain.Items.Count-1 do
        begin
          try
            if TreeViewMain.Items[j].Text=Month[strtoint(copy(GList[i],4,2))] then
            TreeViewMain.Items.Addchild(TreeViewMain.Items.Item[j],StringReplace(GList[i],'.xls','',[rfReplaceAll, rfIgnoreCase]));
          except
            showmessage('Ошибка в имени файла! - '+GList[i]);
            exit;
          end;
        end;
    end;
if Settings.FullTree then TreeViewMain.FullExpand else TreeViewMain.Items[0].Expand(false);
end;


procedure TMainForm.AddOtmetki(const GName: ShortString; const strok,colum: byte);
var
l: integer;
begin
if (colum<>3) and (colum<>1) then exit;
SetLength(otmetki,Succ(Length(otmetki)));
l:=Length(otmetki)-1;
otmetki[l].name:=GName;
otmetki[l].str:=strok;
otmetki[l].col:=colum;
end;

procedure TMainForm.DelOtmetki(const GName: ShortString; const strok,colum: byte);
var
i: integer;
begin
if Length(otmetki)<=0 then exit;
for I:=0 to Length(otmetki)-1 do
  if (Otmetki[i].name=GName) and (Otmetki[i].str=strok) and (Otmetki[i].col=colum) then
    begin
      Otmetki[i]:=Otmetki[Length(Otmetki)-1];
      setLength(Otmetki,Length(Otmetki)-1);
    end;
end;

procedure TMainForm.DelOtmetki(const GName: ShortString);
var
i: integer;
begin
if Length(otmetki)<=0 then exit;
i:=0;
while I<=High(otmetki) do
begin
  if Otmetki[i].name=GName then
  begin
    Otmetki[i]:=Otmetki[High(otmetki)];
    setLength(Otmetki,High(otmetki));
  end
    else
      inc(i);
end;
end;

procedure TMainForm.Excel1Click(Sender: TObject);
var
Exc: Variant;
begin
  Exc:= CreateOleObject('Excel.Application');
  Exc.Workbooks.Open(GrafPath+'\'+TreeViewMain.Selected.Text+'.xls',0);
  Exc.Visible:= True;
end;

procedure TMainForm.BitBtn1Click(Sender: TObject);
var
i:byte;
begin
Label3.Caption:='Графиков: '+inttostr(GetFileAndCount(GrafPath));
TreeViewMain.Items.Clear;
TreeViewMain.Items.Add(nil,'Графики');
for I:=1 to 12 do
  begin
    TreeViewMain.Items.Addchild(TreeViewMain.Items.Item[0],Month[i])
  end;
FillingTree(Graf);
end;

procedure TMainForm.BitBtn2Click(Sender: TObject);
var
t:integer;
begin
if not JvDBUltimGrid1.DataSource.DataSet.Active then exit;
if BitBtn2.Tag<>1 then
if MessageBox(handle,PChar('Ты реально хочешь его удалить из базы?'),PChar('Внимание!'),MB_YESNO+MB_ICONWARNING)<>IDYES then exit;
DM.ADOQuery_Main.Close;
DM.ADOQuery_Main.SQL.Clear;
DM.ADOQuery_Main.SQL.Text:='DROP TABLE '+StringReplace(Label4.Caption,'.','_',[rfReplaceAll, rfIgnoreCase]);
DM.ADOQuery_Main.ExecSQL;
DM.ADOQuery_Main.Close;
DelOtmetki(Label4.Caption);
if BitBtn2.Tag<>1 then
begin
t:=TreeViewMain.Selected.AbsoluteIndex;
TreeViewMain.Selected:=nil;
TreeViewMain.Items[t].Selected:=true;
end;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
FillingTree(Graf);
SELECT_SQL(DM.ADOQuery_MAR,'Marshryti',true,'Km');
SELECT_SQL(DM.ADOQuery_Vod,'Voditeli');
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DM.ADOC.Connected:=false;
DM.ADOC.Close;
if not VarIsEmpty(Ex) then Ex:=Unassigned;
Graf:=nil;
WriteOtmetki(ProgPath+'Otmetki.save');
WriteAllSettings(ProgPath+'Settings.save');
otmetki:=nil;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
ProgPath:=ExtractFilePath(ParamStr(0));
if DM.ADOC.Connected then DM.ADOC.Connected:=false;
DM.ADOC.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+ProgPath+'BD\mjdb.mdb;Persist Security Info=False;';
DM.ADOC.Connected:=true;
GrafPath:=ProgPath+'Files\Графики';
Label1.Caption:='База: '+ProgPath+'BD\mjdb.mdb';
Label2.Caption:='Графики: '+GrafPath;
Label3.Caption:='Графиков: '+inttostr(GetFileAndCount(GrafPath));
ReadOtmetki(ProgPath+'Otmetki.save');
ReadAllSettings(ProgPath+'Settings.save');
end;

procedure TMainForm.JvDBUltimGrid1DblClick(Sender: TObject);
begin
exit;
end;

procedure TMainForm.JvDBUltimGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  i:integer;
begin
if CheckBox1.Checked then exit;
if Length(otmetki)<=0 then exit;
IF (Column.FieldName='Marshryt_dvi') or (Column.FieldName='nick') Then
for I:=0 to Length(otmetki)-1 do
  if (Otmetki[i].name=Label4.Caption) and (Otmetki[i].str=JvDBUltimGrid1.DataSource.DataSet.RecNo) and (Otmetki[i].col=Column.Index) then
      begin
        TDBGrid(Sender).Canvas.Brush.Color:=Settings.ColorOtm;
        TDBGrid(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
      end;
end;

procedure TMainForm.JvDBUltimGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if (Button = mbRight) then
    if (JvDBUltimGrid1.MouseCoord(X, Y).Y <> 0) then
      PopupMenu1.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y)
end;

procedure TMainForm.N10Click(Sender: TObject);
begin
try
  if MessageBox(handle,PChar('Точно удалить?'),PChar('Внимание!'),MB_YESNO+MB_ICONWARNING)=IDYES then
    begin
      BitBtn2.Tag:=1;
      if not DeleteFile(GrafPath+'\'+TreeViewMain.Selected.Text+'.xls') then
      if GetLastError=2 then
      ShowMessage(TreeViewMain.Selected.Text+'.xls'+' не удалён, ошибка - файл не найден!') else
      ShowMessage(TreeViewMain.Selected.Text+'.xls'+' не удалён, код ошибки: '+IntToStr(GetLastError))
      else
        begin
          BitBtn2.Click;
          TreeViewMain.Selected.Delete;
        end;
    end;
finally
 BitBtn2.Tag:=0;
end;
end;

procedure TMainForm.N12Click(Sender: TObject);
begin
if SELECT_SQL(DM.ADOQuery_Vod,'Voditeli') then PListForm.ShowModal;
end;

procedure TMainForm.N13Click(Sender: TObject);
begin
if SELECT_SQL(DM.ADOQuery_Vod,'Voditeli') then
if SELECT_SQL(DM.ADOQuery_odom,true,'SELECT N_odom, N_tab_vod, fio, data_odom, odom FROM Voditeli, Odometry WHERE Voditeli.N_tab=Odometry.N_tab_vod',true,'data_odom','DESC') then OdomForm.ShowModal;
end;

procedure TMainForm.N16Click(Sender: TObject);
begin
if UAC_dlg.ShowModal=mrOk then if SELECT_SQL(DM.ADOQuery_Vod,'Voditeli') then ClearDBForm.ShowModal;
end;

procedure TMainForm.N18Click(Sender: TObject);
begin
ReestrForm.ShowModal;
end;

procedure TMainForm.N1Click(Sender: TObject);
begin
if SELECT_SQL(DM.ADOQuery_MAR,'Marshryti',true,'Km') then MarForm.ShowModal;
end;

procedure TMainForm.N21Click(Sender: TObject);
begin
ReysVodForm.ShowModal;
end;

procedure TMainForm.N23Click(Sender: TObject);
begin
shellexecute(Handle, 'open',PChar(ProgPath+'\Spravka.doc'), '', '', SW_SHOWNORMAL);
end;

procedure TMainForm.N24Click(Sender: TObject);
begin
if SELECT_SQL(DM.ADOQuery_Journal,'JournalPytList',true,'N_pytlist') then JournalPytListForm.ShowModal;
end;

procedure TMainForm.N2Click(Sender: TObject);
begin
if SELECT_SQL(DM.ADOQuery_Vod,'Voditeli') then VodForm.ShowModal;
end;

procedure TMainForm.N4Click(Sender: TObject);
begin
if not JvDBUltimGrid1.DataSource.DataSet.Active then exit;
AddOtmetki(Label4.Caption,JvDBUltimGrid1.DataSource.DataSet.RecNo,JvDBUltimGrid1.SelectedIndex);
JvDBUltimGrid1.Repaint;
end;

procedure TMainForm.N5Click(Sender: TObject);
begin
if not JvDBUltimGrid1.DataSource.DataSet.Active then exit;
DelOtmetki(Label4.Caption,JvDBUltimGrid1.DataSource.DataSet.RecNo,JvDBUltimGrid1.SelectedIndex);
JvDBUltimGrid1.Repaint;
end;

procedure TMainForm.N7Click(Sender: TObject);
begin
OptionsDlg.ShowModal;
end;

procedure TMainForm.N9Click(Sender: TObject);
begin
Application.CreateForm(TAboutBox, AboutBox);
AboutBox.ShowModal;
FreeAndNil(AboutBox);
end;

procedure TMainForm.ReadOtmetki(const OPath: string);
var
i:integer;
RecFileOtm: file of TOtmet;
begin
if not FileExists(OPath) then begin showmessage('Файл с отметками не найден!'); exit; end;
AssignFile(RecFileOtm,OPath);
  Reset(RecFileOtm);
  i:=0;
  while not eof(RecFileOtm) do
  begin
    SetLength(otmetki,Succ(Length(otmetki)));
    Read(RecFileOtm, otmetki[i]);
    inc(i);
  end;
  CloseFile(RecFileOtm);
end;


procedure TMainForm.ReadAllSettings(const OPath: string);
var
RecFileSet: file of TSetting;
begin
if not FileExists(OPath) then begin showmessage('Файл с настройками не найден!'); exit; end;
AssignFile(RecFileSet,OPath);
  Reset(RecFileSet);
  Read(RecFileSet,Settings);
  CloseFile(RecFileSet);
end;

procedure TMainForm.WriteOtmetki(const OPath: string);
var
i:integer;
RecFileOtm: file of TOtmet;
begin
AssignFile(RecFileOtm,OPath);
  ReWrite(RecFileOtm);
  for i := 0 to Length(otmetki)-1 do
  begin
    Write(RecFileOtm, otmetki[i]);
  end;
  CloseFile(RecFileOtm);
end;

procedure TMainForm.WriteAllSettings(const OPath: string);
var
RecFileSet: file of TSetting;
begin
AssignFile(RecFileSet,OPath);
  ReWrite(RecFileSet);
  Write(RecFileSet,Settings);
  CloseFile(RecFileSet);
end;

function TMainForm.SELECT_SQL(const ADOQuery: TADOQuery;
  const Open_Exe: boolean; const SQL: string; const Sort: boolean;
  const ColSort, ASC_DESCSort: string): boolean;
begin
try
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Text:=SQL;
  if Open_Exe then
  ADOQuery.Active:=true else ADOQuery.ExecSQL;
  if Sort then
  ADOQuery.Sort:=ColSort+' '+ASC_DESCSort;
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

function TMainForm.SELECT_SQL(const ADOQuery: TADOQuery;
const TabName: string; const Sort:boolean=(false); const ColSort: string=(''); const ASC_DESCSort:string=('ASC')): boolean;
begin
try
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Text:='SELECT * FROM '+TabName;
  ADOQuery.Active:=true;
  if Sort then
  ADOQuery.Sort:=ColSort+' '+ASC_DESCSort;
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

procedure TMainForm.TreeViewMainChange(Sender: TObject; Node: TTreeNode);
var
search: string;
Vitems: string;
begin
if (TreeViewMain.Selected=nil) or (TreeViewMain.Selected.Level=0) or (TreeViewMain.Selected.Level=1) then
exit;
DM.ADOQuery_Main.Close;
DM.ADOQuery_Main.SQL.Clear;
Vitems:=TreeViewMain.Items[TreeViewMain.Selected.AbsoluteIndex].Text;
Label4.Caption:=Vitems;
search:=StringReplace(Vitems,'.','_',[rfReplaceAll, rfIgnoreCase]);
try
  DM.ADOQuery_Main.SQL.Text:='SELECT * From '+search;
  DM.ADOQuery_Main.Active:=true;
except
  on E: EoleException do
begin
  if TreeViewMain.Tag=1 then exit;
  if E.ErrorCode=-2147217865 then
  begin
    if MessageBox(handle,PChar('График: '+Vitems+' не найден в базе. Загрузить?'),PChar('Подтвердите'),MB_YESNO+MB_ICONQUESTION)=IDYES then
    if fileexists(GrafPath+'\'+Vitems+'.xls') then
    begin
      LoadsForm.Hint:=Vitems;
      LoadsForm.ShowModal;
    end else showmessage('Error: Файл графика не найден');
  end else ShowMessage('Error: '+E.MEssage);
end;
end;
end;

procedure TMainForm.TreeViewMainContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var pt : TPoint;
    tn : TTreeNode;
begin
if Sender <> TreeViewMain then Exit;
  pt := TreeViewMain.ClientToScreen(MousePos);
  tn := TreeViewMain.GetNodeAt(MousePos.X, MousePos.Y-1);
  TreeViewMain.Tag:=1;
  TreeViewMain.Selected := tn;
  if (tn=nil) or (tn.Level=0) or (tn.Level=1) then exit;
  PopupMenu2.Popup(pt.X, pt.Y);
  Handled := True;
  TreeViewMain.Tag:=0;
end;

procedure TMainForm.TreeViewMainMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//if (TreeViewMain.Selected=nil) or (TreeViewMain.Selected.Level=0) or (TreeViewMain.Selected.Level=1) then
//exit;
//if Button=mbLeft then TreeViewMain.Tag:=0;
end;


end.
