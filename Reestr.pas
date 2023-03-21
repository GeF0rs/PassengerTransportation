unit Reestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls,DataModule,ComObj,
  JvgStringGrid,Masks, ExtCtrls, Buttons,ShellApi;

type
  TReestrForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    JvgStringGrid1: TJvgStringGrid;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    StatusBar1: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1CloseUp(Sender: TObject);
    procedure JvgStringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
  private
    function FillingExcelDoc(var ExApp: variant; const NameDoc: string):boolean;
  public
    function OpenShablonExcel(var ExApp: variant; const NameDoc: string):boolean;
  end;

const
 ReestrPath='Files\Реестры\';
 ShablonPath='Files\Шаблоны\Реестр_печать.xlt';
 xlExcel9795 = $0000002B;
 xlExcel8 = 56;
 xlShiftToLeft = -4159;
 xlDown=-4121;
var
  ReestrForm: TReestrForm;
  Tables,Tables_for_mec:Tstringlist;

implementation
 uses main;
{$R *.dfm}

function YearOf(const AValue: TDateTime): Word;
var
  LMonth, LDay: Word;
begin
  DecodeDate(AValue, Result, LMonth, LDay);
end;

procedure TReestrForm.BitBtn1Click(Sender: TObject);
var
exApp: variant;
begin
if Tables_for_mec.Count=0 then begin showmessage('Нечего выводить! :('); exit; end;
if not OpenShablonExcel(exApp,ProgPath+ShablonPath) then exit;
if FillingExcelDoc(exApp,ProgPath+ReestrPath+'Реестр_'+ComboBox1.Text+'.xls') then
  begin
    if MessageBox(handle,PChar('Экспорт завершен успешно! Открыть созданный документ?'),PChar('Подтвердите'),MB_YESNO+MB_ICONQUESTION)=IDYES
      then shellexecute(Handle,'open',PChar(ProgPath+ReestrPath+'Реестр_'+ComboBox1.Text+'.xls'),nil,nil,SW_SHOWNORMAL);
  end
    else
      Showmessage('Экспорт завершен с ошибкой!');
end;

function TReestrForm.OpenShablonExcel(var ExApp: variant; const NameDoc: string): boolean;
begin
  try
    exApp:=CreateOleObject('Excel.Application');
    exApp.Visible:=false;
    exApp.WorkBooks.Add(NameDoc);
    Result:=true;
  except
    on E: Exception do
      begin
        Result:=false;
        ShowMessage('Error: '+E.Message);
        try
          try
            if not VarIsEmpty(exApp) then exApp.Quit;
          except
          end;
        finally
          exApp:=Unassigned;
        end;
      end;
  end;
end;

