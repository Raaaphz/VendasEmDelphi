unit uProVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, cFuncao, uCadProduto,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  RxToolEdit, RxCurrEdit, uEnum, uDtmConect, cProVenda, uDtmVenda, uRelProVenda, uCadCliente;


type
  TfrmProVenda = class(TfrmHeranca)
    qryListagemvendaId: TIntegerField;
    qryListagemclienteId: TIntegerField;
    qryListagemnome: TWideStringField;
    qryListagemdataVenda: TDateTimeField;
    qryListagemtotalVenda: TFloatField;
    edtVendaId: TLabeledEdit;
    Label4: TLabel;
    Label1: TLabel;
    edtDataVenda: TDateEdit;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    edtValor: TCurrencyEdit;
    Label2: TLabel;
    dbGridItensVenda: TDBGrid;
    lkpCliente: TDBLookupComboBox;
    Label5: TLabel;
    lkpProduto: TDBLookupComboBox;
    edtValorUnitario: TCurrencyEdit;
    Label6: TLabel;
    edtQuantidade: TCurrencyEdit;
    edtTotalProduto: TCurrencyEdit;
    btnAdicionar: TBitBtn;
    btnRemover: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    spbIncluir: TSpeedButton;
    spbPesquisar: TSpeedButton;
    spbIncluirCliente: TSpeedButton;
    spbPesquisarCliente: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGridItensVendaKeyDown(Sender: TObject; var Key: Word; shift: TShiftState);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure lkpProdutoExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure dbGridItensVendaDblClick(Sender: TObject);
    procedure spbIncluirClick(Sender: TObject);
    procedure spbPesquisarClick(Sender: TObject);
    procedure spbIncluirClienteClick(Sender: TObject);
    procedure spbPesquisarClienteClick(Sender: TObject);
  private
    { Private declarations }
    dtmVenda:TdtmVenda;
    oVenda:TVenda;
    Function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
    function Excluir:Boolean; override;
    function TotalizarProduto(valorUnitario, Quantidade: Double): Double;
    procedure LimparComponenteItem;
    procedure LimparCds;
    procedure CarregarRegistroSelecionado;
    function TotalizarVenda: Double;
  public
    { Public declarations }
  end;

var
  frmProVenda: TfrmProVenda;

implementation
uses uprincipal, uConProduto, uConCliente;

{$R *.dfm}


function TfrmProVenda.Excluir: Boolean;
begin
    if oVenda.Selecionar(qryListagem.fieldbyname('vendaId').asInteger, dtmVenda.cdsItensVendas) then begin
       Result:=oVenda.Apagar;
    end;
end;

procedure TfrmProVenda.btnAdicionarClick(Sender: TObject);
begin
  inherited;

  if not dtmVenda.cdsItensVendas.Active then
    dtmVenda.cdsItensVendas.Open;

  if lkpProduto.KeyValue=Null then begin
     MessageDlg('Produto � um campo obrigat�rio' ,mtInformation, [mbOK], 0);
     lkpProduto.SetFocus;
     abort;
  end;

  if edtValorUnitario.Value<=0 then begin
     MessageDlg('Valor Unitario nao pode ser ZERO' ,mtInformation, [mbOK],0);
     edtValorUnitario.SetFocus;
     abort;
  end;

  if edtQuantidade.Value<=0 then begin
     MessageDlg('Quantidade nao pode ser ZERO' ,mtInformation, [mbOK], 0);
     edtQuantidade.SetFocus;
     abort;
  end;

  if dtmVenda.cdsItensVendas.Locate('produtoId', lkpProduto.KeyValue, []) then begin
     MessageDlg ('Este Produto ja foi selecionado' ,mtInformation, [mbOK],0);
     lkpProduto.SetFocus;
     abort;
  end;

  edtTotalProduto.Value:= TotalizarProduto (edtValorUnitario.Value, edtQuantidade.Value);

  dtmVenda.cdsItensVendas.Append;
  dtmVenda.cdsItensVendas.FieldByName('produtoId').AsString:=lkpProduto.KeyValue;
  dtmVenda.cdsItensVendas.FieldByName('nomeProduto').AsString:=dtmVenda.qryProdutos.FieldByName('nome').AsString;
  dtmVenda.cdsItensVendas.FieldByName('quantidade').AsFloat:=edtQuantidade.Value;
  dtmVenda.cdsItensVendas.FieldByName('valorUnitario').AsFloat:=edtValorUnitario.value;
  dtmVenda.cdsItensVendas.FieldByName('valorTotalProduto').AsFloat:=edtTotalProduto.Value;
  dtmVenda.cdsItensVendas.Post;
  edtValor.Value:=TotalizarVenda;
  LimparComponenteItem;

  lkpProduto.SetFocus;
