object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Login'
  ClientHeight = 221
  ClientWidth = 441
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 46
    Width = 100
    Height = 30
    Caption = 'USU'#193'RIO:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 28
    Top = 96
    Width = 77
    Height = 30
    Caption = 'SENHA:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnFechar: TBitBtn
    Left = 160
    Top = 176
    Width = 81
    Height = 25
    Caption = 'FECHAR'
    TabOrder = 0
    OnClick = btnFecharClick
  end
  object btnAcessar: TBitBtn
    Left = 264
    Top = 176
    Width = 81
    Height = 25
    Caption = 'ACESSAR'
    TabOrder = 1
    OnClick = btnAcessarClick
  end
  object edtUsuario: TEdit
    Left = 111
    Top = 53
    Width = 298
    Height = 23
    TabOrder = 2
  end
  object edtSenha: TEdit
    Left = 111
    Top = 103
    Width = 298
    Height = 23
    PasswordChar = '*'
    TabOrder = 3
  end
end