function TReestrForm.FillingExcelDoc(var ExApp: variant; const NameDoc: string): boolean;
var i,j,k,dayinmon,vsego,stoim: integer;
cell: array [1..2] of byte;
begin
  try
    exApp.ActiveSheet.PageSetup.Zoom:=false;
    exApp.ActiveSheet.PageSetup.FitToPagesWide := 1;
    exApp.ActiveSheet.PageSetup.FitToPagesTall := 1;
    exApp.Cells[1,1].Replace(What:='#DATE#',Replacement:=ComboBox1.Text+' '+inttostr(YearOf(Now)));
    dayinmon:=MonthDays[IsLeapYear(YearOf(Now))][ComboBox1.ItemIndex+1];
    for i:=1 to 31-dayinmon do
      begin
        exApp.Cells.Columns[dayinmon+2].Delete(Shift:=xlShiftToLeft);
      end;
    exApp.Cells.Rows['5:'+inttostr(JvgStringGrid1.RowCount+2)].Insert(Shift :=xlDown);
    exApp.Range[exApp.Cells[4,1],exApp.Cells[JvgStringGrid1.RowCount+2,dayinmon+5]].Borders.LineStyle:=1;
    exApp.Rows[JvgStringGrid1.RowCount+2].Font.Bold:=true;
    vsego:=strtoint(JvgStringGrid1.Cells[32,1]);
    stoim:=strtoint(JvgStringGrid1.Cells[33,1]);
    cell[1]:=4;
    cell[2]:=4;
    for I:=1 to JvgStringGrid1.RowCount-1 do
      begin
      k:=0;
        for j:=0 to (JvgStringGrid1.ColCount-1)-(31-dayinmon)+1 do
          begin
            if j=32 then
              begin
               if i<JvgStringGrid1.RowCount-1 then
                 begin
                   if (JvgStringGrid1.Cells[33,i+1]<>'') and (stoim=strtoint(JvgStringGrid1.Cells[33,i+1])) then
                    begin
                      vsego:=vsego+strtoint(JvgStringGrid1.Cells[32,i+1]);
                      cell[2]:=i+4;
                    end
                      else
                        begin
                          exApp.Cells[cell[2],j+1]:=vsego;
                          exApp.Range[exApp.Cells[cell[1],j+1],exApp.Cells[cell[2],j+1]].MergeCells:=True;
                          vsego:=strtoint(JvgStringGrid1.Cells[32,i+1]);
                          cell[1]:=cell[2]+1;
                          cell[2]:=cell[1];
                        end;
                   if JvgStringGrid1.Cells[33,i+1]<>'' then stoim:=strtoint(JvgStringGrid1.Cells[33,i+1]);
                 end;
               Continue;
              end;
            exApp.Cells[i+3,j+1]:=JvgStringGrid1.Cells[k,i];
            if j=dayinmon then k:=j+(31-dayinmon);
            inc(k);
          end;
      end;
    exApp.DisplayAlerts:=False;
    try
       exApp.ActiveWorkbook.SaveAs(NameDoc,xlExcel8);
    except
      exApp.ActiveWorkbook.SaveAs(NameDoc,xlExcel9795);
    end;
    exApp.Quit;
    Result:=true;
  except
    on E: Exception do
      begin
        Result:=false;
        ShowMessage('Error: '+E.Message);
        exApp.DisplayAlerts:=False;
        try
          try
            if not VarIsEmpty(exApp) then exApp.Quit;
          except
          end;
        finally
          exApp:=Unassigned;
        end;
      end;
  end;
end;

procedure TReestrForm.ComboBox1CloseUp(Sender: TObject);
var i,j,day,itog,LastRow:integer;
insert_mar: boolean;
t : Longword;
begin
t := GetTickCount;
Label3.Caption:='Затраченное время: ';
Tables_for_mec.Clear;
for i := 1 to JvgStringGrid1.RowCount - 1 do
JvgStringGrid1.Rows[i].Clear;
for i:=0 to Tables.Count-1 do
  begin
    if MatchesMask(Tables[i], '??_'+format('%.2u',[ComboBox1.ItemIndex+1])+'_????') then
    Tables_for_mec.Add(Tables[i]);
  end;
