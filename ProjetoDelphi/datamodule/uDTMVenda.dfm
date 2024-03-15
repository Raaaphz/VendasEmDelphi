object dtmVenda: TdtmVenda
  Height = 272
  Width = 780
  object qryCliente: TZQuery
    Connection = dtmPrincipal.ConectDB
    Active = True
    SQL.Strings = (
      '   SELECT clienteId,'
      '   nome'
      '   From clientes')
    Params = <>
    Left = 24
    Top = 24
    object qryClienteclienteId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object qryClientenome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
  end
  object qryProdutos: TZQuery
    Connection = dtmPrincipal.ConectDB
    Active = True
    SQL.Strings = (
      'SELECT produtoId,'
      '       nome,'
      '       valor,'
      '       quantidade'
      'FROM produtos')
    Params = <>
    Left = 96
    Top = 24
    object qryProdutosprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object qryProdutosnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object qryProdutosvalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
    end
    object qryProdutosquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
    end
  end
  object cdsItensVendas: TClientDataSet
    PersistDataPacket.Data = {
      8F0000009619E0BD0100000018000000050000000000030000008F000970726F
      6475746F496404000100000000000B4E6F6D6550726F6475746F010049000000
      01000557494454480200020014000A7175616E74696461646508000400000000
      000D76616C6F72556E69746172696F08000400000000001176616C6F72546F74
      616C50726F6475746F08000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'produtoId'
        DataType = ftInteger
      end
      item
        Name = 'NomeProduto'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'quantidade'
        DataType = ftFloat
      end
      item
        Name = 'valorUnitario'
        DataType = ftFloat
      end
      item
        Name = 'valorTotalProduto'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 184
    Top = 24
    object cdsItensVendasprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
    end
    object cdsItensVendasNomeProduto: TStringField
      DisplayLabel = 'Nome do Produto'
      FieldName = 'NomeProduto'
    end
    object cdsItensVendasquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
    end
    object cdsItensVendasvalorUnitario: TFloatField
      DisplayLabel = 'Valor Unitario'
      FieldName = 'valorUnitario'
    end
    object cdsItensVendasvalorTotalProduto: TFloatField
      DisplayLabel = 'Total do Produto'
      FieldName = 'valorTotalProduto'
    end
    object cdsItensVendasvalorTotalVenda: TAggregateField
      FieldName = 'valorTotalVenda'
      DisplayName = ''
      Expression = 'SUM(ValorTotalProduto)'
    end
  end
  object dtsCliente: TDataSource
    DataSet = qryCliente
    Left = 24
    Top = 96
  end
  object dtsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 96
    Top = 96
  end
  object dtsItensVendas: TDataSource
    DataSet = cdsItensVendas
    Left = 184
    Top = 96
  end
end
