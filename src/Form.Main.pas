unit Form.Main;

interface

uses
  Impl.Algorithms,
  Impl.Input,
  Impl.Tests,
  REST.Json,
  System.Actions,
  System.Classes,
  System.ConvUtils,
  System.IOUtils,
  System.SysUtils,
  Vcl.ActnList,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.Forms,
  Vcl.StdCtrls;

type
  TMain = class(TForm)
    ButtonExecute: TButton;
    ButtonTest: TButton;
    ButtonOpenInputFile: TButton;
    ActionList: TActionList;
    ActionOpenInputFile: TAction;
    ActionTest: TAction;
    ActionExecute: TAction;
    Memo: TMemo;
    procedure ActionOpenInputFileExecute(Sender: TObject);
    procedure ActionTestExecute(Sender: TObject);
    procedure ActionExecuteExecute(Sender: TObject);
  private
    FInput: TInput;
    FTests: TTests;
    function OpenFile(out Path: string): Boolean;
    function ArrayToString(const A: TArray<Integer>): string;
    procedure AddLine(const Line: string); overload;
    procedure AddLine(const Line: string; const Args: array of const); overload;
    procedure ControlActions;
    procedure PrintInitialInfo;
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}
{ TMainForm }

procedure TMain.ActionExecuteExecute(Sender: TObject);
var
  Tuple: TInputTuple;
begin
  Memo.Clear;
  for Tuple in FInput.Arrays do
  begin
    AddLine('Array: %s', [ArrayToString(Tuple.Key)]);
    AddLine('Resultado esperado: %d', [Tuple.Value]);
    AddLine('Resultado obtido: %d', [TAlgorithms.HighestElement(Tuple.Key)]);
    AddLine('Array ordenado: %s', [ArrayToString(TAlgorithms.Sort(Tuple.Key))]);
    AddLine('');
  end;
end;

procedure TMain.ActionOpenInputFileExecute(Sender: TObject);
var
  Path, Json: string;
begin
  if not OpenFile(Path) then
    Exit;

  if Assigned(FInput) then
    FInput.Free;
  try
    Json := TFile.ReadAllText(Path);
    FInput := TJson.JsonToObject<TInput>(Json);
    ControlActions;
  except
    on E: EConversionError do
      ShowMessage('O arquivo não é um JSON válido.');
  end;
end;

procedure TMain.ActionTestExecute(Sender: TObject);
type
  TResultCaption = Array [Boolean] of string;
const
  ResultCaption: TResultCaption = ('falha', 'sucesso');
begin
  Memo.Clear;
  FTests.Input := FInput;
  AddLine('Os casos de teste foram executados com %s.',
    [ResultCaption[FTests.Execute]]);
  AddLine('Casos de testes executados: %d', [FTests.Count]);
  AddLine('Casos de testes que falharam: %d', [FTests.Fails]);
  AddLine('Casos de testes que passaram: %d', [FTests.Successes]);
end;

procedure TMain.AddLine(const Line: string);
begin
  AddLine(Line, []);
end;

procedure TMain.AddLine(const Line: string; const Args: array of const);
begin
  Memo.Lines.Add(Format(Line, Args));
end;

function TMain.ArrayToString(const A: TArray<Integer>): string;
var
  Element: Integer;
begin
  Result := string.Empty;

  for Element in A do
  begin
    if Result.IsEmpty then
      Result := Element.ToString
    else
      Result := Format('%s, %d', [Result, Element]);
  end;

  Result := Format('[%s]', [Result]);
end;

procedure TMain.ControlActions;
var
  Enabled: Boolean;
begin
  Enabled := Assigned(FInput) and (not FInput.IsEmpty);
  ActionTest.Enabled := Enabled;
  ActionExecute.Enabled := Enabled;
end;

constructor TMain.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  FTests := TTests.Create;
  PrintInitialInfo;
  ControlActions;
end;

destructor TMain.Destroy;
begin
  FTests.Free;

  if Assigned(FInput) then
    FInput.Free;

  inherited Destroy;
end;

procedure TMain.PrintInitialInfo;
begin
  Memo.Clear;
  AddLine('Disciplina: Projeto e Análise de Algoritmos');
  AddLine('Professor: Rodrigo Calvo');
  AddLine('Autor: Douglas Mezuraro - RA: 95676 - email: ra95676@uem.com.br');
  AddLine('Autor: Victor Glauber Lopes Silva - RA: 68474 - email: ra68474@uem.com.br');
  AddLine('URL do repositório GIT: https://github.com/douglasmezuraro/paa/');
end;

function TMain.OpenFile(out Path: string): Boolean;
var
  OpenDialog: TOpenDialog;
begin
  Result := False;
  OpenDialog := TOpenDialog.Create(Self);
  try
    OpenDialog.InitialDir := GetCurrentDir;
    OpenDialog.Options := [ofFileMustExist];
    OpenDialog.Title := 'Arquivo de entrada';
    OpenDialog.FileName := 'input-file';
    OpenDialog.Filter := 'JSON|*.json';

    if OpenDialog.Execute then
    begin
      Path := OpenDialog.FileName;
      Result := True;
    end;
  finally
    OpenDialog.Free;
  end;
end;

end.

