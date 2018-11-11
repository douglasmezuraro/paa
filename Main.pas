unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    function HighestElement(A: TArray<Integer>): Integer; overload;
    function HighestElement(A: TArray<Integer>; L, R: Integer): Integer; overload;
    procedure Sort(var A: TArray<Integer>);
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
  A := [0, 1, 2, 3, 4, 5, 9, 8, 7, 6];
  ShowMessage(A[HighestElement(A)].ToString);
  Sort(A);
end;

function TMainForm.HighestElement(A: TArray<Integer>): Integer;
begin
  Result := HighestElement(A, 0, Length(A));
end;

function TMainForm.HighestElement(A: TArray<Integer>; L, R: Integer): Integer;
var
  Middle, Curr, Prev, Next: Integer;
begin
  Middle := L + Round((R - L) / 2);

  Curr := A[Middle];
  Prev := A[Middle - 1];
  Next := A[Middle + 1];

  if (Curr > Prev) and (Curr > Next) then
    Exit(Middle);

  if Curr > Prev then
  begin
    Result := HighestElement(A, Middle, R - L);
    Exit;
  end;

  if Curr > Next then
  begin
    Result := HighestElement(A, 0, Middle);
    Exit;
  end;
end;

procedure TMainForm.Sort(var A: TArray<Integer>);
var
  FoundIndex, Size, Index, Aux: Integer;
  Slice: TArray<Integer>;
begin
  FoundIndex := HighestElement(A);
  Size := Length(A);

  for Index := FoundIndex to High(A) do
  begin
    Aux := A[Index];
    A[Index] := A[Size];
    A[Size] := Aux;

    Dec(Size);
  end;

end;

end.
