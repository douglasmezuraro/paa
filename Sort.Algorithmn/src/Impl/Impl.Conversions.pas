unit Impl.Conversions;

interface

uses
  System.SysUtils;

type
  TConversions = class sealed
  public
    class function StringToArrayOfInteger(const Value: string): TArray<Integer>;
    class function ArrayOfIntegerToString(const Value: TArray<Integer>): string;
  end;

implementation

{ TConversions }

class function TConversions.ArrayOfIntegerToString(const Value: TArray<Integer>): string;
var
  Element: Integer;
begin
  for Element in Value do
  begin
    if Result.Trim.IsEmpty then
      Result := Element.ToString
    else
      Result := Result + ', ' + Element.ToString;
  end;
end;

class function TConversions.StringToArrayOfInteger(const Value: string): TArray<Integer>;
var
  Index: Integer;
  LArray: TArray<string>;
begin
  try
    LArray := Value.Trim.Replace(' ', string.Empty).Split([',']);
    SetLength(Result, Length(LArray));

    for Index := Low(LArray) to High(LArray) do
      Result[Index] := LArray[Index].ToInteger;
  except
    on E: Exception do
    begin
      SetLength(Result, 0);
    end;
  end;
end;

end.
