inherited frmConProduto: TfrmConProduto
  Caption = 'frmConProduto'
  TextHeight = 15
  inherited Panel2: TPanel
    inherited btnFechar: TBitBtn
      Left = 681
      ExplicitLeft = 677
    end
  end
  inherited Panel3: TPanel
    inherited grdPesquisa: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'categoriaId'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'produtoId'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescricaoCategoria'
          Visible = True
        end>
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      'SELECT p.produtoId,'
      'p.nome,'
      'p.valor,'
      'p.descricao,'
      'p.quantidade,'
      'p.categoriaId,'
      'c.descricao As DescricaoCategoria'
      'From produtos as p'
      'left join categorias as c on c.categoriaId = p.categoriaId')
    object qryListagemprodutoId: TIntegerField
      DisplayLabel = ' ID'
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object qryListagemnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object qryListagemvalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
    end
    object qryListagemquantidade: TFloatField
      DisplayLabel = 'Quant'
      FieldName = 'quantidade'
    end
    object qryListagemDescricaoCategoria: TWideStringField
      DisplayLabel = 'Categoria'
      FieldName = 'DescricaoCategoria'
      Size = 30
    end
  end
end
