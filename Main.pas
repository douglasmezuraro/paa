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
    function HighestElement(A: TArray<Integer>): Integer;
  end;

var
  MainForm: TMainForm;

implementation

uses
  System.Generics.Collections, Math;

{$R *.dfm}

{ TMainForm }

procedure TMainForm.Button1Click(Sender: TObject);
const
  A: TArray<Integer> = [0, 1, 2, 3, 4, 5, 10, 9, 8, 7];
begin
  ShowMessage(HighestElement(A).ToString);
end;

function TMainForm.HighestElement(A: TArray<Integer>): Integer;
var
  Count, Middle, Curr, Prev, Next: Integer;
begin
  Count := Length(A);
  Middle := Round(Count / 2);
  Curr := A[Middle];
  Prev := A[Middle - 1];
  Next := A[Middle + 1];

  if (Curr > Prev) and (Curr > Next) then
    Exit(Curr);

  if Curr > Prev then
    A := Copy(A, Middle, Count - Middle);

  if Curr > Next then
    A := Copy(A, 0, Middle);

  Exit(HighestElement(A));
end;

end.