end;

procedure TfrmProVenda.LimparComponenteItem;
begin
  lkpProduto.KeyValue :=null;
  edtQuantidade.Value :=0;
  edtValorUnitario.Value :=0;
  edtTotalproduto.Value :=0;
end;

procedure TfrmProVenda.LimparCds;
begin
  dtmVenda.cdsItensVendas.First;
  while not dtmVenda.cdsItensVendas.EOF do
  dtmVenda.cdsItensVendas.Delete;
end;

function TfrmProVenda.TotalizarProduto(valorUnitario, Quantidade:Double):Double;
begin
  result:=valorUnitario * Quantidade;
end;

procedure TfrmProVenda.btnAlterarClick(Sender: TObject);
begin
  if oVenda.Selecionar(qryListagem.FieldByName('vendaId').AsInteger, dtmVenda.cdsItensVendas) then begin
     edtVendaId.Text :=IntToStr(oVenda.VendaId);
     lkpCliente.KeyValue :=oVenda.ClienteId;
     edtDataVenda.Date :=oVenda.DataVenda;
     edtValor.Value :=oVenda.TotalVenda;
  end
  else begin
     btnCancelar.Click;
     abort;
  end;

  inherited;
end;

procedure TfrmProVenda.btnCancelarClick(Sender: TObject);
begin
  inherited;
  LimparCds;
end;

procedure TfrmProVenda.btnGravarClick(Sender: TObject);
begin
  inherited;
  LimparCds;
end;

procedure TfrmProVenda.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataVenda.Date:=Date;
  lkpCliente.SetFocus;
  limparCds;
end;

procedure TfrmProVenda.btnRemoverClick(Sender: TObject);
begin
  inherited;
  if lkpProduto.KeyValue=null then begin
     messageDlg('Selecione o Produto a ser excluido', mtInformation, [mbOK], 0);
     dbgridItensvenda.SetFocus;
     abort;
  end;

  if dtmVenda.cdsItensVendas.Locate('produtoId', lkpProduto.KeyValue, []) then begin
     dtmVenda.cdsItensVendas.Delete;
     edtValor.Value:=TotalizarVenda;
     limparComponenteItem;
  end;
end;

procedure TfrmProVenda.dbGridItensVendaDblClick(Sender: TObject);
begin
  inherited;
  CarregarRegistroSelecionado;
end;

procedure TfrmProVenda.dbGridItensVendaKeyDown(Sender: TObject; var Key: Word;
  shift: TShiftState);
begin
  inherited;
  BloqueiaCTRL_DEL_DBGrid(Key,Shift);
end;

