unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, cFuncao,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  RxToolEdit, RxCurrEdit, cCadProduto, uEnum, uDtmConect, uCadCategoria;

type
  TfrmCadProduto = class(TfrmHeranca)
    qryListagemprodutoId: TIntegerField;
    qryListagemnome: TWideStringField;
    qryListagemdescricao: TWideStringField;
    qryListagemvalor: TFloatField;
    qryListagemquantidade: TFloatField;
    qryListagemcategoriaId: TIntegerField;
    qryListagemDescricaoCategoria: TWideStringField;
    edtProdutoId: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtDescricao: TMemo;
    Label1: TLabel;
    edtValor: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    lkpCategoria: TDBLookupComboBox;
    qryCategoria: TZQuery;
    dtsCategoria: TDataSource;
    qryCategoriacategoriaId: TIntegerField;
    qryCategoriadescricao: TWideStringField;
    Label4: TLabel;
    spbIncluir: TSpeedButton;
    spbPesquisar: TSpeedButton;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbIncluirClick(Sender: TObject);
    procedure spbPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    oProduto:TProduto;
    function Excluir:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

uses uConCategoria, uPrincipal;
procedure TfrmCadProduto.btnAlterarClick(Sender: TObject);
begin
  if oProduto.Selecionar(qryListagem.FieldByName('produtoId').AsInteger) then begin
     edtProdutoId.Text :=IntToStr (oProduto.codigo);
     edtNome.Text :=oProduto.nome;
     edtDescricao.Text :=oProduto.descricao;
     lkpCategoria.KeyValue :=oProduto.categoriaId;
     edtValor.Value :=oProduto.valor;
     edtQuantidade.value :=oProduto.quantidade;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;

end;

procedure TfrmCadProduto.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

function TfrmCadProduto.Excluir: Boolean;
begin
  if oProduto.Selecionar(qryListagem.fieldbyname('produtoId').asInteger) then begin
    result:=oProduto.Apagar;
  end;
end;

procedure TfrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  QryCategoria.Close;
  if Assigned(oProduto) then
     FreeAndNil(oProduto);
end;

procedure TfrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;
  oproduto:=Tproduto.Create(dtmPrincipal.ConectDB);

  indiceAtual:='nome';
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  inherited;
  qryCategoria.Open;

end;

function TfrmCadProduto.Gravar(EstadoDoCadastro: tEstadoDoCadastro): Boolean;
begin
  if edtProdutoId.Text<>EmptyStr then
     oProduto.codigo:=StrToInt(edtProdutoId.Text)
  else
     oProduto.codigo:=0;

  oProduto.nome :=edtNome.Text;
  oProduto.descricao:=edtDescricao.Text;
  oProduto.categoriaId :=lkpCategoria.KeyValue;
  oProduto.valor :=edtValor.Value;
  oProduto.quantidade :=edtQuantidade.Value;

  if (EstadoDoCadastro=ecNovo) then
     Result:=oProduto.Gravar
  else if (estadoDoCadastro=ecAlterar) then
     Result:=oProduto.Atualizar;

end;

procedure TfrmCadProduto.spbIncluirClick(Sender: TObject);
begin
  inherited;
  Tfuncao.CriarForm(TfrmCadCategoria, oUsuarioLogado, DtmPrincipal.ConectDB);
  qryCategoria.Refresh;
end;

procedure TfrmCadProduto.spbPesquisarClick(Sender: TObject);
begin
  inherited;
  try
  frmConCategoria:=TfrmConCategoria.Create(self);

  if lkpCategoria.keyvalue<>null then
     frmConCategoria.aIniciarPesquisaID:=lkpCategoria.KeyValue;

  frmConCategoria.ShowModal;

  if frmConCategoria.aRetornarIdSelecionado<>Unassigned then
     lkpCategoria.KeyValue:=frmConCategoria.aRetornarIdSelecionado;

  finally
    frmConCategoria.Release;
  end;


end;

end.
