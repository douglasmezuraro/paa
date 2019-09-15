program Sort.Algorithn.Tests;

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  TestFramework.Helpers in '..\src\TestFramework\TestFramework.Helpers.pas',
  Impl.Algorithms.Test in '..\src\Impl\Impl.Algorithms.Test.pas',
  Impl.Algorithms in '..\..\Sort.Algorithmn\src\Impl\Impl.Algorithms.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;

  {$WARN SYMBOL_PLATFORM OFF}
  ReportMemoryLeaksOnShutdown := WordBool(DebugHook);
  {$WARN SYMBOL_PLATFORM ON}
end.

