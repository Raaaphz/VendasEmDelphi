inherited frmCadUsuario: TfrmCadUsuario
  Caption = 'frmCadUsuario'
  ClientHeight = 403
  ClientWidth = 781
  ExplicitWidth = 793
  ExplicitHeight = 441
  TextHeight = 15
  inherited pnlRodape: TPanel
    Top = 339
    Width = 781
    ExplicitTop = 338
    ExplicitWidth = 777
    inherited btnFechar: TBitBtn
      Left = 679
      ExplicitLeft = 675
    end
    inherited btnNavega: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcPrincipal: TPageControl
    Width = 781
    Height = 339
    ExplicitWidth = 777
    ExplicitHeight = 338
    inherited tabListagem: TTabSheet
      ExplicitWidth = 773
      ExplicitHeight = 309
      inherited pnlListagemTopo: TPanel
        Width = 773
        ExplicitWidth = 773
      end
      inherited grdListagem: TDBGrid
        Width = 773
        Height = 228
        Columns = <
          item
            Expanded = False
            FieldName = 'usuarioId'
            Width = 134
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 613
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 773
      ExplicitHeight = 309
      object edtUsuarioId: TLabeledEdit
        Tag = 1
        Left = 3
        Top = 24
        Width = 121
        Height = 23
        EditLabel.Width = 39
        EditLabel.Height = 15
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
        Text = ''
      end
      object edtNome: TLabeledEdit
        Tag = 2
        Left = 3
        Top = 64
        Width = 759
        Height = 23
        EditLabel.Width = 33
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome'
        MaxLength = 50
        TabOrder = 1
        Text = ''
      end
      object edtSenha: TLabeledEdit
        Tag = 2
        Left = 3
        Top = 112
        Width = 420
        Height = 23
        EditLabel.Width = 32
        EditLabel.Height = 15
        EditLabel.Caption = 'Senha'
        MaxLength = 40
        PasswordChar = '*'
        TabOrder = 2
        Text = ''
      end
    end
  end
  inherited qryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'select usuarioId,'
      '       nome,'
      '       senha'
      'from usuarios')
    Left = 524
    Top = 18
    object qryListagemusuarioId: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'usuarioId'
      ReadOnly = True
    end
    object qryListagemnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object qryListagemsenha: TWideStringField
      DisplayLabel = 'Senha'
      FieldName = 'senha'
      Required = True
      Size = 40
    end
  end
  inherited dtsListagem: TDataSource
    Left = 604
    Top = 18
  end
end
