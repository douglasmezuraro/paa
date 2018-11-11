unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    function HighestElement(A: TArray<Integer>): Integer; overload;
    function HighestElement(A: TArray<Integer>; L, R: Integer): Integer; overload;
    procedure Sort(var A: TArray<Integer>);
    function Test(out A: TArray<Integer>): Boolean;
    function ToString(const A: TArray<Integer>): string;
  end;

var
  MainForm: TMainForm;

implementation

uses
  System.Generics.Collections, Math;

{$R *.dfm}

{ TMainForm }

procedure TMainForm.Button1Click(Sender: TObject);
var
  A: TArray<Integer>;
begin
  A := [0, 1, 9, 8, 7, 6, 5, 4, 3, 2];
  Sort(A);
end;

function TMainForm.HighestElement(A: TArray<Integer>): Integer;
begin
  Result := HighestElement(A, 0, Length(A));
end;

procedure TMainForm.Button2Click(Sender: TObject);
var
  Message: string;
  A: TArray<Integer>;
begin
  Message := 'Testes executados com sucesso!';

  if not Test(A) then
    Message := Format('O array %s não passou nos testes!', [ToString(A)]);

  ShowMessage(Message);
end;

function TMainForm.HighestElement(A: TArray<Integer>; L, R: Integer): Integer;
var
  M, Curr, Prev, Next: Integer;
begin
  M := L + Round((R - L) / 2);

  Curr := A[M];
  Prev := A[M - 1];
  Next := A[M + 1];

  if (M = 0) or (M = Length(A)) then
    Exit(M);

  if (Curr > Prev) and (Curr > Next) then
    Exit(M);

  if Curr > Prev then
    Exit(HighestElement(A, M, R));

  if Prev > Curr then
    Exit(HighestElement(A, 0, M));
end;

procedure TMainForm.Sort(var A: TArray<Integer>);
var
  L, R, Temp: Integer;
begin
  L := HighestElement(A);
  R := Length(A) - 1;
  while (R - L) > 0 do
  begin
    Temp := A[L];
    A[L] := A[R];
    A[R] := Temp;

    Inc(L);
    Dec(R);
  end;
end;

function TMainForm.Test(out A: TArray<Integer>): Boolean;
var
  Dictionary: TDictionary<TArray<Integer>, Integer>;
  Tuple: TPair<TArray<Integer>, Integer>;
  Test: TArray<Integer>;
  Value, ExpectedValue: Integer;
begin
  Result := True;
  Dictionary := TDictionary<TArray<Integer>, Integer>.Create;
  try
    Dictionary.Add([9, 8, 7, 6, 5, 4, 3, 2, 1, 0], 0);
    Dictionary.Add([0, 9, 8, 7, 6, 5, 4, 3, 2, 1], 1);
    Dictionary.Add([0, 1, 9, 8, 7, 6, 5, 4, 3, 2], 2);
    Dictionary.Add([0, 1, 2, 9, 8, 7, 6, 5, 4, 3], 3);
    Dictionary.Add([0, 1, 2, 3, 9, 8, 7, 6, 5, 4], 4);
    Dictionary.Add([0, 1, 2, 3, 4, 9, 8, 7, 6, 5], 5);
    Dictionary.Add([0, 1, 2, 3, 4, 5, 9, 8, 7, 6], 6);
    Dictionary.Add([0, 1, 2, 3, 4, 5, 6, 9, 8, 7], 7);
    Dictionary.Add([0, 1, 2, 3, 4, 5, 6, 7, 9, 8], 8);
    Dictionary.Add([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 9);

    for Tuple in Dictionary do
    begin
      Test := Tuple.Key;
      ExpectedValue := Tuple.Value;
      Value := HighestElement(Test);

      if Value <> ExpectedValue then
      begin
        A := Test;
        Exit(False);
      end;
    end;
  finally
    Dictionary.Free;
  end;
end;

function TMainForm.ToString(const A: TArray<Integer>): string;
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

end.
