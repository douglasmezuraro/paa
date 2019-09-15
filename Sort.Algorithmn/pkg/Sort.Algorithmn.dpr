program Sort.Algorithmn;

uses
  System.StartUpCopy,
  FMX.Forms,
  View.Main in '..\src\View\View.Main.pas' {Main},
  Impl.Conversions in '..\src\Impl\Impl.Conversions.pas',
  Impl.Algorithms in '..\src\Impl\Impl.Algorithms.pas';

{$R *.res}

var
  Main: TMain;

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.Run;

  {$WARN SYMBOL_PLATFORM OFF}
  ReportMemoryLeaksOnShutdown := WordBool(DebugHook);
  {$WARN SYMBOL_PLATFORM ON}
end.

