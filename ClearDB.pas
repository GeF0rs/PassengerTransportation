unit ClearDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,DataModule, DBCtrls, StdCtrls, ExtCtrls, Grids, DBGrids,Masks;

type
  TClearDBForm = class(TForm)
    TreeViewClearDB: TTreeView;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    DateTimePicker1: TDateTimePicker;
    DBLookupComboBox1: TDBLookupComboBox;
    Button1: TButton;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure TreeViewClearDBChange(Sender: TObject; Node: TTreeNode);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1CloseUp(Sender: TObject);
  private
    procedure FillingTreeClearDB;
    procedure ClearTableOdometry(const Sql: string);
  public
    { Public declarations }
  end;

var
  ClearDBForm: TClearDBForm;

implementation

uses main;
{$R *.dfm}

procedure TClearDBForm.Button1Click(Sender: TObject);
begin
  if RadioGroup2.ItemIndex=0 then
    begin
      if MessageBox(handle,PChar('Действительно хотите - '+RadioGroup2.Items[RadioGroup2.ItemIndex]+' - '+datetostr(DateTimePicker1.Date)+' ?'),PChar('Подтвердите'),MB_YESNO+MB_ICONWARNING)=IDYES then
        ClearTableOdometry('DELETE FROM Odometry where data_odom<'+'#'+FormatDateTime('mm/dd/yyyy',DateTimePicker1.Date)+'#');
    end
      else
        if RadioGroup2.ItemIndex=1 then
          begin
            if MessageBox(handle,PChar('Действительно хотите - '+RadioGroup2.Items[RadioGroup2.ItemIndex]+' - '+DBLookupComboBox1.Text+' ?'),PChar('Подтвердите'),MB_YESNO+MB_ICONWARNING)=IDYES then
              ClearTableOdometry('DELETE FROM Odometry where N_tab_vod='+inttostr(DBLookupComboBox1.KeyValue));
          end
            else
              begin
                if MessageBox(handle,PChar('Действительно хотите - '+RadioGroup2.Items[RadioGroup2.ItemIndex]+' - '+datetostr(DateTimePicker1.Date)+' и '+DBLookupComboBox1.Text+' ?'),PChar('Подтвердите'),MB_YESNO+MB_ICONWARNING)=IDYES then
                  ClearTableOdometry('DELETE FROM Odometry where N_tab_vod='+inttostr(DBLookupComboBox1.KeyValue)+' and data_odom<'+'#'+FormatDateTime('mm/dd/yyyy',DateTimePicker1.Date)+'#');
              end;
end;

procedure TClearDBForm.ClearTableOdometry(const Sql: string);
begin
  try
    DM.Query_Workall.Close;
    DM.Query_Workall.SQL.Clear;
    DM.Query_Workall.SQL.Text:=sql;
    DM.Query_Workall.ExecSQL;
    Showmessage('Очистка завершена успешно!');
  except
    on E: Exception do
    ShowMessage('Ошибка: '+E.Message);
  end;
end;

procedure TClearDBForm.ComboBox1CloseUp(Sender: TObject);
var
i:integer;
Tables:Tstringlist;
del: boolean;
begin
if MessageBox(handle,PChar('Действительно хотите - Удалить все графики за - '+ComboBox1.Text+'?'),PChar('Подтвердите'),MB_YESNO+MB_ICONWARNING)=IDYES then
  begin
    try
      del:=false;
      try
        Tables:=TStringList.Create;
        DM.ADOC.GetTableNames(Tables,False);
        for I:=0 to Tables.Count-1 do
          begin
            if MatchesMask(Tables[i], '??_'+format('%.2u',[ComboBox1.ItemIndex+1])+'_????') then
              begin
                DM.Query_Workall.SQL.Text:='DROP TABLE '+Tables[i];
                DM.Query_Workall.ExecSQL;
                MainForm.DelOtmetki(StringReplace(Tables[i],'_','.',[rfReplaceAll, rfIgnoreCase]));
                del:=true;
              end;
          end;
        FillingTreeClearDB;
        if del then Showmessage('Удаление графиков за '+ComboBox1.Text+' завершено успешно')
          else Showmessage('Не найдено ни одного графика за этот месяц!');
      except
        on E: Exception do
          ShowMessage('Ошибка: '+E.MEssage);
      end;
    finally
      FreeAndNil(Tables);
    end;
  end;
end;

procedure TClearDBForm.FillingTreeClearDB;
var
i:integer;
Tables:Tstringlist;
begin
  try
    Tables:=TStringList.Create;
    DM.ADOC.GetTableNames(Tables,False);
    TreeViewClearDB.Items.Clear;
    TreeViewClearDB.Items.Add(nil,'Таблицы в базе');
    for I:=0 to Tables.Count-1 do
      begin
        TreeViewClearDB.Items.Addchild(TreeViewClearDB.Items.Item[0],Tables[i]);
      end;
  finally
    FreeAndNil(Tables);
  end;
TreeViewClearDB.FullExpand;
end;

procedure TClearDBForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DM.ADOQuery_Main.Close;
end;

procedure TClearDBForm.FormShow(Sender: TObject);
begin
FillingTreeClearDB;
DateTimePicker1.Date:=Now;
ComboBox1.ItemIndex:=strtoint(FormatDateTime('m',Now))-1;
DateSeparator := '/';
end;

procedure TClearDBForm.RadioGroup2Click(Sender: TObject);
begin
if DBLookupComboBox1.Text='' then DBLookupComboBox1.KeyValue:=DBLookupComboBox1.ListSource.DataSet.FieldByName(DBLookupComboBox1.KeyField).Value;
if RadioGroup2.ItemIndex=0 then DateTimePicker1.Enabled:=true else DateTimePicker1.Enabled:=false;
if RadioGroup2.ItemIndex=1 then DBLookupComboBox1.Enabled:=true else DBLookupComboBox1.Enabled:=false;
if RadioGroup2.ItemIndex=2 then begin DateTimePicker1.Enabled:=true; DBLookupComboBox1.Enabled:=true;  end;
end;

procedure TClearDBForm.TreeViewClearDBChange(Sender: TObject; Node: TTreeNode);
begin
if (TreeViewClearDB.Selected=nil) or (TreeViewClearDB.Selected.Level=0) then
exit;
try
  if MessageBox(handle,PChar('Действительно хотите - '+RadioGroup1.Items[RadioGroup1.ItemIndex]+' - '+TreeViewClearDB.Items[TreeViewClearDB.Selected.AbsoluteIndex].Text+' ?'),PChar('Подтвердите'),MB_YESNO+MB_ICONWARNING)=IDYES then
    begin
     DM.Query_Workall.Close;
     DM.Query_Workall.SQL.Clear;
     if RadioGroup1.ItemIndex=0 then
        DM.Query_Workall.SQL.Text:='DROP TABLE '+TreeViewClearDB.Items[TreeViewClearDB.Selected.AbsoluteIndex].Text
      else
        DM.Query_Workall.SQL.Text:='DELETE FROM '+TreeViewClearDB.Items[TreeViewClearDB.Selected.AbsoluteIndex].Text;
        DM.Query_Workall.ExecSQL;
        MainForm.DelOtmetki(StringReplace(TreeViewClearDB.Items[TreeViewClearDB.Selected.AbsoluteIndex].Text,'_','.',[rfReplaceAll, rfIgnoreCase]));
        FillingTreeClearDB;
        Showmessage(RadioGroup1.Items[RadioGroup1.ItemIndex]+' - завершено успешно!');
    end;
except
  on E: Exception do
    ShowMessage('Ошибка: '+E.MEssage);
end;
end;

end.
