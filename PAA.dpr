// Autor: Douglas Mezuraro - RA: 95676 - email: ra95676@uem.com.br
// Autor: Victor Glauber Lopes Silva - RA: 68474 - email: ra68474@uem.com.br

program PAA;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Form.Main in 'src\Form.Main.pas' {Main},
  Impl.Algorithms in 'src\Impl.Algorithms.pas',
  Impl.Input in 'src\Impl.Input.pas',
  Impl.Tests in 'src\Impl.Tests.pas';

{$R *.res}

var
  Main: TMain;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  TStyleManager.TrySetStyle('Carbon');
  Application.Run;
  ReportMemoryLeaksOnShutdown := True;
end.

