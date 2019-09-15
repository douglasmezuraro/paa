unit View.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions,
  FMX.ActnList, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, Impl.Algorithms,
  Impl.Conversions;

type
  TMain = class sealed(TForm)
    ActionList: TActionList;
    ActionExecute: TAction;
    PanelView: TPanel;
    GroupBoxInput: TGroupBox;
    EditInput: TEdit;
    GroupBoxOutput: TGroupBox;
    EditHighestElement: TEdit;
    EditSortedArray: TEdit;
    LabelSortedArray: TLabel;
    LabelHighestElement: TLabel;
    ButtonExecute: TButton;
    procedure ActionExecuteExecute(Sender: TObject);
  private
    function GetHighestElement: Integer;
    function GetInput: TArray<Integer>;
    function GetSortedArray: TArray<Integer>;
    procedure SetHighestElement(const Value: Integer);
    procedure SetInput(const Value: TArray<Integer>);
    procedure SetSortedArray(const Value: TArray<Integer>);
  public
    property Input: TArray<Integer> read GetInput write SetInput;
    property HighestElement: Integer read GetHighestElement write SetHighestElement;
    property SortedArray: TArray<Integer> read GetSortedArray write SetSortedArray;
  end;

implementation

{$R *.fmx}

procedure TMain.ActionExecuteExecute(Sender: TObject);
begin
  HighestElement := TAlgorithms.HighestElement(Input);
  SortedArray    := TAlgorithms.Sort(Input);
end;

function TMain.GetHighestElement: Integer;
begin
  Result := StrToIntDef(EditHighestElement.Text, TAlgorithms.NotFoundIndex);
end;

function TMain.GetInput: TArray<Integer>;
begin
  Result := TConversions.StringToArrayOfInteger(EditInput.Text);
end;

function TMain.GetSortedArray: TArray<Integer>;
begin
  Result := TConversions.StringToArrayOfInteger(EditSortedArray.Text);
end;

procedure TMain.SetHighestElement(const Value: Integer);
begin
  EditHighestElement.Text := Value.ToString;
end;

procedure TMain.SetInput(const Value: TArray<Integer>);
begin
  EditInput.Text := string.Format('[%s]', [TConversions.ArrayOfIntegerToString(Value)]);
end;

procedure TMain.SetSortedArray(const Value: TArray<Integer>);
begin
  EditSortedArray.Text := string.Format('[%s]', [TConversions.ArrayOfIntegerToString(Value)]);
end;

end.
