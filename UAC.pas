unit UAC;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons,IdHashMessageDigest,Dialogs;

type
  TUAC_dlg = class(TForm)
    Label1: TLabel;
    UACPWord: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    procedure FormShow(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    function md5(s: string): string;
  end;

var
  UAC_dlg: TUAC_dlg;

implementation
uses Main;
{$R *.dfm}

procedure TUAC_dlg.FormShow(Sender: TObject);
begin
UACPWord.Clear;
UACPWord.SetFocus;
end;

function TUAC_dlg.md5(s: string): string;
begin
  Result:= '';
  with TIdHashMessageDigest5.Create do
  try
    Result := AnsiLowerCase(HashStringAsHex(s));
  finally
    Free;
  end;
end;

procedure TUAC_dlg.OKBtnClick(Sender: TObject);
var s: string;
begin
s:=md5('*'+UACPWord.Text+'*');
if Settings.HPWord=md5(s+s[4]) then ModalResult:=mrOk
else MessageDlg('Неверный пароль! Отказано в доступе.',mtError,[mbOK], 0);
end;

end.

