program Project;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MainForm},
  Impl in 'Impl.pas',
  Test in 'Test.pas',
  Input in 'Input.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
  ReportMemoryLeaksOnShutdown := True;
end.
