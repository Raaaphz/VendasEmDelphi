inherited frmProVenda: TfrmProVenda
  Caption = 'Vendas'
  ClientWidth = 862
  ExplicitWidth = 874
  TextHeight = 15
  object Label4: TLabel [0]
    Left = 167
    Top = 45
    Width = 51
    Height = 15
    Caption = 'Categoria'
  end
  inherited pnlRodape: TPanel
    Width = 862
    ExplicitWidth = 858
    DesignSize = (
      862
      64)
    inherited btnFechar: TBitBtn
      Left = 717
      ExplicitLeft = 713
    end
    inherited btnNavega: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcPrincipal: TPageControl
    Width = 862
    ActivePage = tabManutencao
    ExplicitWidth = 858
    inherited tabListagem: TTabSheet
      ExplicitWidth = 854
      inherited pnlListagemTopo: TPanel
        Width = 854
        ExplicitWidth = 854
      end
      inherited grdListagem: TDBGrid
        Width = 854
        Columns = <
          item
            Expanded = False
            FieldName = 'vendaId'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'clienteId'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 418
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dataVenda'
            Width = 137
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'totalVenda'
            Width = 104
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 854
      object Label1: TLabel
        Left = 191
        Top = 4
        Width = 37
        Height = 15
        Caption = 'Cliente'
      end
      object Label3: TLabel
        Left = 654
        Top = 4
        Width = 75
        Height = 15
        Caption = 'Data da Venda'
      end
      object edtVendaId: TLabeledEdit
        Tag = 1
        Left = 1
        Top = 25
        Width = 121
        Height = 23
        EditLabel.Width = 79
        EditLabel.Height = 15
        EditLabel.Caption = 'N'#250'mero Venda'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
        Text = ''
      end
      object edtDataVenda: TDateEdit
        Left = 654
        Top = 25
        Width = 121
        Height = 23
        ClickKey = 114
        DialogTitle = 'Selecione a data'
        NumGlyphs = 2
        CalendarStyle = csDialog
        TabOrder = 2
      end
      object Panel1: TPanel
        Left = 0
        Top = 63
        Width = 854
        Height = 385
        Align = alBottom
        TabOrder = 3
        ExplicitTop = 62
        ExplicitWidth = 850
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 852
          Height = 59
          Align = alTop
          TabOrder = 0
          ExplicitWidth = 848
          object Label5: TLabel
            Left = 5
            Top = 3
            Width = 43
            Height = 15
            Caption = 'Produto'
          end
          object Label6: TLabel
            Left = 341
            Top = 3
            Width = 71
            Height = 15
            Caption = 'Valor Unit'#225'rio'
          end
          object Label7: TLabel
            Left = 428
            Top = 3
            Width = 62
            Height = 15
            Caption = 'Quantidade'
          end
          object Label8: TLabel
            Left = 516
            Top = 3
            Width = 88
            Height = 15
            Caption = 'Total do Produto'
          end
          object lkpProduto: TDBLookupComboBox
            Tag = 2
            Left = 5
            Top = 21
            Width = 335
            Height = 23
            KeyField = 'produtoId'
            ListField = 'nome'
            ListSource = dtmVenda.dtsProdutos
            TabOrder = 2
            OnExit = lkpProdutoExit
          end
          object edtValorUnitario: TCurrencyEdit
            Tag = 2
            Left = 341
            Top = 21
            Width = 81
            Height = 23
            DisplayFormat = ',0.00;-R$ ,0.00'
            TabOrder = 3
          end
          object edtQuantidade: TCurrencyEdit
            Tag = 2
            Left = 428
            Top = 20
            Width = 82
            Height = 23
            DisplayFormat = ',0.00;-R$ ,0.00'
            TabOrder = 4
            OnEnter = edtQuantidadeEnter
            OnExit = edtQuantidadeExit
          end
          object edtTotalProduto: TCurrencyEdit
            Tag = 2
            Left = 516
            Top = 20
            Width = 125
            Height = 23
            TabStop = False
            DisplayFormat = ',0.00;-R$ ,0.00'
            ParentColor = True
            ReadOnly = True
            TabOrder = 0
          end
          object btnAdicionar: TBitBtn
            Left = 653
            Top = 20
            Width = 92
            Height = 25
            Caption = 'A&DICIONAR'
            TabOrder = 5
            OnClick = btnAdicionarClick
          end
          object btnRemover: TBitBtn
            Left = 751
            Top = 20
            Width = 92
            Height = 25
            Caption = 'RE&MOVER'
            TabOrder = 1
            TabStop = False
            OnClick = btnRemoverClick
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 60
          Width = 852
          Height = 283
          Align = alClient
          TabOrder = 1
          ExplicitWidth = 848
          object dbGridItensVenda: TDBGrid
            Left = 1
            Top = 1
            Width = 850
            Height = 281
            Align = alClient
            DataSource = dtmVenda.dtsItensVendas
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDblClick = dbGridItensVendaDblClick
            OnKeyDown = dbGridItensVendaKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'produtoId'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NomeProduto'
                Width = 375
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'quantidade'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valorUnitario'
                Width = 124
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valorTotalProduto'
                Width = 156
                Visible = True
              end>
          end
        end
        object Panel4: TPanel
          Left = 1
          Top = 343
          Width = 852
          Height = 41
          Align = alBottom
          TabOrder = 2
          ExplicitWidth = 848
          object Label2: TLabel
            Left = 643
            Top = 15
            Width = 81
            Height = 15
            Caption = 'Valor da Venda'
            Color = clNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object edtValor: TCurrencyEdit
            Tag = 2
            Left = 730
            Top = 12
            Width = 121
            Height = 23
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      object lkpCliente: TDBLookupComboBox
        Tag = 2
        Left = 191
        Top = 25
        Width = 402
        Height = 23
        KeyField = 'clienteId'
        ListField = 'nome'
        ListSource = dtmVenda.dtsCliente
        TabOrder = 1
      end
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      'SELECT vendas.vendaId'
      '       ,vendas.clienteId'
      '       ,clientes.nome'
      '       ,vendas.dataVenda'
      '       ,vendas.totalVenda'
      '       FROM vendas'
      '  INNER JOIN clientes ON clientes.clienteId = vendas.clienteId')
    Left = 532
    Top = 2
    object qryListagemvendaId: TIntegerField
      DisplayLabel = 'N'#250'mero Venda'
      FieldName = 'vendaId'
      Origin = 'vendas'
      ReadOnly = True
    end
    object qryListagemclienteId: TIntegerField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'clienteId'
      Origin = 'vendas'
      Required = True
    end
    object qryListagemnome: TWideStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'nome'
      Origin = 'clientes'
      Size = 60
    end
    object qryListagemdataVenda: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'dataVenda'
      Origin = 'vendas'
      Required = True
    end
    object qryListagemtotalVenda: TFloatField
      DisplayLabel = 'Total da Venda'
      FieldName = 'totalVenda'
      Origin = 'vendas'
      Required = True
    end
  end
  inherited dtsListagem: TDataSource
    Left = 460
    Top = 2
  end
end
