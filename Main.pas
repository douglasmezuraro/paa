unit Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  System.Actions,
  Vcl.ActnList,
  Input,
  Impl,
  Test,
  System.IOUtils,
  REST.Json;

type
  TMainForm = class(TForm)
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
    FTest: TImplTest;
    function OpenFile(out Path: string): Boolean;
    function ArrayToString(A: TArray<Integer>): string;
    procedure AddLine(const S: string); overload;
    procedure AddLine(const S: string; const Args: array of const); overload;
    procedure ControlActions;
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

{ TMainForm }

procedure TMainForm.ActionExecuteExecute(Sender: TObject);
var
  Pair: TInputPair;
  A: TArray<Integer>;
  ExpectedValue, Value: Integer;
begin
  Memo.Clear;
  for Pair in FInput.Arrays do
  begin
    A := Pair.Key;
    ExpectedValue := Pair.Value;
    Value := TImpl.HighestElement(A);

    AddLine('Array: %s', [ArrayToString(A)]);
    AddLine('Resultado esperado: %d', [ExpectedValue]);
    AddLine('Resultado obtido: %d', [Value]);
    AddLine('Array ordenado: %s', [ArrayToString(TImpl.Sort(A))]);
    AddLine('');
  end;
end;

procedure TMainForm.ActionOpenInputFileExecute(Sender: TObject);
var
  Path, JSON: string;
begin
  if not OpenFile(Path) then
    Exit;

  JSON := TFile.ReadAllText(Path);

  if Assigned(FInput) then
    FInput.Free;

  FInput := TJson.JsonToObject<TInput>(JSON);

  ControlActions;
end;

procedure TMainForm.ActionTestExecute(Sender: TObject);
var
  Message: string;
begin
  FTest.Input := FInput;

  Message := 'Os testes falharam!';
  if FTest.Execute then
    Message := 'Os testes foram executados com sucesso!';

  ShowMessage(Message);
end;

procedure TMainForm.AddLine(const S: string);
begin
  AddLine(S, []);
end;

procedure TMainForm.AddLine(const S: string; const Args: array of const);
begin
  Memo.Lines.Add(Format(S, Args));
end;

function TMainForm.ArrayToString(A: TArray<Integer>): string;
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

procedure TMainForm.ControlActions;
var
  Enable: Boolean;
begin
  Enable := Assigned(FInput) and (not FInput.IsEmpty);
  ActionTest.Enabled := Enable;
  ActionExecute.Enabled := Enable;
end;

constructor TMainForm.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  FTest := TImplTest.Create;
  Memo.Clear;
  ControlActions;
end;

destructor TMainForm.Destroy;
begin
  FTest.Free;

  if Assigned(FInput) then
    FInput.Free;

  inherited Destroy;
end;

function TMainForm.OpenFile(out Path: string): Boolean;
var
  OpenDialog: TOpenDialog;
begin
  Result := False;
  OpenDialog := TOpenDialog.Create(Self);
  try
    OpenDialog.InitialDir := GetCurrentDir;
    OpenDialog.Options := [ofFileMustExist];
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

