object frmRelCadProdutoComGrupoCategoria: TfrmRelCadProdutoComGrupoCategoria
  Left = 0
  Top = 0
  Caption = 'RELATORIO PRODUTO COM GRUPO CATEGORIAS'
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
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dtsProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object Cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 75
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 0
        Top = 34
        Width = 718
        Height = 24
        Align = faBottom
        Caption = 'LISTAGEM DE PRODUTOS'
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
      Top = 293
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
      Height = 180
      DataFields = 'categoriaId'
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
          Width = 83
          Height = 16
          Caption = 'CATEGORIA:'
          Transparent = False
        end
        object RLDBText5: TRLDBText
          Left = 86
          Top = 3
          Width = 27
          Height = 16
          DataField = 'categoriaId'
          DataSource = dtsProdutos
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 119
          Top = 3
          Width = 117
          Height = 16
          DataField = 'DescricaoCategoria'
          DataSource = dtsProdutos
          Text = ''
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 22
        Width = 718
        Height = 25
        BandType = btColumnHeader
        object RLPanel1: TRLPanel
          Left = 0
          Top = 0
          Width = 718
          Height = 25
          Align = faClient
          Color = clInfoBk
          ParentColor = False
          Transparent = False
          object RLLabel4: TRLLabel
            Left = 3
            Top = 6
            Width = 55
            Height = 16
            Caption = 'C'#211'DIGO'
            Transparent = False
          end
          object RLLabel5: TRLLabel
            Left = 88
            Top = 6
            Width = 43
            Height = 16
            Caption = 'NOME'
            Transparent = False
          end
          object RLLabel6: TRLLabel
            Left = 456
            Top = 6
            Width = 67
            Height = 16
            Caption = 'ESTOQUE'
            Transparent = False
          end
          object RLLabel7: TRLLabel
            Left = 651
            Top = 6
            Width = 48
            Height = 16
            Caption = 'VALOR'
            Transparent = False
          end
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 47
        Width = 718
        Height = 25
        object RLDBText1: TRLDBText
          Left = 3
          Top = 3
          Width = 57
          Height = 16
          DataField = 'produtoId'
          DataSource = dtsProdutos
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 88
          Top = 3
          Width = 38
          Height = 16
          DataField = 'Nome'
          DataSource = dtsProdutos
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 456
          Top = 3
          Width = 70
          Height = 16
          DataField = 'Quantidade'
          DataSource = dtsProdutos
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 651
          Top = 3
          Width = 34
          Height = 16
          DataField = 'Valor'
          DataSource = dtsProdutos
          Text = ''
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 72
        Width = 718
        Height = 33
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 608
          Top = 10
          Width = 109
          Height = 16
          Alignment = taRightJustify
          DataField = 'Quantidade'
          DataSource = dtsProdutos
          Info = riSum
          Text = ''
        end
        object RLDraw3: TRLDraw
          Left = 0
          Top = 0
          Width = 718
          Height = 10
          Align = faTop
          DrawKind = dkLine
        end
        object RLLabel9: TRLLabel
          Left = 383
          Top = 10
          Width = 225
          Height = 16
          Caption = 'QUANTIDADE TOTAL DO ESTOQUE:'
          Transparent = False
        end
      end
    end
  end
  object qryProdutos: TZQuery
    Connection = dtmPrincipal.ConectDB
    Active = True
    SQL.Strings = (
      'SELECT produtos.produtoId,'
      '       produtos.Nome,'
      '       produtos.descricao,'
      '       produtos.Valor,'
      '       produtos.Quantidade,'
      '       produtos.categoriaId,'
      '       categorias.descricao as DescricaoCategoria'
      '  FROM produtos'
      
        '  left join categorias on categorias.categoriaId = produtos.Cate' +
        'goriaId'
      'ORDER BY produtos.categoriaId, produtos.produtoId'
      '')
    Params = <>
    Left = 608
    Top = 592
    object qryProdutosprodutoId: TIntegerField
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object qryProdutosNome: TWideStringField
      FieldName = 'Nome'
      Size = 60
    end
    object qryProdutosValor: TFloatField
      FieldName = 'Valor'
    end
    object qryProdutosQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object qryProdutosdescricao: TWideStringField
      FieldName = 'descricao'
      Size = 255
    end
    object qryProdutoscategoriaId: TIntegerField
      FieldName = 'categoriaId'
    end
    object qryProdutosDescricaoCategoria: TWideStringField
      FieldName = 'DescricaoCategoria'
      Size = 30
    end
  end
  object dtsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 496
    Top = 592
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.1.2 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 192
    Top = 584
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel 97-2013'
    Left = 328
    Top = 584
  end
  object RLXLSXFilter1: TRLXLSXFilter
    DisplayName = 'Planilha Excel'
    Left = 696
    Top = 584
  end
end