procedure TfrmProVenda.edtQuantidadeEnter(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value:=TotalizarProduto (edtValorUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmProVenda.edtQuantidadeExit(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value:=TotalizarProduto (edtValorUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmProVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(dtmVenda) then
  freeandnil(dtmVenda);
  if Assigned(oVenda) then
     FreeAndNil(ovenda);
end;

procedure TfrmProVenda.FormCreate(Sender: TObject);
begin
  inherited;
  dtmVenda:=TdtmVenda.Create(self);
  oVenda:=TVenda.Create(dtmPrincipal.ConectDB	);

  indiceAtual:= 'clienteId';

end;

function TfrmProVenda.gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtvendaId.Text<>EmptyStr then
  ovenda.VendaId:=StrToInt(edtVendaId.Text)
  else
  ovenda.VendaId:=0;
  ovenda.ClienteId :=lkpCliente.KeyValue;
  ovenda.DataVenda :=edtDataVenda.Date;
  ovenda.TotalVenda :=edtValor.Value;

  if (EstadoDoCadastro=ecNovo) then
       Result:=oVenda.Gravar(dtmVenda.cdsItensVendas)
  else if (estadoDoCadastro=ecAlterar) then
       Result:=oVenda.Atualizar(dtmVenda.cdsItensVendas);

end;

procedure TfrmProVenda.lkpProdutoExit(Sender: TObject);
begin
  inherited;
  if TDBLookupComboBox(sender).KeyValue<>Null then begin

    edtValorUnitario.Value:=dtmVenda.qryProdutos.FieldByName('valor').AsFloat;
    edtQuantidade.Value:=1;

    edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
  end;
end;

procedure TfrmProVenda.spbIncluirClick(Sender: TObject);
begin
  inherited;
    Tfuncao.CriarForm(TfrmCadProduto, oUsuarioLogado, DtmPrincipal.ConectDB);
    dtmVenda.qryProdutos.Refresh;
end;

procedure TfrmProVenda.spbIncluirClienteClick(Sender: TObject);
begin
  inherited;
      Tfuncao.CriarForm(TfrmCadCliente, oUsuarioLogado, DtmPrincipal.ConectDB);
    dtmVenda.qryCliente.Refresh;
end;

procedure TfrmProVenda.spbPesquisarClick(Sender: TObject);
begin
  inherited;
  try
    frmConProduto:=TfrmConProduto.Create(self);

  if lkpProduto.keyvalue<>null then
     frmConProduto.aIniciarPesquisaID:=lkpProduto.KeyValue;

  frmConProduto.ShowModal;

  if frmConProduto.aRetornarIdSelecionado<>Unassigned then
     lkpProduto.KeyValue:=frmConProduto.aRetornarIdSelecionado;

  finally
    frmConProduto.Release;
  end;
end;

procedure TfrmProVenda.spbPesquisarClienteClick(Sender: TObject);
begin
  inherited;
    try
    frmConCliente:=TfrmConCliente.Create(self);

  if lkpCliente.keyvalue<>null then
     frmConCliente.aIniciarPesquisaID:=lkpProduto.KeyValue;

  frmConCliente.ShowModal;

  if frmConCliente.aRetornarIdSelecionado<>Unassigned then
     lkpCliente.KeyValue:=frmConCliente.aRetornarIdSelecionado;

  finally
    frmConCliente.Release;
  end;
end;

procedure TfrmProVenda.CarregarRegistroSelecionado;
begin
  lkpProduto.KeyValue :=dtmVenda.cdsItensVendas.FieldByName('produtoId').AsString;
  edtQuantidade.Value :=dtmVenda.cdsItensVendas.FieldByName('quantidade').AsFloat;
  edtValorUnitario.value :=dtmVenda.cdsItensVendas.FieldByName('valorUnitario').AsFloat;
  edtTotalproduto.value:= dtmVenda.cdsItensvendas.FieldByName('valorUnitario').AsFloat;
end;

function TfrmProVenda.TotalizarVenda:Double;
var Valor:Double;
begin
  valor:=0;
  dtmVenda.cdsItensVendas.First;
  while not dtmVenda.cdsItensVendas.Eof  do begin
    valor := valor + dtmVenda.cdsItensVendas.FieldByName('valorTotalProduto').AsFloat;
    dtmVenda.cdsItensVendas.Next;
  end;
  result:=valor;
end;

end.
