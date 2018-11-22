program Project;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MainForm},
  Impl in 'Impl.pas',
  Test in 'Test.pas',
  Input in 'Input.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

var
  MainForm: TMainForm;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Carbon');
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
  ReportMemoryLeaksOnShutdown := True;
end.
