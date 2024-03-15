object frmUsuarioVsAcoes: TfrmUsuarioVsAcoes
  Left = 0
  Top = 0
  Caption = 'Usu'#225'rios VS A'#231#245'es'
  ClientHeight = 552
  ClientWidth = 875
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 281
    Top = 0
    Height = 511
    ExplicitLeft = 344
    ExplicitTop = 368
    ExplicitHeight = 100
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 281
    Height = 511
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 510
    object grdUsuarios: TDBGrid
      Left = 1
      Top = 1
      Width = 279
      Height = 509
      Align = alClient
      DataSource = dtsUsuario
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'usuarioId'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nome'
          Width = 175
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 511
    Width = 875
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 510
    ExplicitWidth = 871
    DesignSize = (
      875
      41)
    object btnFechar: TBitBtn
      Left = 780
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&FECHAR'
      TabOrder = 0
      OnClick = btnFecharClick
      ExplicitLeft = 776
    end
  end
  object Panel2: TPanel
    Left = 284
    Top = 0
    Width = 591
    Height = 511
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 587
    ExplicitHeight = 510
    object grdAcoes: TDBGrid
      Left = 1
      Top = 1
      Width = 589
      Height = 509
      Align = alClient
      DataSource = dtsAcoes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = grdAcoesDrawColumnCell
      OnDblClick = grdAcoesDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'usuarioId'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'acaoAcessoId'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Width = 535
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ativo'
          Visible = True
        end>
    end
  end
  object qryUsuario: TZQuery
    Connection = dtmPrincipal.ConectDB
    AfterScroll = qryUsuarioAfterScroll
    Active = True
    SQL.Strings = (
      'SELECT usuarioId,'
      '       Nome'
      'From usuarios')
    Params = <>
    Left = 64
    Top = 440
    object qryUsuariousuarioId: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'usuarioId'
      ReadOnly = True
    end
    object qryUsuarioNome: TWideStringField
      FieldName = 'Nome'
      Required = True
      Size = 50
    end
  end
  object dtsUsuario: TDataSource
    DataSet = qryUsuario
    Left = 128
    Top = 440
  end
  object qryAcoes: TZQuery
    Connection = dtmPrincipal.ConectDB
    SQL.Strings = (
      'SELECT ua.usuarioId,'
      '       ua.acaoAcessoId,'
      '       a.descricao,'
      '       ua.ativo'
      'From usuariosAcaoAcesso AS ua'
      '  Inner JOIN acaoAcesso AS a ON a.acaoAcessoId = ua.acaoAcessoId'
      'WHERE ua.usuarioId=:usuarioId')
    Params = <
      item
        DataType = ftUnknown
        Name = 'usuarioId'
        ParamType = ptUnknown
      end>
    Left = 544
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'usuarioId'
        ParamType = ptUnknown
      end>
    object qryAcoesusuarioId: TIntegerField
      FieldName = 'usuarioId'
      Required = True
    end
    object qryAcoesacaoAcessoId: TIntegerField
      FieldName = 'acaoAcessoId'
      Required = True
    end
    object qryAcoesdescricao: TWideStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object qryAcoesativo: TBooleanField
      FieldName = 'ativo'
      Required = True
    end
  end
  object dtsAcoes: TDataSource
    DataSet = qryAcoes
    Left = 600
    Top = 440
  end
end
