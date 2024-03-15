unit cAtualizacaoCampoMSSQL;

interface
uses system.Classes, vcl.Controls,vcl.ExtCtrls, vcl.Dialogs, ZAbstractConnection, ZConnection, ZAbstractRODataset,
ZAbstractDataset, Zdataset, System.SysUtils, cAtualizacaoBancoDeDados;

type
TAtualizacaoCampoMSSQL = class(TAtualizaBancoDados)

private
function CampoExisteNaTabela(aNomeTabela, aCampo: String): boolean;
procedure Versao1;

protected

public
constructor Create(aConexao:TZconnection);
destructor Destroy; override;

end;
implementation

{ TAtualizacaoCampoMSSQL }

function TAtualizacaoCampoMSSQL.CampoExisteNaTabela(aNomeTabela,
  aCampo: String): boolean;
var qry:TZQuery;
begin
  try
  result:=false;
  qry:=TZQuery.Create(nil);
  qry.Connection:=conectdb;
  qry.SQL.Clear;
  qry.SQL.Add(' SELECT COUNT (COLUMN_NAME) AS qtde ');
  qry.SQL.Add(' FROM INFORMATION_SCHEMA.COLUMNS ');
  qry.SQL.Add(' WHERE TABLE_NAME =:Tabela ');
  qry.SQL.Add(' AND COLUMN_NAME=:CAMPO ');
  qry.ParamByName('Tabela').AsString:=aNomeTabela;
  qry.ParamByName('Campo').AsString:=aCampo;
  qry.Open;

  if qry.FieldByName('Qtde').AsInteger>0 then
     Result:=true;

  finally
    qry.Close;
    if Assigned(qry) then
       FreeAndNil(qry);
  end;

end;

constructor TAtualizacaoCampoMSSQL.Create(aConexao: TZconnection);
begin
  ConectDb:=aConexao;
  versao1;
end;

destructor TAtualizacaoCampoMSSQL.Destroy;
begin

  inherited;
end;

procedure TAtualizacaoCampoMSSQL.Versao1;
begin
   if not CampoExisteNaTabela('categorias','teste') then
   begin
     ExecutaDiretoBancoDeDados('ALTER TABLE categorias ADD teste varchar(30) null ');
   end;

  if CampoExisteNaTabela('categorias','teste') then
  begin
  executaDiretoBancoDeDados('ALTER TABLE categorias DROP COLUMN teste ');
  end;
end;

end.
