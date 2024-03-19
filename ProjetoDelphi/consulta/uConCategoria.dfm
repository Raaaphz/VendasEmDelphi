inherited frmConCategoria: TfrmConCategoria
  Caption = 'Consulta de Categoria'
  TextHeight = 15
  inherited Panel2: TPanel
    inherited btnFechar: TBitBtn
      Left = 689
      ExplicitLeft = 685
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      ''
      'select categoriaId, descricao From categorias')
  end
end