Label2.Caption:='Графиков за месяц: '+inttostr(Tables_for_mec.Count);
if Tables_for_mec.Count<=0 then begin showmessage('За '+ComboBox1.Text+' не найдено графиков!'); exit; end;
insert_mar:=true;
itog:=0;
for i:=0 to Tables_for_mec.Count-1 do
  begin
   DM.ADOQuery_Reestr.SQL.Text:='SELECT Marshryt_dvi,dn,Price FROM (SELECT N_mar_reys, Count(N_mar_reys) AS dn FROM '+Tables_for_mec[i]+' GROUP BY N_mar_reys) as T1 RIGHT JOIN Marshryti ON T1.N_mar_reys=Marshryti.N_mar ORDER BY Price';
   DM.ADOQuery_Reestr.Open;
   itog:=0;
   if JvgStringGrid1.Cells[0,1]='' then insert_mar:=true else insert_mar:=false;
   if insert_mar then
     begin
       JvgStringGrid1.RowCount:=DM.ADOQuery_Reestr.RecordCount+2;
       LastRow:=JvgStringGrid1.RowCount-1;
       JvgStringGrid1.Cells[34,LastRow]:='0';
       JvgStringGrid1.Cells[32,LastRow]:='0';
     end;
   while not DM.ADOQuery_Reestr.Eof do
     begin
       for j:=1 to JvgStringGrid1.RowCount-2 do
         begin
           if insert_mar then
             begin
              JvgStringGrid1.Cells[0,j]:=DM.ADOQuery_Reestr.FieldByName('Marshryt_dvi').AsString;
              JvgStringGrid1.Cells[33,j]:=DM.ADOQuery_Reestr.FieldByName('Price').AsString;
             end;
           day:=strtoint(copy(Tables_for_mec.Strings[i],1,2));
           if JvgStringGrid1.Cells[32,j]='' then JvgStringGrid1.Cells[32,j]:='0';
           if DM.ADOQuery_Reestr.FieldByName('dn').AsString='' then JvgStringGrid1.Cells[day,j]:='0' else
             begin
              JvgStringGrid1.Cells[day,j]:=DM.ADOQuery_Reestr.FieldByName('dn').AsString;
              itog:=itog+DM.ADOQuery_Reestr.FieldByName('dn').AsInteger;
              JvgStringGrid1.Cells[32,j]:=inttostr(strtoint(JvgStringGrid1.Cells[32,j])+DM.ADOQuery_Reestr.FieldByName('dn').AsInteger);
             end;
           if i=Tables_for_mec.Count-1 then
             begin
               JvgStringGrid1.Cells[34,j]:=inttostr(DM.ADOQuery_Reestr.FieldByName('Price').AsInteger*strtoint(JvgStringGrid1.Cells[32,j]));
               JvgStringGrid1.Cells[34,LastRow]:=inttostr(strtoint(JvgStringGrid1.Cells[34,LastRow])+strtoint(JvgStringGrid1.Cells[34,j]));
             end;
           DM.ADOQuery_Reestr.Next;
         end;
     end;
  JvgStringGrid1.Cells[0,LastRow]:='Итог';
  JvgStringGrid1.Cells[day,LastRow]:=inttostr(itog);
  JvgStringGrid1.Cells[32,LastRow]:=inttostr(strtoint(JvgStringGrid1.Cells[32,LastRow])+itog);
  end;
JvgStringGrid1.SetFocus;
t := GetTickCount - t;
Label3.Caption:='Затраченное время: '+Floattostr(t*0.001)+' сек.'
end;

procedure TReestrForm.FormActivate(Sender: TObject);
begin
ComboBox1.OnCloseUp(Self);
end;

procedure TReestrForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FreeAndNil(Tables);
FreeAndNil(Tables_for_mec);
end;

procedure TReestrForm.FormShow(Sender: TObject);
begin
Tables:=TStringList.Create;
Tables_for_mec:=TStringList.Create;
DM.ADOC.GetTableNames(Tables,False);
ComboBox1.ItemIndex:=strtoint(FormatDateTime('m',Now))-1;
JvgStringGrid1.ColWidths[34]:=80;
StatusBar1.Panels[0].Text:='Папка для реестров:  '+ProgPath+ReestrPath;
end;

procedure TReestrForm.JvgStringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
with JvgStringGrid1,JvgStringGrid1.Canvas do
  begin
  if ARow=JvgStringGrid1.RowCount-1 then
  with rect do
    begin
    Pen.Color:=clBlack;
    Brush.Color:=clBtnFace;
    Rectangle(Left-2,top-2,Right+2,bottom+2);
    end;
  FillRect(Rect);
  DrawText(Handle,PChar(Cells[ACol,ARow]),length(Cells[ACol,ARow]),Rect,
  DT_CENTER or DT_VCENTER or DT_SINGLELINE);
  end;
end;

end.
