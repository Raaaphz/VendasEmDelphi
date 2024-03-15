object frmRelCadCliente: TfrmRelCadCliente
  Left = 0
  Top = 0
  Caption = 'RELATORIO CADASTRO CLIENTE'
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
    DataSource = dtsCliente
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
        Top = 16
        Width = 718
        Height = 24
        Align = faBottom
        Caption = 'LISTAGEM DE CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 40
        Width = 718
        Height = 35
        Align = faBottom
        DrawKind = dkLine
        Pen.Width = 2
      end
    end
    object rodape: TRLBand
      Left = 38
      Top = 180
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
    object RLBand1: TRLBand
      Left = 38
      Top = 144
      Width = 718
      Height = 36
      object RLDBText1: TRLDBText
        Left = 3
        Top = 14
        Width = 16
        Height = 16
        DataField = 'clienteId'
        DataSource = dtsCliente
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 25
        Top = 14
        Width = 38
        Height = 16
        DataField = 'Nome'
        DataSource = dtsCliente
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 344
        Top = 14
        Width = 35
        Height = 16
        DataField = 'email'
        DataSource = dtsCliente
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 613
        Top = 14
        Width = 49
        Height = 16
        DataField = 'telefone'
        DataSource = dtsCliente
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 31
      BandType = btColumnHeader
      object RLPanel1: TRLPanel
        Left = 0
        Top = 0
        Width = 718
        Height = 31
        Align = faClient
        Color = clInfoBk
        ParentColor = False
        Transparent = False
        object RLLabel4: TRLLabel
          Left = 3
          Top = 6
          Width = 16
          Height = 16
          Caption = 'ID'
          Transparent = False
        end
        object RLLabel5: TRLLabel
          Left = 25
          Top = 6
          Width = 43
          Height = 16
          Caption = 'NOME'
          Transparent = False
        end
        object RLLabel6: TRLLabel
          Left = 344
          Top = 6
          Width = 43
          Height = 16
          Caption = 'EMAIL'
          Transparent = False
        end
        object RLLabel7: TRLLabel
          Left = 613
          Top = 6
          Width = 72
          Height = 16
          Caption = 'TELEFONE'
          Transparent = False
        end
      end
    end
  end
  object qryCliente: TZQuery
    Connection = dtmPrincipal.ConectDB
    Active = True
    SQL.Strings = (
      'Select clientes.clienteId,'
      '       clientes.Nome,'
      '       clientes.email,'
      '       clientes.telefone'
      'from clientes'
      'order by clientes.clienteId')
    Params = <>
    Left = 704
    Top = 368
    object qryClienteclienteId: TIntegerField
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object qryClienteNome: TWideStringField
      FieldName = 'Nome'
      Size = 60
    end
    object qryClienteemail: TWideStringField
      FieldName = 'email'
      Size = 100
    end
    object qryClientetelefone: TWideStringField
      FieldName = 'telefone'
      Size = 14
    end
  end
  object dtsCliente: TDataSource
    DataSet = qryCliente
    Left = 704
    Top = 432
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.1.2 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 592
    Top = 424
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel 97-2013'
    Left = 592
    Top = 520
  end
  object RLXLSXFilter1: TRLXLSXFilter
    DisplayName = 'Planilha Excel'
    Left = 696
    Top = 520
  end
end
