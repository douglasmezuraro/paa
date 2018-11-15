object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 187
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonExecute: TButton
    Left = 8
    Top = 70
    Width = 89
    Height = 25
    Action = ActionExecute
    TabOrder = 0
  end
  object ButtonTest: TButton
    Left = 8
    Top = 39
    Width = 89
    Height = 25
    Action = ActionTest
    TabOrder = 1
  end
  object ButtonOpenInputFile: TButton
    Left = 8
    Top = 8
    Width = 89
    Height = 25
    Action = ActionOpenInputFile
    TabOrder = 2
  end
  object mmo1: TMemo
    Left = 112
    Top = 8
    Width = 289
    Height = 161
    Lines.Strings = (
      'mmo1')
    TabOrder = 3
  end
  object ActionList: TActionList
    Left = 280
    Top = 32
    object ActionOpenInputFile: TAction
      Caption = 'Open input file'
      OnExecute = ActionOpenInputFileExecute
    end
    object ActionTest: TAction
      Caption = 'Test'
      OnExecute = ActionTestExecute
    end
    object ActionExecute: TAction
      Caption = 'Execute'
      OnExecute = ActionExecuteExecute
    end
  end
end
