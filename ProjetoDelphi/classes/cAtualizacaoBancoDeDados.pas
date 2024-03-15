unit cAtualizacaoBancoDeDados;
interface

uses system.Classes, vcl.Controls,vcl.ExtCtrls, vcl.Dialogs, ZAbstractConnection, ZConnection, ZAbstractRODataset,
ZAbstractDataset, Zdataset, System.SysUtils, cCadUsuario;

type
TatualizaBancoDados = class
private


public
ConectDb:TZConnection;
Constructor Create(aConexao:TZConnection);
procedure ExecutaDiretoBancoDeDados(aScript: String);
end;

type
  TAtualizaBancoDadosMSSQL = Class

  private
  public

  ConectDB:TZConnection;
  function AtualizarBancoDeDadosMSSQL: Boolean;
  constructor Create(aConexao: TZConnection);
End;


type
  TAtualizacaoTableMSSQL = class(TAtualizaBancoDados)
private
  function TabelaExiste(aNomeTabela:String):Boolean;
  procedure Categoria;
    procedure Cliente;
    procedure produto;
    procedure venda;
    procedure vendasItens;
    procedure Usuario;
    procedure AcaoAcesso;
    procedure UsuariosAcaoAcesso;

  protected

  public
  constructor Create(aConexao:TZConnection);
  destructor Destroy; override;
  end;


implementation

uses cAtualizacaoCampoMSSQL;

{ TatualizaBancoDados }

constructor TatualizaBancoDados.Create(aConexao: TZConnection);
begin
 conectDb:=aConexao;
end;

procedure TatualizaBancoDados.ExecutaDiretoBancoDeDados(aScript: String);
var qry:tzQuery;
begin
try
  qry:=TZQuery.Create(nil);
  qry.Connection:=conectdb;
  qry.SQL.Clear;
  qry.SQL.Add(ascript);
  try
     ConectDB.StartTransaction;
     qry.ExecSQL;
     conectDb.Commit;
  except
     ConectDB.RollBack;
  end;
finally
  qry.Close;
  if Assigned(qry) then
  FreeAndNil(qry);
end;

end;

{ TAtualizaBancoDadosMSSQL }

function TAtualizaBancoDadosMSSQL.AtualizarBancoDeDadosMSSQL: Boolean;
var oAtualizarDB:TAtualizaBancoDados;
    oTabela: TAtualizacaoTableMSSQL;
    oCampo: TAtualizacaoCampoMSSQL;
begin
  try
    oatualizarDb:=TAtualizaBancoDados.Create(conectDb);

    oTabela:=TAtualizacaoTableMSSQL.Create(ConectDB);

    oCampo:= TAtualizacaoCampoMSSQL.Create(ConectDB);

  finally
  if assigned(oatualizarDB) then
     freeandNil(oAtualizarDB);

   if assigned(oTabela) then
     freeandNil(oTabela);
  end;
end;

constructor TAtualizaBancoDadosMSSQL.Create(aConexao: TZConnection);
begin
  conectDb:=aConexao;
end;


{ TAtualizacaoTableMSSQL }

constructor TAtualizacaoTableMSSQL.Create(aConexao: TZConnection);
begin
  conectDB := aConexao;
  categoria;
  cliente;
  produto;
  venda;
  vendasitens;
  Usuario;
  AcaoAcesso;
  UsuariosAcaoAcesso;
end;

destructor TAtualizacaoTableMSSQL.Destroy;
begin

  inherited;
end;

function TAtualizacaoTableMSSQL.TabelaExiste(aNomeTabela: String): Boolean;
var
  qry: TZQuery;
begin
  qry := TZQuery.Create(nil);
  try

    qry.Connection := conectDB;


    qry.SQL.Text := 'SELECT OBJECT_ID(' + QuotedStr(aNomeTabela) + ') AS ID';

    qry.Open;
    Result := not qry.FieldByName('ID').IsNull;
  finally
    qry.Free;
  end;
end;

procedure TAtualizacaoTableMSSQL.AcaoAcesso;
begin
   if not TabelaExiste('acaoAcesso') then
   begin
     ExecutaDiretoBancoDeDados(
     'CREATE TABLE acaoAcesso ('+
     ' acaoAcessoId int identity (1,1) not null,' +
     ' descricao varchar(100) not null,'+
     ' chave varchar(60) not null,' +
     ' Primary Key (acaoAcessoId)' +
     ' ) '
     );
   end;

end;

