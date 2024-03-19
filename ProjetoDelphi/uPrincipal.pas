unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMConect, ufrmatualizadb, uProVendas, uRelCategoria, uRelCadCliente,
  uRelCadProduto, uRelCadClienteFicha, uRelCadProdutoComGrupoCategoria, uSelecionarDatatTESTE, uRelVendaPorData, cUsuarioLogado,
  Vcl.ComCtrls, ZDbcIntfs, cAtualizacaoBancoDeDados, cArquivoINI, rlReport,
  Vcl.ExtCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart, VCLTee.DBChart, cFuncao;

type
  TfrmPrincipal = class(TForm)
    menuPrincipal: TMainMenu;
    CADASTRO1: TMenuItem;
    CADASTRO2: TMenuItem;
    RELATRIO1: TMenuItem;
    CLIENTE1: TMenuItem;
    CLIENTE2: TMenuItem;
    CATEGORIA1: TMenuItem;
    PRODUTO: TMenuItem;
    N1: TMenuItem;
    clkFechar: TMenuItem;
    VENDAS1: TMenuItem;
    CLIENTE3: TMenuItem;
    CLIENTE4: TMenuItem;
    PRODUTO1: TMenuItem;
    PRODUTO2: TMenuItem;
    VENDAPORDATA1: TMenuItem;
    CATEGORIA4: TMenuItem;
    FICHADECLIENTE1: TMenuItem;
    PRODUTOPORCATEGORIA1: TMenuItem;
    USURIO1: TMenuItem;
    N2: TMenuItem;
    ALTERARSENHA1: TMenuItem;
    stbPrincipal: TStatusBar;
    AOACESSO1: TMenuItem;
    N3: TMenuItem;
    USUARIOVSACOES1: TMenuItem;
    N4: TMenuItem;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    DBChart2: TDBChart;
    Series2: TPieSeries;
    DBChart3: TDBChart;
    PieSeries1: TPieSeries;
    DBChart4: TDBChart;
    Series3: TFastLineSeries;
    tmrAtualizacaoDashBoard: TTimer;
    procedure clkFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CATEGORIA1Click(Sender: TObject);
    procedure CLIENTE1Click(Sender: TObject);
    procedure PRODUTOClick(Sender: TObject);
    procedure VENDAS1Click(Sender: TObject);
    procedure CATEGORIA4Click(Sender: TObject);
    procedure CLIENTE3Click(Sender: TObject);
    procedure PRODUTO1Click(Sender: TObject);
    procedure FICHADECLIENTE1Click(Sender: TObject);
    procedure PRODUTOPORCATEGORIA1Click(Sender: TObject);
    procedure VENDAPORDATA1Click(Sender: TObject);
    procedure USURIO1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ALTERARSENHA1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AOACESSO1Click(Sender: TObject);
    procedure USUARIOVSACOES1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure tmrAtualizacaoDashBoardTimer(Sender: TObject);
  private
    procedure AtualizacaoBancoDados(aForm: TfrmAtualizarDB);
    procedure AtualizarDashboard;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  oUsuarioLogado: TUsuarioLogado;

implementation

{$R *.dfm}

uses uCadCategoria, ucadcliente, uCadProduto, uCadUsuario, uLogin, uDTMGrafico,
  uAlterarSenha, uCadAcaoAcesso, cAcaoAcesso, uUsuarioVsAcoes, uTelaHeranca;

procedure TfrmPrincipal.CATEGORIA1Click(Sender: TObject);
begin
  Tfuncao.criarForm(TfrmCadCategoria, oUsuarioLogado, dtmPrincipal.conectDB);
end;

procedure TfrmPrincipal.Panel1Click(Sender: TObject);
begin
  AtualizarDashBoard;
end;

procedure TfrmPrincipal.PRODUTO1Click(Sender: TObject);
begin
  TFuncao.CriarRelatorio(TfrmRelCadProduto,oUsuarioLogado, dtmPrincipal.ConectDB);
end;

procedure TfrmPrincipal.PRODUTOClick(Sender: TObject);
begin
  Tfuncao.criarForm(TfrmCadProduto, oUsuarioLogado, dtmPrincipal.conectDB);
end;

procedure TfrmPrincipal.PRODUTOPORCATEGORIA1Click(Sender: TObject);
begin
  TFuncao.CriarRelatorio(TfrmRelCadProdutoComGrupoCategoria,oUsuarioLogado, dtmPrincipal.ConectDB);
end;


procedure TfrmPrincipal.tmrAtualizacaoDashBoardTimer(Sender: TObject);
begin
  AtualizarDashBoard;
end;

