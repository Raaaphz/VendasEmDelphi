object frmHeranca: TfrmHeranca
  Left = 0
  Top = 0
  Caption = '..............'
  ClientHeight = 542
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnlRodape: TPanel
    Left = 0
    Top = 478
    Width = 854
    Height = 64
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 477
    ExplicitWidth = 850
    DesignSize = (
      854
      64)
    object btnNovo: TBitBtn
      Tag = 99
      Left = 18
      Top = 24
      Width = 81
      Height = 25
      Caption = '&NOVO'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnAlterar: TBitBtn
      Tag = 99
      Left = 100
      Top = 24
      Width = 81
      Height = 25
      Caption = '&ALTERAR'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnCancelar: TBitBtn
      Tag = 99
      Left = 182
      Top = 24
      Width = 81
      Height = 25
      Caption = '&CANCELAR'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnGravar: TBitBtn
      Tag = 99
      Left = 264
      Top = 24
      Width = 81
      Height = 25
      Caption = '&GRAVAR'
      TabOrder = 3
      OnClick = btnGravarClick
    end
    object btnApagar: TBitBtn
      Tag = 99
      Left = 346
      Top = 24
      Width = 81
      Height = 25
      Caption = 'APAGA&R'
      TabOrder = 4
      OnClick = btnApagarClick
    end
    object btnFechar: TBitBtn
      Left = 721
      Top = 24
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&FECHAR'
      TabOrder = 5
      OnClick = btnFecharClick
      ExplicitLeft = 717
    end
    object btnNavega: TDBNavigator
      Left = 440
      Top = 24
      Width = 240
      Height = 25
      DataSource = dtsListagem
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 6
    end
  end
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 854
    Height = 478
    ActivePage = tabListagem
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 850
    ExplicitHeight = 477
    object tabListagem: TTabSheet
      Caption = 'Listagem'
      ImageIndex = 1
      object pnlListagemTopo: TPanel
        Left = 0
        Top = 0
        Width = 846
        Height = 81
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 842
        object lblIndice: TLabel
          Left = 8
          Top = 9
          Width = 88
          Height = 15
          Caption = 'Campo Pesquisa'
        end
        object mskPesquisa: TMaskEdit
          Left = 8
          Top = 30
          Width = 353
          Height = 23
          TabOrder = 0
          Text = ''
          TextHint = 'Digite sua Pesquisa'
          OnChange = mskPesquisaChange
        end
        object btnPesquisar: TBitBtn
          Tag = 99
          Left = 367
          Top = 30
          Width = 106
          Height = 23
          Caption = '&Pesquisar'
          TabOrder = 1
          OnClick = btnPesquisarClick
        end
      end
      object grdListagem: TDBGrid
        Left = 0
        Top = 81
        Width = 846
        Height = 367
        Align = alClient
        DataSource = dtsListagem
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = grdListagemDblClick
        OnKeyDown = grdListagemKeyDown
        OnTitleClick = grdListagemTitleClick
      end
    end
    object tabManutencao: TTabSheet
      Tag = 2
      Caption = 'Manutencao'
    end
  end
  object qryListagem: TZQuery
    Connection = dtmPrincipal.ConectDB
    SQL.Strings = (
      'select categoriaId, descricao From categorias')
    Params = <>
    Left = 708
    Top = 42
  end
  object dtsListagem: TDataSource
    DataSet = qryListagem
    Left = 796
    Top = 42
  end
end
