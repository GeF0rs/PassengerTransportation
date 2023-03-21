unit ReysVoditel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DataModule, StdCtrls, Grids, DBGrids, ComCtrls, DBCtrls, ExtCtrls,
  JvExDBGrids, JvDBGrid, Buttons, ComObj,ShellApi;

type
  TReysVodForm = class(TForm)
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Button1: TButton;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    DBGrid1: TJvDBGrid;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    UpDown1: TUpDown;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Button2: TButton;
    Label6: TLabel;
    Label7: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroup1Click(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure ComboBox2CloseUp(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    function FillingExcelDoc(var ExApp: variant; const NameDoc: string):boolean;
  public
    { Public declarations }
  end;
const
  ReysPath='Files\Выполненные_рейсы\';
  ShablonPath='Files\Шаблоны\Рейсы.xlt';
var
  ReysVodForm: TReysVodForm;
  Tables:Tstringlist;
implementation
  uses main,Reestr;
{$R *.dfm}

procedure TReysVodForm.Button1Click(Sender: TObject);
var i:integer;
sql_sum_mec: string;
begin
if DBLookupComboBox1.Text='' then begin showmessage('Выбери сначала водителя!'); exit; end;
ComboBox2.Clear;
sql_sum_mec:='';
   try
    for i:=0 to Tables.Count-1 do
      begin
        if strtoint(copy(Tables.Strings[i],4,2))=ComboBox1.ItemIndex+1 then
          begin
            ComboBox2.Items.Add(StringReplace(Tables.Strings[i],'_','.',[rfReplaceAll, rfIgnoreCase]));
            sql_sum_mec:=sql_sum_mec+'SELECT Sum(PriceVod) as SumPriceVod From '+Tables.Strings[i]+',Marshryti where N_tab_vod='+inttostr(DBLookupComboBox1.KeyValue)+' and N_mar_reys=N_mar UNION ALL ';
          end;
      end;
    except
    end;
ComboBox2.ItemIndex:=0;
Label2.Caption:='Графиков за месяц: '+inttostr(ComboBox2.Items.Count);
if ComboBox2.Items.Count=0 then
  begin
    showmessage('Не найдено ни одного графика за этот месяц!');
    DM.Query_Work.Close;
    Label3.Caption:='Кол-во рейсов: 0';
    Label4.Caption:='Сумма водителю за день: 0';
    Label5.Caption:='Сумма водителю за месяц: 0';
  end
    else
      begin
       Delete(sql_sum_mec,length(sql_sum_mec)-10,11);
       DM.Query_Work.SQL.Text:='SELECT Sum(SumPriceVod) as SumPriceVodMec From('+sql_sum_mec+')';
       DM.Query_Work.Open;
       Label5.Caption:='Сумма водителю за месяц: '+DM.Query_Work.FieldByName('SumPriceVodMec').AsString;
       ComboBox2.OnCloseUp(Self);
      end;
ComboBox3.Items:=ComboBox2.Items;
ComboBox4.Items:=ComboBox2.Items;
ComboBox3.ItemIndex:=0;
ComboBox4.ItemIndex:=0;
end;

function TReysVodForm.FillingExcelDoc(var ExApp: variant;
  const NameDoc: string): boolean;
var
i,summ,vsumm,reyscount,curr,last: integer;
graph: string;
begin
try
  exApp.ActiveSheet.PageSetup.Zoom:=false;
  exApp.ActiveSheet.PageSetup.FitToPagesWide := 1;
  exApp.ActiveSheet.PageSetup.FitToPagesTall := 1;
  if DBLookupComboBox1.ListField='nick' then
      DBLookupComboBox1.ListField:='fio';
  exApp.Cells[1,1].Replace(What:='#VOD#',Replacement:=DBLookupComboBox1.Text);
  exApp.Cells[1,1].Replace(What:='#DATE1#',Replacement:=ComboBox3.Text);
  exApp.Cells[1,1].Replace(What:='#DATE2#',Replacement:=ComboBox4.Text);
  vsumm:=0;
  reyscount:=0;
  i:=2;
  last:=ComboBox4.ItemIndex;
  for curr:=ComboBox3.ItemIndex to last do
  begin
    summ:=0;
    graph:=StringReplace(ComboBox3.Items[curr],'.','_',[rfReplaceAll, rfIgnoreCase]);
    DM.Query_Workall.SQL.Text:='SELECT Nreys,Marshryt_dvi,in_or_out,kol_l,PriceVod From '+graph+',Marshryti where N_tab_vod='+inttostr(DBLookupComboBox1.KeyValue)+' and N_mar_reys=N_mar';
    DM.Query_Workall.Open;
    if DM.Query_Workall.RecordCount=0 then Continue;
    exApp.Range[exApp.Cells[i,1],exApp.Cells[i,5]].MergeCells:=True;
    exApp.Cells[i,1].HorizontalAlignment := 3;
    exApp.Cells[i,1].Font.Bold:=true;
    exApp.Cells[i,1]:=ComboBox3.Items[curr];
    exApp.Rows[3].Copy(exApp.Rows[i+1]);
    inc(i,2);
    while not DM.Query_Workall.Eof do
      begin
        exApp.Cells[i,1]:=DM.Query_Workall.FieldByName('Nreys').AsString;
        exApp.Range[exApp.Cells[i,2],exApp.Cells[i,3]]:='Птицекомбинат';
        if DM.Query_Workall.FieldByName('in_or_out').AsBoolean then
            exApp.Cells[i,2]:=DM.Query_Workall.FieldByName('Marshryt_dvi').AsString
              else
                exApp.Cells[i,3]:=DM.Query_Workall.FieldByName('Marshryt_dvi').AsString;
        exApp.Cells[i,4]:=DM.Query_Workall.FieldByName('kol_l').AsString;
        exApp.Cells[i,5]:=DM.Query_Workall.FieldByName('PriceVod').AsString;
        summ:=summ+DM.Query_Workall.FieldByName('PriceVod').AsInteger;
        inc(i);
        DM.Query_Workall.Next;
      end;
    exApp.Rows[i].Font.Bold:=true;
    exApp.Cells[i,1]:=inttostr(DM.Query_Workall.RecordCount);
    exApp.Cells[i,5]:=inttostr(summ);
    exApp.Range[exApp.Cells[3,1],exApp.Cells[i,5]].Borders.LineStyle:=1;
    vsumm:=vsumm+summ;
    reyscount:=reyscount+DM.Query_Workall.RecordCount;
    inc(i);
  end;
  exApp.Cells[i+2,2]:='Всего рейсов: '+inttostr(reyscount);
  exApp.Cells[i+2,3]:='Итоговая сумма: '+inttostr(vsumm);
  exApp.Rows[i+2].Font.Bold:=true;
  exApp.Rows[i+2].Font.Size := 12;
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

procedure TReysVodForm.Button2Click(Sender: TObject);
var
exApp: variant;
begin
if (ComboBox3.Items.Count=0) or (ComboBox3.Text>ComboBox4.Text) then begin ShowMessage('Период задан неправильно!'); exit; end;
if not ReestrForm.OpenShablonExcel(exApp,ProgPath+ShablonPath) then exit;
if FillingExcelDoc(exApp,ProgPath+ReysPath+'Рейсы с '+ComboBox3.Text+' по '+ComboBox4.Text+'.xls')
then
if MessageBox(handle,PChar('Экспорт завершен успешно! Открыть созданный документ?'),PChar('Подтвердите'),MB_YESNO+MB_ICONQUESTION)=IDYES
then shellexecute(Handle, 'open',PChar(ProgPath+ReysPath+'Рейсы с '+ComboBox3.Text+' по '+ComboBox4.Text+'.xls'), '', '', SW_SHOWNORMAL);
end;

procedure TReysVodForm.ComboBox2CloseUp(Sender: TObject);
var
graph: string;
begin
if Combobox2.Text='' then exit;
graph:=StringReplace(ComboBox2.Text,'.','_',[rfReplaceAll, rfIgnoreCase]);
DM.Query_Work.SQL.Text:='SELECT Sum(PriceVod) as SumPriceVod From '+graph+',Marshryti where N_tab_vod='+inttostr(DBLookupComboBox1.KeyValue)+' and N_mar_reys=N_mar';
DM.Query_Work.Open;
Label4.Caption:='Сумма водителю за день: '+DM.Query_Work.FieldByName('SumPriceVod').AsString;
DM.Query_Work.SQL.Text:='SELECT Nreys,Marshryt_dvi,in_or_out,kol_l,PriceVod From '+graph+',Marshryti where N_tab_vod='+inttostr(DBLookupComboBox1.KeyValue)+' and N_mar_reys=N_mar';
DM.Query_Work.Open;
Label3.Caption:='Кол-во рейсов: '+inttostr(DBGrid1.DataSource.DataSet.RecordCount);
dbgrid1.Columns[0].Title.caption:='№ рейса';
dbgrid1.Columns[1].Title.caption:='Маршрут';
dbgrid1.Columns[2].Title.caption:='Отпр. или приб.';
dbgrid1.Columns[3].Title.caption:='Людей';
dbgrid1.Columns[4].Title.caption:='Оплата водителю, руб';
dbgrid1.Columns[1].Width:=400;
dbgrid1.Columns[2].Alignment:=taCenter;
dbgrid1.Columns[3].Alignment:=taCenter;
dbgrid1.Columns[4].Alignment:=taCenter;
dbgrid1.Columns[1].Title.Alignment:=taCenter;
dbgrid1.Columns[2].Title.Alignment:=taCenter;
dbgrid1.Columns[3].Title.Alignment:=taCenter;
dbgrid1.Columns[4].Title.Alignment:=taCenter;
end;

procedure TReysVodForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FreeAndNil(Tables);
DM.Query_Work.Close;
DM.Query_WorkAll.Close;
end;

procedure TReysVodForm.FormShow(Sender: TObject);
begin
Tables:=TStringList.Create;
DM.ADOC.GetTableNames(Tables,False);
ComboBox1.ItemIndex:=strtoint(FormatDateTime('m',Now))-1;
if DBLookupComboBox1.Text='' then DBLookupComboBox1.KeyValue:=DBLookupComboBox1.ListSource.DataSet.FieldByName(DBLookupComboBox1.KeyField).Value;
StatusBar1.Panels[0].Text:='Папка для отчета-рейсов:  '+ProgPath+ReysPath;
end;

procedure TReysVodForm.RadioGroup1Click(Sender: TObject);
begin
if RadioGroup1.ItemIndex=0 then DBLookupComboBox1.ListField:='fio' else
DBLookupComboBox1.ListField:='nick';
end;

procedure TReysVodForm.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
if Button=btNext then
  begin
    ComboBox2.ItemIndex:=ComboBox2.ItemIndex+1;
    ComboBox2.OnCloseUp(Self);
  end
   else
    if ComboBox2.ItemIndex>0 then
      begin
        ComboBox2.ItemIndex:=ComboBox2.ItemIndex-1;
        ComboBox2.OnCloseUp(Self);
      end;
end;

end.
