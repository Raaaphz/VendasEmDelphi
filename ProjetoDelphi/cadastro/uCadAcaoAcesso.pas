unit uCadAcaoAcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, cAcaoAcesso, uEnum, uDtmConect;

type
  TfrmCadAcaoAcesso = class(TfrmHeranca)
    qryListagemacaoAcessoId: TIntegerField;
    qryListagemdescricao: TWideStringField;
    qryListagemchave: TWideStringField;
    edtAcaoAcessoid: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    edtChave: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    oAcaoAcesso:TAcaoAcesso;
    function Excluir:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
  end;

var
  frmCadAcaoAcesso: TfrmCadAcaoAcesso;

implementation

{$R *.dfm}

{ TfrmCadAcaoAcesso }

procedure TfrmCadAcaoAcesso.btnAlterarClick(Sender: TObject);
begin
if oAcaoAcesso.Selecionar(qryListagem.FieldByName('acaoAcessoId').AsInteger) then begin
edtacaoAcessoId.text:=IntToStr(oAcaoAcesso.codigo);
edtDescricao.Text :=oAcaoAcesso.Descricao;
edtchave.Text :=oAcaoAcesso.Chave;
end
else begin
  btnCancelar.Click;
  abort;
end;
  inherited;

end;

procedure TfrmCadAcaoAcesso.btnGravarClick(Sender: TObject);
begin

  if edtacaoAcessoId.text<>EmptyStr then
  oAcaoAcesso.Codigo:=StrToInt(edtAcaoAcessoId.Text)
  else
    oacaoAcesso.codigo:=0;

  oAcaoAcesso.descricao :=edtDescricao.Text;
  oAcaoAcesso.chave :=edtChave.Text;

  if oAcaoAcesso.ChaveExiste(edtChave.text, oacaoAcesso.codigo) then begin
    MessageDLG('Chave já cadastrado', mtInformation, [mbok],0);
    edtChave.SetFocus;
    abort;
  end;

  inherited;
end;

procedure TfrmCadAcaoAcesso.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;

end;

function TfrmCadAcaoAcesso.Excluir: Boolean;
begin
    if oAcaoAcesso.Selecionar(qryListagem.FieldByName('acaoAcessoId').AsInteger) then begin
    result:=oAcaoAcesso.Apagar;
    end;
end;

function TfrmCadAcaoAcesso.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
   begin
    if (EstadoDoCadastro=ecNovo) then
    Result:=oAcaoAcesso.Gravar
    else if(EstadoDoCadastro=ecAlterar) then
    Result:=oAcaoAcesso.Atualizar;
  end;

procedure TfrmCadAcaoAcesso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Assigned(oAcaoAcesso) then
  freeAndNil(oAcaoAcesso);

end;

procedure TfrmCadAcaoAcesso.FormCreate(Sender: TObject);
begin
  inherited;
  oAcaoAcesso:=TAcaoAcesso.Create(DTMPrincipal.ConectDb);
  IndiceAtual:='descricao';
end;

end.
