unit cControleEstoqueTESTE;
interface

uses System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Dialogs, ZAbstractconnection, ZConnection, ZAbstractRoDataSet, ZAbstractDataSet,
ZDataSet, System.SysUtils, Data.DB, DataSnap.Dbclient;

type
  TControleEstoque = Class
  private
    ConectDb:TZConnection;
    F_ProdutoId:Integer;
    F_Quantidade:Double;
  public
    constructor Create(aConexao:TzConnection);
    destructor Destroy; override;
    function BaixarEstoque: Boolean;
    function RetornarEstoque: Boolean;
  published
    Property ProdutoId:integer  read F_ProdutoId  write F_ProdutoId;
    Property Quantidade:Double  read F_Quantidade write F_Quantidade;
  End;

implementation

{$region 'Con e Des}
constructor TControleEstoque.Create(aConexao:TZConnection);
begin
  ConectDb:=aconexao;
end;

destructor TControleEstoque.Destroy;
begin
  inherited;
end;
{$endRegion}

function TControleEstoque.BaixarEstoque: Boolean;
var qry:TZQuery;
begin
  try
    Result:=true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConectDB;

    qry.SQL.Clear;
    qry.SQL.Add(' UPDATE produtos '+
                ' SET quantidade = quantidade - :qtdeBaixa '+
                ' WHERE produtoId=:produtoId ');
    qry.ParamByName('produtoId').AsInteger :=ProdutoId;
    qry.ParamByName('qtdeBaixa').AsFloat   :=Quantidade;
    try
      conectDB.StartTransaction;
      qry.ExecSQL;
      ConectDb.Commit;
    except
    conectDb.Rollback;
      result:=false;
    end;

  finally
    if assigned(qry) then
       FreeAndNil(qry);
  end;
end;

function TControleEstoque.RetornarEstoque: Boolean;
var qry:TZQuery;
begin
  try
    Result:=true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConectDB;

    qry.SQL.Clear;
    qry.SQL.Add(' UPDATE produtos '+
                '    SET quantidade = quantidade + :qtdeRetorno '+
                '  WHERE produtoId=:produtoId ');
    qry.ParamByName('produtoId').AsInteger :=ProdutoId;
    qry.ParamByName('qtdeRetorno').AsFloat :=Quantidade;
    try
      conectDB.StartTransaction;
      qry.ExecSQL;
      ConectDb.Commit;
    except
    conectDb.Rollback;
      result:=false;
    end;

  finally
    if Assigned(qry) then
       FreeAndNil(qry);
  end;
end;
end.
