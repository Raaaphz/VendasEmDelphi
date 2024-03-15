unit uCadCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, cCadCategoria, uDTMConect, uEnum;

type
  TfrmCadCategoria = class(TfrmHeranca)
    qryListagemcategoriaId: TIntegerField;
    qryListagemdescricao: TWideStringField;
    edtCategoriaid: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    oCategoria:TCategoria;
    function Excluir:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}

procedure TfrmCadCategoria.btnAlterarClick(Sender: TObject);
begin
  if oCategoria.Selecionar(qryListagem.FieldByName('categoriaId').AsInteger) then begin
     edtCategoriaId.Text:=IntToStr(oCategoria.codigo);
     edtDescricao.Text :=oCategoria.descricao;
  end
  else begin
    btnCancelar.Click;
    abort;
  end;
  inherited;

end;

procedure TfrmCadCategoria.btnGravarClick(Sender: TObject);
begin
if (edtDescricao.Text=emptystr) then begin
  showmessage ('Campo Obrigatorio');
  edtDescricao.SetFocus;
  abort;
end;
  inherited;

end;

function TfrmCadCategoria.Excluir: Boolean;
begin
if ocategoria.selecionar (qryListagem.FieldByName('categoriaId').AsInteger) then begin
 Result:=oCategoria.Apagar
end;
end;

procedure TfrmCadCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCategoria) then
  FreeAndNil(oCategoria);
end;

procedure TfrmCadCategoria.FormCreate(Sender: TObject);
begin
  inherited;
  oCategoria:=TCategoria.Create(dtmPrincipal.ConectDB	);
  IndiceAtual:='descricao';
end;

function TfrmCadCategoria.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtCategoriaId.Text<>EmptyStr then
    oCategoria.codigo:= StrToInt (edtCategoriaId.Text)
  else
    oCategoria.codigo:=0;

    oCategoria.descricao:=edtDescricao.Text;

  if (EstadoDoCadastro=ecNovo) then
      result:=oCategoria.Gravar
  else if(estadodocadastro=ecalterar) then
       Result:=oCategoria.Atualizar;

  end;

end.
