inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro do cliente'
  ClientWidth = 979
  ExplicitWidth = 991
  ExplicitHeight = 580
  TextHeight = 15
  inherited pnlRodape: TPanel
    Width = 979
    ExplicitTop = 477
    ExplicitWidth = 975
    inherited btnFechar: TBitBtn
      Left = 850
      ExplicitLeft = 846
    end
    inherited btnNavega: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcPrincipal: TPageControl
    Width = 979
    ActivePage = tabManutencao
    ExplicitWidth = 975
    ExplicitHeight = 477
    inherited tabListagem: TTabSheet
      ExplicitWidth = 971
      ExplicitHeight = 448
      inherited pnlListagemTopo: TPanel
        Width = 971
        ExplicitWidth = 971
      end
      inherited grdListagem: TDBGrid
        Width = 971
        Height = 367
        Columns = <
          item
            Expanded = False
            FieldName = 'clienteId'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 263
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cep'
            Width = 142
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'endereco'
            Width = 486
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 971
      ExplicitHeight = 448
      object Label1: TLabel
        Left = 504
        Top = 67
        Width = 21
        Height = 15
        Caption = 'CEP'
      end
      object Label2: TLabel
        Left = 504
        Top = 165
        Width = 44
        Height = 15
        Caption = 'Telefone'
      end
      object Label3: TLabel
        Left = 14
        Top = 261
        Width = 110
        Height = 15
        Caption = ' Data de Nascimento'
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
        MaxLength = 60
        TabOrder = 1
        Text = ''
      end
      object edtClienteId: TLabeledEdit
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
      object edtCEP: TMaskEdit
        Left = 500
        Top = 88
        Width = 316
        Height = 23
        EditMask = '99.999-999;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  .   -   '
      end
      object edtEndereco: TLabeledEdit
        Tag = 2
        Left = 14
        Top = 136
        Width = 443
        Height = 23
        EditLabel.Width = 49
        EditLabel.Height = 15
        EditLabel.Caption = 'Endereco'
        MaxLength = 60
        TabOrder = 3
        Text = ''
      end
      object edtBairro: TLabeledEdit
        Tag = 2
        Left = 500
        Top = 136
        Width = 316
        Height = 23
        EditLabel.Width = 31
        EditLabel.Height = 15
        EditLabel.Caption = 'Bairro'
        MaxLength = 40
        TabOrder = 4
        Text = ''
      end
      object edtCidade: TLabeledEdit
        Tag = 2
        Left = 14
        Top = 184
        Width = 443
        Height = 23
        EditLabel.Width = 37
        EditLabel.Height = 15
        EditLabel.Caption = 'Cidade'
        MaxLength = 50
        TabOrder = 5
        Text = ''
      end
      object edtTelefone: TMaskEdit
        Left = 500
        Top = 184
        Width = 313
        Height = 23
        EditMask = '(99)9999-9999;1;_'
        MaxLength = 13
        TabOrder = 6
        Text = '(  )    -    '
      end
      object edtEmail: TLabeledEdit
        Tag = 2
        Left = 14
        Top = 232
        Width = 443
        Height = 23
        EditLabel.Width = 29
        EditLabel.Height = 15
        EditLabel.Caption = 'Email'
        MaxLength = 100
        TabOrder = 7
        Text = ''
      end
      object edtDataNascimento: TDateEdit
        Left = 14
        Top = 282
        Width = 121
        Height = 23
        ClickKey = 114
        DialogTitle = 'Selecione a data'
        NumGlyphs = 2
        CalendarStyle = csDialog
        TabOrder = 8
      end
      object edtEstado: TLabeledEdit
        Tag = 2
        Left = 500
        Top = 232
        Width = 44
        Height = 23
        EditLabel.Width = 35
        EditLabel.Height = 15
        EditLabel.Caption = 'Estado'
        MaxLength = 60
        TabOrder = 9
        Text = ''
      end
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      
        'select clienteId, nome, endereco, cidade, bairro, estado, cep, t' +
        'elefone, email, datanascimento from clientes')
    object qryListagemclienteId: TIntegerField
      DisplayLabel = 'ID'
      DisplayWidth = 5
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object qryListagemnome: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 36
      FieldName = 'nome'
      Size = 60
    end
    object qryListagemendereco: TWideStringField
      DisplayLabel = 'Endereco'
      DisplayWidth = 36
      FieldName = 'endereco'
      Size = 60
    end
    object qryListagemcidade: TWideStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 25
      FieldName = 'cidade'
      Size = 50
    end
    object qryListagembairro: TWideStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 27
      FieldName = 'bairro'
      Size = 40
    end
    object qryListagemestado: TWideStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 5
      FieldName = 'estado'
      Size = 2
    end
    object qryListagemcep: TWideStringField
      DisplayLabel = 'CEP'
      DisplayWidth = 10
      FieldName = 'cep'
      Size = 10
    end
    object qryListagemtelefone: TWideStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 14
      FieldName = 'telefone'
      Size = 14
    end
    object qryListagememail: TWideStringField
      DisplayLabel = 'Email'
      DisplayWidth = 41
      FieldName = 'email'
      Size = 100
    end
    object qryListagemdatanascimento: TDateTimeField
      DisplayLabel = 'Data de nascimento'
      DisplayWidth = 18
      FieldName = 'datanascimento'
    end
  end
end
