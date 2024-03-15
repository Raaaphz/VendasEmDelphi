unit uUsuarioVsAcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids, uDTMConect,
  Vcl.StdCtrls, Vcl.Buttons;


type
  TfrmUsuarioVsAcoes = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    grdUsuarios: TDBGrid;
    grdAcoes: TDBGrid;
    qryUsuario: TZQuery;
    dtsUsuario: TDataSource;
    qryAcoes: TZQuery;
    dtsAcoes: TDataSource;
    qryUsuariousuarioId: TIntegerField;
    qryUsuarioNome: TWideStringField;
    btnFechar: TBitBtn;
    qryAcoesusuarioId: TIntegerField;
    qryAcoesacaoAcessoId: TIntegerField;
    qryAcoesdescricao: TWideStringField;
    qryAcoesativo: TBooleanField;
    procedure qryUsuarioAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure grdAcoesDblClick(Sender: TObject);
    procedure grdAcoesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
    procedure SelecionarAcoesAcessoPorUsuario;

  public
    { Public declarations }
  end;

var
  frmUsuarioVsAcoes: TfrmUsuarioVsAcoes;

implementation

{$R *.dfm}

{ TfrmUsuarioVsAcoes }

procedure TfrmUsuarioVsAcoes.grdAcoesDblClick(Sender: TObject);
var qry:TZquery;
    bmRegistroAtual:Tbookmark;
begin
  try
    qry:=TZQuery.Create(nil);
    qry.Connection:=DTMPrincipal.ConectDB;
    qry.SQL.Clear;
    qry.SQL.Add('UPDATE usuariosAcaoAcesso '+
                ' SET ativo=:ativo' +
                ' WHERE usuarioId=:usuarioId' +
                ' AND acaoAcessoId=:acaoAcessoId' );
    qry.ParamByName('usuarioId').AsInteger :=qryAcoes.FieldByName('usuarioId').asInteger;
    qry.ParamByName('acaoAcessoId').AsInteger :=qryAcoes.FieldByName('acaoAcessoId').asInteger;
    qry.ParamByName('ativo').AsBoolean :=not qryAcoes.FieldByName('ativo').AsBoolean;
    try
      dtmPrincipal.ConectDB.StartTransaction;
      qry.ExecSQL;
      DTMPrincipal.ConectDB.Commit;
    except
      DTMPrincipal.ConectDB.Rollback;
    end;

  finally
   SelecionarAcoesAcessoPorUsuario;
   qryAcoes.GotoBookmark(bmRegistroAtual);
   if Assigned(qry) then
   FreeAndNil(qry);
  end;
end;

procedure TfrmUsuarioVsAcoes.grdAcoesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not qryAcoes.FieldByName('ativo').AsBoolean then
  begin
    TDBGrid(sender).Canvas.Font.Color:= clWhite;
    TDBgrid(sender).Canvas.Brush.Color:= clRed;
  end;
  TDBGrid(sender).DefaultDrawDataCell(rect, TDBGrid(sender).Columns[datacol].Field, state);
end;

procedure TfrmUsuarioVsAcoes.btnFecharClick(Sender: TObject);
begin
close;
end;

procedure TfrmUsuarioVsAcoes.FormShow(Sender: TObject);
begin
  try
    qryUsuario.DisableControls;
    qryUsuario.Open;
    SelecionarAcoesAcessoPorUsuario;
  finally
    qryUsuario.EnableControls;
  end;

end;

procedure TfrmUsuarioVsAcoes.qryUsuarioAfterScroll(DataSet: TDataSet);
begin
   SelecionarAcoesAcessoPorUsuario;
end;

procedure TfrmUsuarioVsAcoes.SelecionarAcoesAcessoPorUsuario;
begin
  qryAcoes.Close;
  qryAcoes.ParamByName('usuarioId').AsInteger:=qryUsuario.FieldByName('usuarioID').AsInteger;
  qryAcoes.Open;
end;

end.
