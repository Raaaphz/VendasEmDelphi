unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  RxToolEdit, cCadCliente, uEnum, uDTMConect, uFuncaoCriptografiaTESTE;

type
  TfrmCadCliente = class(TfrmHeranca)
    edtNome: TLabeledEdit;
    edtClienteId: TLabeledEdit;
    edtCEP: TMaskEdit;
    Label1: TLabel;
    edtEndereco: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtTelefone: TMaskEdit;
    Label2: TLabel;
    edtEmail: TLabeledEdit;
    edtDataNascimento: TDateEdit;
    Label3: TLabel;
    qryListagemclienteId: TIntegerField;
    qryListagemnome: TWideStringField;
    qryListagemendereco: TWideStringField;
    qryListagemcidade: TWideStringField;
    qryListagembairro: TWideStringField;
    qryListagemestado: TWideStringField;
    qryListagemcep: TWideStringField;
    qryListagemtelefone: TWideStringField;
    qryListagememail: TWideStringField;
    qryListagemdatanascimento: TDateTimeField;
    edtEstado: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    oCliente:TCliente;
    function Excluir:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation
{$R *.dfm}
{$region 'Override'}
procedure TfrmCadCliente.btnAlterarClick(Sender: TObject);
begin
  if oCliente.Selecionar(qryListagem.FieldByName('clienteId').AsInteger) then begin
     edtClienteId.Text:=IntToStr(oCliente.codigo);
     edtNome.Text :=oCliente.nome;
     edtCep.Text :=oCliente.cep;
     edtEndereco.Text :=oCliente.endereco;
     edtBairro.Text :=oCliente.bairro;
     edtEstado.Text :=oCliente.estado;
     edtCidade.Text :=oCliente.Cidade;
     edtTelefone.Text :=oCliente.telefone;
     edtEmail.Text :=oCliente.email;
     edtDataNascimento.Date:=oCliente.dataNascimento;

  end
  else begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;

end;

procedure TfrmCadCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataNascimento.Date:=Date;
  edtNome.SetFocus;
end;

function TfrmCadCliente.Excluir: Boolean;
begin
  if oCliente.Selecionar (QryListagem.FieldByName('clienteId').AsInteger) then begin
    Result:=oCliente.Apagar;
  end;
end;

procedure TfrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCliente) then
     FreeAndNil(oCliente);
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
  oCliente:=TCliente.Create(dtmPrincipal.ConectDB);

  IndiceAtual:='nome';
end;

function TfrmCadCliente.Gravar(EstadoDoCadastro: tEstadoDoCadastro): Boolean;
begin
  if edtClienteId.Text<>EmptyStr then
  oCliente.codigo:=StrToInt (edtClienteId.Text)

  else
    oCliente.codigo:=0;

    oCliente.nome :=edtNome.Text;
    oCliente.cep :=edtCEP.Text;
    oCliente.endereco :=edtEndereco.Text;
    oCliente.bairro :=edtBairro.Text;
    oCliente.estado :=edtEstado.Text;
    oCliente.cidade :=edtCidade.Text;
    oCliente.telefone :=edtTelefone.Text;
    oCliente.email :=edtEmail.Text;
    oCliente.datanascimento :=edtDataNascimento.Date;

    if (EstadoDoCadastro=ecNovo) then
    Result:=oCliente.Gravar
    else if(EstadoDoCadastro=ecAlterar) then
    Result:=oCliente.Atualizar;

end;
{$endregion}
end.