procedure TAtualizacaoTableMSSQL.Categoria;
begin
  if not tabelaExiste('categorias') then
  begin
     ExecutaDiretoBancoDeDados(

  '  CREATE TABLE categorias (  '+
  '  categoriaId int IDENTITY(1,1) NOT NULL,  '+
  '  descricao varchar(30) NULL,  '+
  '  PRIMARY KEY (categoriaId)   ' +
   ') '
        );
  end;
 end;

 procedure TAtualizacaoTableMSSQL.Cliente;
 begin
   if not TabelaExiste ('clientes') then
   begin
   executaDiretoBancoDeDados(
 '      CREATE TABLE clientes(            ' +
 ' clienteId int IDENTITY (1,1) NOT NULL, ' +
 ' nome varchar(60) NULL,                 ' +
 ' endereco varchar (60) NULL,            ' +
 ' cidade varchar (50) null,              ' +
 ' bairro varchar (40) null,              ' +
 ' estado varchar (2) null,               ' +
 ' cep varchar (10) null,                 ' +
 ' telefone varchar (14) null,            ' +
 ' email varchar (100) null,              ' +
 ' dataNascimento datetime null           ' +
 ' PRIMARY KEY (clienteId),               ' +
 ' )                                      '
      );
   end;
 end;


 procedure TAtualizacaoTableMSSQL.produto;
 begin
   if not TabelaExiste ('produtos') then
   begin
   executaDiretoBancoDeDados(
' CREATE TABLE produtos (     ' +
' produtoId int IDENTITY (1,1) NOT NULL,   ' +
' nome varchar (60) NULL,     ' +
' descricao varchar (255) null,      ' +
' valor decimal (18,5) default 0.00000 null,  ' +
' quantidade decimal (18,5) default 0.00000 null,  ' +
' categoriaId int null,   ' +
' PRIMARY KEY (produtoId),    ' +
' CONSTRAINT FK_ProdutosCategorias ' +
' FOREIGN KEY (categoriaId) references categorias (categoriaId)    ' +
' ) '
 );
 end;
 end;

  procedure TAtualizacaoTableMSSQL.venda;
 begin
   if not TabelaExiste ('vendas') then
   begin
   executaDiretoBancoDeDados(
  ' CREATE TABLE vendas (      ' +
 ' vendaId int identity (1,1) not null,  ' +
 ' clienteId int not null,                 ' +
 ' dataVenda datetime default getdate(),    ' +
 ' totalVenda decimal (18,5) default 0.00000,  ' +
 ' PRIMARY KEY (vendaId), ' +
 ' CONSTRAINT FK_VendasClientes FOREIGN KEY (clienteId) ' +
 ' REFERENCES clientes(clienteId)   ' +
 ' ) '
  );
end;
end;

  procedure TAtualizacaoTableMSSQL.vendasItens;
 begin
   if not TabelaExiste ('vendasItens') then
   begin
   executaDiretoBancoDeDados(
'  Create table vendasItens (                     '+
 ' vendaId int not null,                         '+
 ' produtoId int not null,                               '+
 ' valorUnitario decimal (18,5) default 0.00000,        '+
 ' quantidade decimal (18,5) default 0.00000,         '+
 ' totalProduto decimal (18,5) default 0.00000,     '+
 ' PRIMARY KEY (vendaId,ProdutoId),   '+
 ' CONSTRAINT FK_VendasItensProdutos FOREIGN KEY (produtoId)  '+
 ' REFERENCES produtos(produtoId)  '+
 ' ) '

 );
   end;
 end;

  procedure TAtualizacaoTableMSSQL.Usuario;
  var oUsuario:TUsuario;
 begin
   if not TabelaExiste ('usuarios') then
   begin
   executaDiretoBancoDeDados(
'   Create table usuarios(            '+
'  usuarioId int identity(1,1) not null, '+
'  nome varchar(50) not null, '+
'  senha varchar(40) not null,'+
'  primary key (usuarioId)  '+
'  ) '
    );
   end;
try
  oUsuario:=TUsuario.Create(ConectDb);
  oUsuario.nome:='ADMIN';
  oUsuario.senha:='adm';
  if not oUsuario.UsuarioExiste(oUsuario.nome) then
    oUsuario.gravar;
finally
  if Assigned(oUsuario) then
    Freeandnil(oUsuario);

 end;
 end;
procedure TAtualizacaoTableMSSQL.UsuariosAcaoAcesso;
begin
  if not TabelaExiste('usuariosAcaoAcesso') then
begin
  ExecutaDiretoBancoDeDados(
 ' CREATE TABLE usuariosAcaoAcesso (                            ' +
 ' usuarioId int NOT NULL,                                      ' +
 ' acaoAcessoid int NOT NULL,                                   ' +
 ' ativo bit not null default 1,                                ' +
 ' PRIMARY KEY (usuarioId, acaoAcessoId),                       ' +
 ' CONSTRAINT FK_UsuarioAcaoAcessoUsuario                       ' +
 ' FOREIGN KEY (usuarioId) references usuarios (usuarioId),     ' +
 ' CONSTRAINT FK_UsuarioAcaoAcessoAcaoAcesso                    ' +
 ' FOREIGN KEY (acaoAcessoId)                                   ' +
 ' references acaoAcesso(acaoAcessoId),                         ' +
 ' ) '
  );

end;
end;

end.
