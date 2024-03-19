inherited frmCadProduto: TfrmCadProduto
  Caption = 'Cadastro de Produto'
  ClientHeight = 497
  ExplicitHeight = 535
  TextHeight = 15
  inherited pnlRodape: TPanel
    Top = 433
    ExplicitTop = 432
    inherited btnFechar: TBitBtn
      Left = 733
      ExplicitLeft = 729
    end
    inherited btnNavega: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcPrincipal: TPageControl
    Height = 433
    ActivePage = tabManutencao
    ExplicitHeight = 432
    inherited tabListagem: TTabSheet
      ExplicitHeight = 403
      inherited pnlListagemTopo: TPanel
        ExplicitWidth = 846
      end
      inherited grdListagem: TDBGrid
        Height = 322
        Columns = <
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
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescricaoCategoria'
            Width = 220
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitHeight = 403
      object Label1: TLabel
        Left = 14
        Top = 117
        Width = 51
        Height = 15
        Caption = 'Descri'#231#227'o'
      end
      object Label2: TLabel
        Left = 14
        Top = 291
        Width = 26
        Height = 15
        Caption = 'Valor'
      end
      object Label3: TLabel
        Left = 178
        Top = 291
        Width = 62
        Height = 15
        Caption = 'Quantidade'
      end
      object Label4: TLabel
        Left = 463
        Top = 67
        Width = 51
        Height = 15
        Caption = 'Categoria'
      end
      object edtProdutoId: TLabeledEdit
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
      object edtNome: TLabeledEdit
        Tag = 2
        Left = 14
        Top = 88
        Width = 443
        Height = 23
        EditLabel.Width = 33
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome'
        MaxLength = 30
        TabOrder = 1
        Text = ''
      end
      object edtDescricao: TMemo
        Tag = 2
        Left = 14
        Top = 138
        Width = 819
        Height = 145
        Lines.Strings = (
          'edtDescricao')
        MaxLength = 255
        TabOrder = 3
      end
      object edtValor: TCurrencyEdit
        Tag = 2
        Left = 14
        Top = 312
        Width = 121
        Height = 23
        TabOrder = 4
      end
      object edtQuantidade: TCurrencyEdit
        Tag = 2
        Left = 178
        Top = 312
        Width = 121
        Height = 23
        DisplayFormat = ',0.00;-R$ ,0.00'
        TabOrder = 5
      end
      object lkpCategoria: TDBLookupComboBox
        Tag = 2
        Left = 463
        Top = 88
        Width = 370
        Height = 23
        KeyField = 'categoriaId'
        ListField = 'descricao'
        ListSource = dtsCategoria
        TabOrder = 2
      end
    end
  end
  inherited qryListagem: TZQuery
    Active = True
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
    Left = 724
    object qryListagemprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
      Origin = 'p'
      ReadOnly = True
    end
    object qryListagemnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Origin = 'p'
      Size = 60
    end
    object qryListagemvalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Origin = 'p'
    end
    object qryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Origin = 'p'
      Size = 255
    end
    object qryListagemquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
      Origin = 'p'
    end
    object qryListagemcategoriaId: TIntegerField
      DisplayLabel = 'ID Categoria'
      FieldName = 'categoriaId'
      Origin = 'p'
    end
    object qryListagemDescricaoCategoria: TWideStringField
      DisplayLabel = 'Desc. Categoria'
      FieldName = 'DescricaoCategoria'
      Origin = 'c.descricao'
      Size = 30
    end
  end
  object qryCategoria: TZQuery
    Connection = dtmPrincipal.ConectDB
    SQL.Strings = (
      'Select categoriaId, descricao from categorias')
    Params = <>
    Left = 628
    Top = 346
    object qryCategoriacategoriaId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object qryCategoriadescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dtsCategoria: TDataSource
    DataSet = qryCategoria
    Left = 716
    Top = 346
  end
end
