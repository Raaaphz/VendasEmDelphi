inherited frmConCliente: TfrmConCliente
  Caption = 'frmConCliente'
  ClientHeight = 467
  ClientWidth = 856
  ExplicitWidth = 868
  ExplicitHeight = 505
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 856
  end
  inherited Panel2: TPanel
    Top = 426
    Width = 856
    inherited btnFechar: TBitBtn
      Left = 764
    end
  end
  inherited Panel3: TPanel
    Width = 856
    Height = 383
    inherited grdPesquisa: TDBGrid
      Width = 854
      Height = 381
      Columns = <
        item
          Expanded = False
          FieldName = 'clienteId'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'endereco'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'cidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bairro'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'estado'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cep'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'telefone'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'email'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'datanascimento'
          Visible = False
        end>
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      
        'select clienteId, nome, endereco, cidade, bairro, estado, cep, t' +
        'elefone, email, datanascimento from clientes')
    object qryListagemclienteId: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object qryListagemnome: TWideStringField
      DisplayLabel = 'NOME'
      FieldName = 'nome'
      Size = 60
    end
    object qryListagemendereco: TWideStringField
      FieldName = 'endereco'
      Size = 60
    end
    object qryListagemcidade: TWideStringField
      DisplayLabel = 'CIDADE'
      FieldName = 'cidade'
      Size = 50
    end
    object qryListagembairro: TWideStringField
      FieldName = 'bairro'
      Size = 40
    end
    object qryListagemestado: TWideStringField
      DisplayLabel = 'UF'
      FieldName = 'estado'
      Size = 2
    end
    object qryListagemcep: TWideStringField
      FieldName = 'cep'
      Size = 10
    end
    object qryListagemtelefone: TWideStringField
      DisplayLabel = 'TELEFONE'
      FieldName = 'telefone'
      Size = 14
    end
    object qryListagememail: TWideStringField
      FieldName = 'email'
      Size = 100
    end
    object qryListagemdatanascimento: TDateTimeField
      FieldName = 'datanascimento'
    end
  end
end
