unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Input;

type
  TMainForm = class(TForm)
    ButtonExecute: TButton;
    ButtonTest: TButton;
    ButtonOpenInputFile: TButton;
    ActionList: TActionList;
    ActionOpenInputFile: TAction;
    ActionTest: TAction;
    ActionExecute: TAction;
    procedure ActionOpenInputFileExecute(Sender: TObject);
    procedure ActionTestExecute(Sender: TObject);
  private
    FInput: TInput;
    function OpenFile(out Path: string): Boolean;
    function Test: string;
  public
    property Input: TInput read FInput write FInput;
  end;

var
  MainForm: TMainForm;

implementation

uses
  Impl, Test;

{$R *.dfm}

{ TMainForm }

procedure TMainForm.ActionOpenInputFileExecute(Sender: TObject);
var
  Path: string;
begin
  if OpenFile(Path) then
    Input := TInput.Create(Path);
end;

procedure TMainForm.ActionTestExecute(Sender: TObject);
begin
  ShowMessage(Self.Test);
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
    OpenDialog.Filter := 'JSON|*.json';

    if OpenDialog.Execute then
    begin
      Path := OpenDialog.Files.Strings[0];
      Result := True;
    end;
  finally
    OpenDialog.Free;
  end;
end;

function TMainForm.Test: string;
var
  Test: TImplTest;
begin
  Test := TImplTest.Create(Input);
  try
    Test.Execute;
    Result := Test.Message;
  finally
    Test.Free;
  end;
end;

end.
