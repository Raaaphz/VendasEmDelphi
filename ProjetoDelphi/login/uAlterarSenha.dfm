object frmAlterarSenha: TfrmAlterarSenha
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'ALTERAR SENHA'
  ClientHeight = 282
  ClientWidth = 571
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Label2: TLabel
    Left = 104
    Top = 133
    Width = 144
    Height = 31
    Caption = 'NOVA SENHA:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 98
    Top = 55
    Width = 150
    Height = 29
    Caption = 'SENHA ATUAL:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 176
    Width = 240
    Height = 31
    Caption = 'CONFIRME SUA SENHA:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblUsuarioLogado: TLabel
    Left = 270
    Top = 8
    Width = 187
    Height = 30
    Caption = 'USUARIO LOGADO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 164
    Top = 8
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
  object edtSenhaNova: TEdit
    Left = 254
    Top = 140
    Width = 298
    Height = 24
    PasswordChar = '*'
    TabOrder = 0
  end
  object edtSenhaAtual: TEdit
    Left = 254
    Top = 62
    Width = 298
    Height = 22
    PasswordChar = '*'
    TabOrder = 1
  end
  object edtRepetirNovaSenha: TEdit
    Left = 254
    Top = 185
    Width = 298
    Height = 24
    PasswordChar = '*'
    TabOrder = 2
  end
  object btnFechar: TBitBtn
    Left = 209
    Top = 225
    Width = 81
    Height = 25
    Caption = 'FECHAR'
    TabOrder = 3
    OnClick = btnFecharClick
  end
  object btnAlterar: TBitBtn
    Left = 312
    Top = 225
    Width = 81
    Height = 25
    Caption = 'ALTERAR'
    TabOrder = 4
    OnClick = btnAlterarClick
  end
end