procedure TfrmPrincipal.USUARIOVSACOES1Click(Sender: TObject);
begin
Tfuncao.criarForm(TfrmUsuarioVsAcoes, oUsuarioLogado, dtmPrincipal.conectDB);
end;

procedure TfrmPrincipal.USURIO1Click(Sender: TObject);
begin
Tfuncao. criarForm(TfrmCadUsuario, oUsuarioLogado, dtmPrincipal.conectDB);
end;

procedure TfrmPrincipal.CATEGORIA4Click(Sender: TObject);
begin
  TFuncao.criarRelatorio(TfrmRelCategoria,oUsuarioLogado, dtmPrincipal.ConectDB);
end;

procedure TfrmPrincipal.VENDAPORDATA1Click(Sender: TObject);
begin
  try
    frmSelecionarData:=TfrmSelecionarData.Create(self);
    if TUsuarioLogado.TenhoAcesso(oUsuarioLogado.Codigo, frmSelecionarData.Name, DTMPrincipal.ConectDb) then
    begin

    frmSelecionarData.ShowModal;

    frmVendaPorData:=TfrmVendaPorData.Create(self);
    frmVendaPorData.qryVenda.Close;
    frmVendaPorData.qryVenda.ParamByName('DataInicio').AsDate:=frmSelecionarData.edtDataInicio.Date;
    frmVendaPorData.qryVenda.open;
    frmVendaPorData.Relatorio.PreviewModal;
    end
    else begin
      MessageDlg('Usuario: '+oUsuarioLogado.nome+', não tem permissão de acesso',mtWarning,[mbOK],0);
    end;

  finally
    if Assigned(frmSelecionarData) then
     frmSelecionarData.Release;
    if Assigned(frmVendaPorData) then
     frmVendaPorData.Release;
  end;

end;

procedure TfrmPrincipal.VENDAS1Click(Sender: TObject);
begin
Tfuncao.criarForm(tfrmProVenda, oUsuarioLogado, dtmPrincipal.conectDB);

end;

procedure TfrmPrincipal.CLIENTE1Click(Sender: TObject);
begin
Tfuncao.criarForm(TfrmCadCliente, oUsuarioLogado, dtmPrincipal.conectDB);
end;

procedure TfrmPrincipal.CLIENTE3Click(Sender: TObject);
begin
  TFuncao.criarRelatorio(TfrmRelCadCliente,oUsuarioLogado, dtmPrincipal.ConectDB);
end;

procedure TfrmPrincipal.clkFecharClick(Sender: TObject);
begin
Close;
end;

procedure TfrmPrincipal.FICHADECLIENTE1Click(Sender: TObject);
begin
   TFuncao.CriarRelatorio(TfrmRelCadClienteFicha,oUsuarioLogado, dtmPrincipal.ConectDB);

