program MakeJob;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  Marshryti in 'Marshryti.pas' {MarForm},
  DataModule in 'DataModule.pas' {DM: TDataModule},
  Load in 'Load.pas' {LoadsForm},
  Vod in 'Vod.pas' {VodForm},
  ABOUT in 'ABOUT.pas' {AboutBox},
  Options in 'Options.pas' {OptionsDlg},
  PytList in 'PytList.pas' {PListForm},
  UAC in 'UAC.pas' {UAC_dlg},
  ClearDB in 'ClearDB.pas' {ClearDBForm},
  Reestr in 'Reestr.pas' {ReestrForm},
  ReysVoditel in 'ReysVoditel.pas' {ReysVodForm},
  Odometr in 'Odometr.pas' {OdomForm},
  JournalPytList in 'JournalPytList.pas' {JournalPytListForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TMarForm, MarForm);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TLoadsForm, LoadsForm);
  Application.CreateForm(TVodForm, VodForm);
  Application.CreateForm(TOptionsDlg, OptionsDlg);
  Application.CreateForm(TPListForm, PListForm);
  Application.CreateForm(TUAC_dlg, UAC_dlg);
  Application.CreateForm(TClearDBForm, ClearDBForm);
  Application.CreateForm(TReestrForm, ReestrForm);
  Application.CreateForm(TReysVodForm, ReysVodForm);
  Application.CreateForm(TOdomForm, OdomForm);
  Application.CreateForm(TJournalPytListForm, JournalPytListForm);
  //Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
