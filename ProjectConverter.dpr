program ProjectConverter;

uses
  Vcl.Forms,
  ViewMain in 'View\ViewMain.pas' {WindowMain},
  Config in 'Code\Config.pas',
  MyArrays in 'Code\MyArrays.pas',
  MyDialogs in 'Code\MyDialogs.pas',
  MySets in 'Code\MySets.pas',
  MyUtils in 'Code\MyUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TWindowMain, WindowMain);
  Application.Run;
end.
