object frmVendaPorData: TfrmVendaPorData
  Left = 0
  Top = 0
  Caption = 'RELATORIO VENDA POR DATA'
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
    DataSource = dtsVenda
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
        Caption = 'LISTAGEM DE VENDA POR DATA'
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
      Top = 297
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
      Height = 112
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
          Width = 42
          Height = 16
          Caption = 'DATA:'
          Transparent = False
        end
        object RLDBText5: TRLDBText
          Left = 45
          Top = 3
          Width = 68
          Height = 16
          DataField = 'DataVenda'
          DataSource = dtsVenda
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
          object RLLabel7: TRLLabel
            Left = 646
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
          Width = 52
          Height = 16
          DataField = 'clienteId'
          DataSource = dtsVenda
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 88
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
          Width = 69
          Height = 16
          DataField = 'TotalVenda'
          DataSource = dtsVenda
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
          Left = 609
          Top = 10
          Width = 108
          Height = 16
          Alignment = taRightJustify
          DataField = 'TotalVenda'
          DataSource = dtsVenda
          Info = riSum
          Text = ''
        end
        object RLDraw3: TRLDraw
          Left = 488
          Top = 0
          Width = 230
          Height = 10
          DrawKind = dkLine
        end
        object RLLabel9: TRLLabel
          Left = 511
          Top = 10
          Width = 97
          Height = 16
          Caption = 'TOTAL VENDA:'
          Transparent = False
        end
      end
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 225
      Width = 718
      Height = 72
      BandType = btSummary
      object RLDraw4: TRLDraw
        Left = 3
        Top = 8
        Width = 715
        Height = 10
        DrawKind = dkLine
      end
      object RLLabel6: TRLLabel
        Left = 514
        Top = 18
        Width = 96
        Height = 16
        Caption = 'TOTAL GERAL:'
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
    Active = True
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
    Left = 608
    Top = 592
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
