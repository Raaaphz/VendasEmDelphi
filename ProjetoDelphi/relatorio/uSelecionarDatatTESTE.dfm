object frmSelecionarData: TfrmSelecionarData
  Left = 0
  Top = 0
  Caption = 'SELECIONAR DATA'
  ClientHeight = 117
  ClientWidth = 266
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Label3: TLabel
    Left = 8
    Top = 21
    Width = 75
    Height = 15
    Caption = ' Data de Inicio'
  end
  object Label1: TLabel
    Left = 135
    Top = 21
    Width = 55
    Height = 15
    Caption = ' Data Final'
  end
  object edtDataInicio: TDateEdit
    Left = 8
    Top = 42
    Width = 121
    Height = 23
    ClickKey = 114
    DialogTitle = 'Selecione a data'
    NumGlyphs = 2
    CalendarStyle = csDialog
    TabOrder = 0
  end
  object edtDataFinal: TDateEdit
    Left = 135
    Top = 42
    Width = 121
    Height = 23
    ClickKey = 114
    DialogTitle = 'Selecione a data'
    NumGlyphs = 2
    CalendarStyle = csDialog
    TabOrder = 1
  end
  object btnOK: TBitBtn
    Left = 10
    Top = 81
    Width = 248
    Height = 25
    Caption = 'CONFIRMAR'
    TabOrder = 2
    OnClick = btnOKClick
  end
end
