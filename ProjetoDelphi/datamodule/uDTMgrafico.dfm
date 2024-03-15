object dtmGrafico: TdtmGrafico
  Height = 480
  Width = 640
  object qryProdutoEstoque: TZQuery
    Connection = dtmPrincipal.ConectDB
    SQL.Strings = (
      
        'SELECT CONVERT (VARCHAR, produtoId)+'#39'-'#39'+nome AS Label, QUantidad' +
        'e As Value FROM produtos')
    Params = <>
    Left = 48
    Top = 24
    object qryProdutoEstoqueLabel: TWideStringField
      FieldName = 'Label'
      ReadOnly = True
      Size = 91
    end
    object qryProdutoEstoqueValue: TFloatField
      FieldName = 'Value'
    end
  end
  object dtsProdutoEstoque: TDataSource
    DataSet = qryProdutoEstoque
    Left = 152
    Top = 24
  end
  object qryValorVendaPorCliente: TZQuery
    Connection = dtmPrincipal.ConectDB
    SQL.Strings = (
      
        'SELECT CONVERT (VARCHAR, vendas.clienteId)+'#39'-'#39'+clientes.nome AS ' +
        'label, SUM(vendas.totalVenda)AS Value'
      'FROM vendas'
      'Inner Join clientes ON clientes.clienteId = vendas.clienteId'
      
        'WHERE vendas.dataVenda BETWEEN CONVERT(DATE, GETDATE()-7) and CO' +
        'NVERT(DATE, GETDATE())'
      'GROUP BY Vendas.clienteId, clientes.Nome')
    Params = <>
    Left = 112
    Top = 200
    object qryValorVendaPorClientelabel: TWideStringField
      FieldName = 'label'
      ReadOnly = True
      Size = 91
    end
    object qryValorVendaPorClienteValue: TFloatField
      FieldName = 'Value'
      ReadOnly = True
    end
  end
  object dtsValorVendaPorCliente: TDataSource
    DataSet = qryValorVendaPorCliente
    Left = 256
    Top = 192
  end
  object qryTopProdutosVendidos: TZQuery
    Connection = dtmPrincipal.ConectDB
    SQL.Strings = (
      
        'SELECT TOP 10 CONVERT (VARCHAR, vi.ProdutoId)+'#39'-'#39'+p.nome AS Labe' +
        'l, SUM(vi.totalProduto) AS Value'
      'FROM vendasItens as vi'
      ' INNER JOIN produtos AS P ON p.produtoId = vi.produtoId'
      ' GROUP BY vi.produtoId, p.nome')
    Params = <>
    Left = 112
    Top = 320
    object qryTopProdutosVendidosLabel: TWideStringField
      FieldName = 'Label'
      ReadOnly = True
      Size = 91
    end
    object qryTopProdutosVendidosValue: TFloatField
      FieldName = 'Value'
      ReadOnly = True
    end
  end
  object dtsTopProdutosVendidos: TDataSource
    DataSet = qryTopProdutosVendidos
    Left = 256
    Top = 320
  end
  object qryVendaUltimaSemana: TZQuery
    Connection = dtmPrincipal.ConectDB
    SQL.Strings = (
      
        'SELECT TOP 10 CONVERT (VARCHAR, vi.ProdutoId)+'#39'-'#39'+p.nome AS Labe' +
        'l, SUM(vi.totalProduto) AS Value'
      'FROM vendasItens as vi'
      ' INNER JOIN produtos AS P ON p.produtoId = vi.produtoId'
      ' GROUP BY vi.produtoId, p.nome'
      ''
      
        ' SELECT vendas.DataVenda AS Label, SUM(vendas.totalVenda) as Val' +
        'ue'
      ' from Vendas'
      
        ' WHERE vendas.datavenda BETWEEN CONVERT(DATE, GETDATE()-7) and C' +
        'ONVERT(DATE, GETDATE())'
      ' GROUP BY vendas.dataVenda')
    Params = <>
    Left = 368
    Top = 72
    object qryVendaUltimaSemanaLabel: TWideStringField
      FieldName = 'Label'
      ReadOnly = True
      Size = 91
    end
    object qryVendaUltimaSemanaValue: TFloatField
      FieldName = 'Value'
      ReadOnly = True
    end
  end
  object dtsVendaUltimaSemana: TDataSource
    DataSet = qryVendaUltimaSemana
    Left = 512
    Top = 72
  end
end
