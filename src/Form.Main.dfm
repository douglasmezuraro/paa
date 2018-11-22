object Main: TMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Primeiro trabalho de Projeto e An'#225'lise de algoritmos'
  ClientHeight = 562
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonExecute: TButton
    Left = 8
    Top = 70
    Width = 89
    Height = 25
    Action = ActionExecute
    TabOrder = 2
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
    TabOrder = 0
  end
  object Memo: TMemo
    Left = 103
    Top = 0
    Width = 681
    Height = 562
    Align = alRight
    Lines.Strings = (
      'Memo')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object ActionList: TActionList
    Left = 16
    Top = 104
    object ActionOpenInputFile: TAction
      Caption = '&Abrir entrada'
      OnExecute = ActionOpenInputFileExecute
    end
    object ActionTest: TAction
      Caption = '&Testar'
      OnExecute = ActionTestExecute
    end
    object ActionExecute: TAction
      Caption = '&Executar'
      OnExecute = ActionExecuteExecute
    end
  end
end
