object frmRelProVenda: TfrmRelProVenda
  Left = 0
  Top = 0
  Caption = 'RELATORIO VENDA'
  ClientHeight = 850
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Relatorio: TRLReport
    Left = 2
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dtsVenda
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 186
      Width = 718
      Height = 64
      DataSource = dtsVendaItens
      object RLBand4: TRLBand
        Left = 0
        Top = 25
        Width = 718
        Height = 41
        object RLLabel4: TRLLabel
          Left = 57
          Top = 0
          Width = 8
          Height = 16
          Caption = '-'
          Transparent = False
        end
        object RLDBText3: TRLDBText
          Left = 0
          Top = 0
          Width = 59
          Height = 16
          DataField = 'ProdutoId'
          DataSource = dtsVendaItens
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 65
          Top = 0
          Width = 38
          Height = 16
          DataField = 'Nome'
          DataSource = dtsVendaItens
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 345
          Top = 3
          Width = 67
          Height = 16
          DataField = 'quantidade'
          DataSource = dtsVendaItens
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 465
          Top = 3
          Width = 74
          Height = 16
          DataField = 'valorUnitario'
          DataSource = dtsVendaItens
          Text = ''
        end
        object RLDBText9: TRLDBText
          Left = 620
          Top = 3
          Width = 74
          Height = 16
          DataField = 'totalProduto'
          DataSource = dtsVendaItens
          Text = ''
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 25
        BandType = btHeader
        object RLLabel9: TRLLabel
          Left = 0
          Top = 3
          Width = 71
          Height = 16
          Caption = 'PRODUTO:'
          Transparent = False
        end
        object RLLabel11: TRLLabel
          Left = 345
          Top = 6
          Width = 91
          Height = 16
          Caption = 'QUANTIDADE:'
          Transparent = False
        end
        object RLLabel12: TRLLabel
          Left = 465
          Top = 6
          Width = 74
          Height = 16
          Caption = 'VALOR UN:'
          Transparent = False
        end
        object RLLabel13: TRLLabel
          Left = 619
          Top = 6
          Width = 96
          Height = 16
          Caption = 'VALOR TOTAL:'
          Transparent = False
        end
      end
    end
    object Cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 75
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 0
        Top = 32
        Width = 718
        Height = 26
        Align = faBottom
        Caption = 'VENDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 58
        Width = 718
        Height = 17
        Align = faBottom
        DrawKind = dkLine
        Pen.Width = 2
      end
    end
    object rodape: TRLBand
      Left = 38
      Top = 304
      Width = 718
      Height = 40
      BandType = btFooter
      object RLDraw2: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 21
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 3
        Top = 21
        Width = 60
        Height = 16
        Info = itFullDate
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 661
        Top = 21
        Width = 21
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 689
        Top = 21
        Width = 26
        Height = 16
        Info = itLastPageNumber
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 681
        Top = 21
        Width = 8
        Height = 16
        Caption = '/'
      end
      object RLLabel3: TRLLabel
        Left = 620
        Top = 21
        Width = 42
        Height = 16
        Alignment = taRightJustify
        Caption = 'pagina'
      end
    end
    object BandaGrupo: TRLGroup
      Left = 38
      Top = 113
      Width = 718
      Height = 73
      DataFields = 'DataVenda'
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 22
        BandType = btHeader
        Color = clSilver
        ParentColor = False
        Transparent = False
        object RLLabel8: TRLLabel
          Left = 3
          Top = 3
          Width = 53
          Height = 16
          Caption = 'VENDA:'
          Transparent = False
        end
        object RLDBText5: TRLDBText
          Left = 56
          Top = 3
          Width = 47
          Height = 16
          DataField = 'vendaId'
          DataSource = dtsVenda
          Text = ''
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 22
        Width = 718
        Height = 25
        object RLDBText1: TRLDBText
          Left = 64
          Top = 3
          Width = 25
          Height = 16
          DataField = 'clienteId'
          DataSource = dtsVenda
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 95
          Top = 3
          Width = 38
          Height = 16
          DataField = 'Nome'
          DataSource = dtsVenda
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 646
          Top = 3
          Width = 68
          Height = 16
          DataField = 'DataVenda'
          DataSource = dtsVenda
          Text = ''
        end
        object RLLabel5: TRLLabel
          Left = 3
          Top = 3
          Width = 61
          Height = 16
          Caption = 'CLIENTE:'
          Transparent = False
        end
        object RLLabel10: TRLLabel
          Left = 81
          Top = 3
          Width = 8
          Height = 16
          Caption = '-'
          Transparent = False
        end
        object RLLabel7: TRLLabel
          Left = 598
          Top = 3
          Width = 42
          Height = 16
          Caption = 'DATA:'
          Transparent = False
        end
      end
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 250
      Width = 718
      Height = 54
      BandType = btSummary
      object RLDraw4: TRLDraw
        Left = 432
        Top = 8
        Width = 286
        Height = 10
        DrawKind = dkLine
      end
      object RLLabel6: TRLLabel
        Left = 489
        Top = 18
        Width = 119
        Height = 16
        Caption = 'TOTAL DA VENDA:'
        Transparent = False
      end
      object RLDBResult2: TRLDBResult
        Left = 610
        Top = 18
        Width = 108
        Height = 16
        Alignment = taRightJustify
        DataField = 'TotalVenda'
        DataSource = dtsVenda
        Info = riSum
        Text = ''
      end
    end
  end
  object qryVenda: TZQuery
    Connection = dtmPrincipal.ConectDB
    SQL.Strings = (
      'SELECT vendas.vendaId,'
      'vendas.clienteId,'
      'clientes.Nome,'
      'vendas.DataVenda,'
      'vendas.TotalVenda'
      'From vendas'
      'inner join clientes on clientes.clienteId = vendas.clienteId'
      'where vendas.dataVenda between :DataInicio AND :DataFim'
      'order By vendas.dataVenda, clienteId')
    Params = <
      item
        DataType = ftDate
        Name = 'DataInicio'
        ParamType = ptInput
        Value = '01/02/2024'
      end
      item
        DataType = ftDate
        Name = 'DataFim'
        ParamType = ptInput
        Value = '05/03/2024'
      end>
    Left = 560
    Top = 432
    ParamData = <
      item
        DataType = ftDate
        Name = 'DataInicio'
        ParamType = ptInput
        Value = '01/02/2024'
      end
      item
        DataType = ftDate
        Name = 'DataFim'
        ParamType = ptInput
        Value = '05/03/2024'
      end>
    object qryVendavendaId: TIntegerField
      FieldName = 'vendaId'
      ReadOnly = True
    end
    object qryVendaclienteId: TIntegerField
      FieldName = 'clienteId'
      Required = True
    end
    object qryVendaNome: TWideStringField
      FieldName = 'Nome'
      Size = 60
    end
    object qryVendaDataVenda: TDateTimeField
      FieldName = 'DataVenda'
      Required = True
    end
    object qryVendaTotalVenda: TFloatField
      FieldName = 'TotalVenda'
      Required = True
    end
  end
  object dtsVenda: TDataSource
    DataSet = qryVenda
    Left = 616
    Top = 432
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.1.2 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 432
    Top = 424
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel 97-2013'
    Left = 288
    Top = 424
  end
  object RLXLSXFilter1: TRLXLSXFilter
    DisplayName = 'Planilha Excel'
    Left = 360
    Top = 424
  end
  object qryVendaItens: TZQuery
    Connection = dtmPrincipal.ConectDB
    SQL.Strings = (
      'SELECT VendasItens.vendaId,'
      '       vendasItens.ProdutoId,'
      '       produtos.Nome,'
      '       vendasItens.quantidade,'
      '       vendasItens.valorUnitario,'
      '       vendasItens.totalProduto'
      'from vendasItens'
      
        '     Inner Join produtos on produtos.produtoId = vendasItens.pro' +
        'dutoId'
      '     where vendasItens.vendaId =:vendaId'
      '     order by vendasItens.produtoId'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'vendaId'
        ParamType = ptUnknown
      end>
    Left = 560
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vendaId'
        ParamType = ptUnknown
      end>
    object qryVendaItensvendaId: TIntegerField
      FieldName = 'vendaId'
      Required = True
    end
    object qryVendaItensProdutoId: TIntegerField
      FieldName = 'ProdutoId'
      Required = True
    end
    object qryVendaItensNome: TWideStringField
      FieldName = 'Nome'
      Size = 60
    end
    object qryVendaItensquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
    object qryVendaItensvalorUnitario: TFloatField
      FieldName = 'valorUnitario'
      Required = True
    end
    object qryVendaItenstotalProduto: TFloatField
      FieldName = 'totalProduto'
      Required = True
    end
  end
  object dtsVendaItens: TDataSource
    DataSet = qryVendaItens
    Left = 640
    Top = 488
  end
end
