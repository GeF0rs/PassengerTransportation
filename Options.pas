unit Options;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Dialogs, ComCtrls, UAC;

type
  TOptionsDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Button1: TButton;
    Shape1: TShape;
    LabeledEdit2: TLabeledEdit;
    CheckBox1: TCheckBox;
    LabeledEdit1: TLabeledEdit;
    ColorOtmetki: TColorDialog;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PWord1: TLabeledEdit;
    PWord2: TLabeledEdit;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OptionsDlg: TOptionsDlg;
implementation

uses Main;

{$R *.dfm}

procedure TOptionsDlg.Button1Click(Sender: TObject);
begin
if ColorOtmetki.Execute then Shape1.Brush.Color:=ColorOtmetki.Color;
end;

procedure TOptionsDlg.Button2Click(Sender: TObject);
var s: string;
begin
//Settings.HPWord:='f2ff175545bfad6ac447de7e3149e759'; //- 1234
s:=UAC_dlg.md5('*'+PWord1.Text+'*');
if UAC_dlg.md5(s+s[4])=Settings.HPWord then
begin
Settings.HPWord:=UAC_dlg.md5(s+s[4]);
showmessage('Пароль изменен, сохраните изменения по кнопке "ОК" окна настроек!');
end
  else showmessage('Неправильный текущий пароль!');
end;

procedure TOptionsDlg.CheckBox4Click(Sender: TObject);
begin
if CheckBox4.Checked then
PWord1.PasswordChar:='*' else PWord1.PasswordChar:=#0
end;

procedure TOptionsDlg.CheckBox5Click(Sender: TObject);
begin
if CheckBox5.Checked then
PWord2.PasswordChar:='*' else PWord2.PasswordChar:=#0
end;

procedure TOptionsDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
PWord1.Clear;
PWord2.Clear;
CheckBox4.Checked:=true;
CheckBox5.Checked:=true;
end;

procedure TOptionsDlg.FormShow(Sender: TObject);
begin
PageControl1.TabIndex:=0;
MainForm.ReadAllSettings(ProgPath+'Settings.save');
CheckBox1.Checked:=Settings.FullTree;
CheckBox2.Checked:=Settings.OpenDoc;
CheckBox3.Checked:=Settings.StopErrors;
Shape1.Brush.Color:=Settings.ColorOtm;
LabeledEdit1.Text:=inttostr(Settings.LenStr);
LabeledEdit2.Text:=inttostr(Settings.LvltoOtm);
end;

procedure TOptionsDlg.OKBtnClick(Sender: TObject);
begin
Settings.FullTree:=CheckBox1.Checked;
Settings.OpenDoc:=CheckBox2.Checked;
Settings.StopErrors:=CheckBox3.Checked;
Settings.ColorOtm:=Shape1.Brush.Color;
Settings.LenStr:=strtoint(LabeledEdit1.Text);
Settings.LvltoOtm:=strtoint(LabeledEdit2.Text);
MainForm.WriteAllSettings(ProgPath+'Settings.save');
MainForm.JvDBUltimGrid1.Repaint;
end;

end.
