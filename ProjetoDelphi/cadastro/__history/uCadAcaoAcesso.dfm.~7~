inherited frmCadAcaoAcesso: TfrmCadAcaoAcesso
  Caption = 'Cadastro de A'#231#227'o de Acesso'
  ClientHeight = 542
  ClientWidth = 858
  ExplicitWidth = 870
  TextHeight = 15
  inherited pnlRodape: TPanel
    Top = 478
    Width = 858
    ExplicitTop = 477
    DesignSize = (
      858
      64)
    inherited btnFechar: TBitBtn
      Left = 733
      ExplicitLeft = 729
    end
    inherited btnNavega: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcPrincipal: TPageControl
    Width = 858
    Height = 478
    ExplicitWidth = 854
    inherited tabListagem: TTabSheet
      ExplicitWidth = 850
      inherited pnlListagemTopo: TPanel
        Width = 850
        ExplicitWidth = 846
      end
      inherited grdListagem: TDBGrid
        Width = 850
        Columns = <
          item
            Expanded = False
            FieldName = 'acaoAcessoId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'chave'
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 850
      object edtAcaoAcessoid: TLabeledEdit
        Tag = 1
        Left = 14
        Top = 40
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
      object edtDescricao: TLabeledEdit
        Tag = 2
        Left = 14
        Top = 112
        Width = 787
        Height = 23
        EditLabel.Width = 51
        EditLabel.Height = 15
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 100
        TabOrder = 1
        Text = ''
      end
      object edtChave: TLabeledEdit
        Tag = 2
        Left = 14
        Top = 176
        Width = 787
        Height = 23
        EditLabel.Width = 33
        EditLabel.Height = 15
        EditLabel.Caption = 'Chave'
        MaxLength = 60
        TabOrder = 2
        Text = ''
      end
    end
  end
  inherited qryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'select acaoAcessoId, descricao, chave From acaoAcesso')
    object qryListagemacaoAcessoId: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'acaoAcessoId'
      ReadOnly = True
    end
    object qryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object qryListagemchave: TWideStringField
      DisplayLabel = 'Chave'
      FieldName = 'chave'
      Required = True
      Size = 60
    end
  end
end