end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(dtmPrincipal);

   if Assigned(oUsuarioLogado) then
   FreeAndNil(oUsuarioLogado);

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
 if not FileExists(TArquivoIni.ArquivoIni) then
 begin
   TarquivoIni.AtualizarINI('SERVER', 'TipoDataBase', 'MSSQL');
   TarquivoIni.AtualizarINI('SERVER', 'HostName', '.\');
   TarquivoIni.AtualizarINI('SERVER', 'Port', '1433');
   TarquivoIni.AtualizarINI('SERVER', 'User', 'sa');
   TarquivoIni.AtualizarINI('SERVER', 'Password', '2004');
   TarquivoIni.AtualizarINI('SERVER', 'Database', 'vendas');

   MessageDlg('Arquivo '+TArquivoIni.ArquivoINI +#13+ 'Criado com sucesso'+
             ' Configure o arquvio antes de inicializar aplicacao', MTInformation, [mbok],0);
   application.Terminate;
 end
 else
 begin
 frmAtualizarDB := tfrmAtualizarDB.Create(self);
 frmAtualizarDB.Show;
 frmAtualizarDB.Refresh;

dtmPrincipal := TdtmPrincipal.Create(self);
with dtmPrincipal.ConectDB do begin
  Connected:=False;
  SQLHourGlass :=false;

  if TarquivoIni.LerIni('SERVER','TipoDataBase')='MSSQL' then
     Protocol := 'mssql';
  LibraryLocation := 'C:\ProjetoDelphi\ntwdblib.dll';
  HostName := TArquivoIni.LerIni('Server','HostName');
  Port := StrToInt(TArquivoIni.LerIni('SERVER','Port'));
  User:=TArquivoIni.LerIni('SERVER','User');
  Password:=TArquivoIni.LerIni('SERVER','Password');
  Database:= TArquivoIni.LerIni('SERVER','DataBase');
  autoCommit := true;
  transactIsolationLevel:=tiReadCommitted;
  Connected :=True;
end;

  AtualizacaobancoDados(frmAtualizarDB);
  TAcaoAcesso.CriarAcoes(TfrmCadCategoria,dtmPrincipal.ConectDB);
  TAcaoAcesso.CriarAcoes(TfrmCadCliente,dtmprincipal.ConectDB);
  TAcaoAcesso.CriarAcoes(TfrmCadproduto,dtmprincipal.ConectDB);
  TAcaoAcesso.CriarAcoes(TfrmCadUsuario,dtmprincipal.ConectDB);
  TAcaoAcesso.CriarAcoes(TfrmCadAcaoAcesso,dtmprincipal.ConectDB);
  TAcaoAcesso.CriarAcoes(TfrmUsuarioVsAcoes,dtmPrincipal.ConectDB);
  TAcaoAcesso.CriarAcoes(TfrmAlterarSenha,dtmPrincipal.ConectDB);
  TAcaoAcesso.CriarAcoes(TfrmProVenda,dtmPrincipal.ConectDB);
  TAcaoAcesso.CriarAcoes(TfrmVendaPorData,dtmPrincipal.ConectDB);
  TAcaoAcesso.CriarAcoes(TfrmRelCadCliente,dtmPrincipal.ConectDB);
  TAcaoAcesso.CriarAcoes(TfrmRelCadClienteFicha,dtmPrincipal.ConectDB);
  TAcaoAcesso.CriarAcoes(TfrmRelCadProdutoComGrupocategoria,dtmPrincipal.ConectDB);
  TAcaoAcesso.CriarAcoes(TfrmRelCadProduto,DtmPrincipal.ConectDB);
  TAcaoAcesso.CriarAcoes(TfrmRelCategoria,DtmPrincipal.ConectDB);
  TAcaoAcesso.CriarAcoes(TfrmSelecionarData,DtmPrincipal.ConectDB);
  TAcaoAcesso.PreencherUsuariosVSAcoes(DTMPrincipal.ConectDB);

  DtmGrafico:=Tdtmgrafico.Create(self);
  DTMGrafico.qryProdutoEstoque.Open;
  DTMGrafico.qryValorVendaPorCliente.Open;
  DTMGrafico.qryTopProdutosVendidos.Open;
  dtmGrafico.qryVendaUltimaSemana.Open;

  frmAtualizarDB.Free;
end;
 end;

  procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  try
    oUsuarioLogado:= TUsuarioLogado.Create;

    frmLogin :=TfrmLogin. Create(self);
    frmLogin.ShowModal;
  finally
    frmLogin.Release;
    stbPrincipal.Panels[0].Text:='USUÁRIO: '+oUsuarioLogado.nome;
  end;
end;

procedure TfrmPrincipal.ALTERARSENHA1Click(Sender: TObject);
begin
Tfuncao.criarForm(TfrmAlterarSenha, oUsuarioLogado, dtmPrincipal.conectDB);

end;

procedure TfrmPrincipal.AOACESSO1Click(Sender: TObject);
begin
Tfuncao.criarForm(TfrmCadAcaoAcesso, oUsuarioLogado, dtmPrincipal.conectDB);
end;

procedure TfrmPrincipal.AtualizacaoBancoDados(aForm:TfrmAtualizarDB);
var oatualizarMSSQL:TAtualizaBancoDadosMSSQL;
  begin
    aForm.Refresh;
   try
     oAtualizarMSSQL:=TAtualizaBancoDadosMSSQL.Create(dtmPrincipal.ConectDB);
     oAtualizarMSSQL.AtualizarBancoDeDadosMSSQL;
   finally
     if Assigned(oAtualizarMSSQL) then
         FreeAndNil(oAtualizarMSSQL);
   end;
  end;

procedure TfrmPrincipal.AtualizarDashboard;
begin
try
screen.Cursor:=crSQLWait;
  if DTMGrafico.qryProdutoEstoque.active then
     DTMGrafico.qryProdutoEstoque.Close;

  if DTMGrafico.qryValorVendaPorCliente.active then
     DTMGrafico.qryValorVendaPorCliente.Close;

    if DTMGrafico.qryTopProdutosVendidos.active then
     DTMGrafico.qryTopProdutosVendidos.Close;

  if DTMGrafico.qryVendaUltimaSemana.active then
     DTMGrafico.qryVendaUltimaSemana.Close;

  dtmGrafico.qryVendaUltimaSemana.Open;
  dtmgrafico.qryValorVendaPorCliente.Open;
  DTMGrafico.qryProdutoEstoque.Open;
  dtmGrafico.qryTopProdutosVendidos.Open;
finally
  screen.Cursor:=crDEFAULT;
end;
end;
end.
