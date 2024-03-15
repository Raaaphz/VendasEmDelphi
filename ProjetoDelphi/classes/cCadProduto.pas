unit cCadProduto;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     ZAbstractConnection,
     ZConnection,
     ZAbstractRodataset,
     ZAbstractDataSet,
     ZDataset,
     System.SysUtils,
     cCadCategoria,
     uCadCategoria;

type
  TProduto = class
  private
    ConectDB:TZConnection;
    F_produtoId:Integer;
    F_nome:String;
    F_descricao: string;
    F_valor:Double;
    F_quantidade: Double;
    F_categoriaId: Integer;

  public
    constructor Create(aConexao:TZCOnnection);
    destructor Destroy; override;
    function Gravar:Boolean;
    function Atualizar:Boolean;
    function Selecionar(id:Integer):Boolean;
    function Apagar:Boolean;

    published
      property codigo:Integer read F_produtoId write F_produtoId;
      property nome:string read F_nome write F_nome;
      property descricao:string read F_descricao write F_descricao;
      property valor:double read F_valor write F_valor;
      property quantidade:double read F_quantidade write F_quantidade;
      property categoriaId:Integer read F_categoriaId write F_categoriaId;
  end;

implementation

function TProduto.Atualizar: Boolean;
var
  qry: TZQuery;
begin
  qry := TZQuery.Create(nil);

  try
    result := true;
    qry.Connection := ConectDB;
    qry.SQL.Clear;
    qry.SQL.Add('UPDATE produtos ' +
                 'SET nome = :nome, ' +
                 'descricao = :descricao, ' +
                 'valor = :valor, ' +
                 'quantidade = :quantidade, ' +
                 'categoriaId = :categoriaId ' +
                 'WHERE produtoId = :produtoId');

    qry.ParamByName('produtoId').AsInteger := Self.F_produtoId;
    qry.ParamByName('nome').AsString := Self.F_nome;
    qry.ParamByName('descricao').AsString := Self.F_descricao;
    qry.ParamByName('valor').AsFloat := Self.F_valor;
    qry.ParamByName('quantidade').AsFloat := Self.F_quantidade;
    qry.ParamByName('categoriaId').AsInteger := Self.F_categoriaId;

    try
      conectDB.StartTransaction;
      qry.ExecSQL;
      ConectDb.Commit;
    except
    conectDb.Rollback;
      result:=false;
    end;
  finally
    qry.Free;
  end;
end;


constructor Tproduto.Create(aConexao: TZConnection);
begin
  conectDB:=aConexao;
end;

destructor Tproduto.Destroy;
begin

  inherited;
end;

function TProduto.Gravar: Boolean;
var qry:TZquery;
begin
  try
    result:=true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConectDB;
    qry.SQL.Clear;
        qry.SQL.Add('INSERT INTO produtos (nome, descricao, valor, quantidade, categoriaId) '+
                'VALUES (:nome, :descricao, :valor, :quantidade, :categoriaId)');
    qry.ParamByName('nome').AsString :=Self.F_nome;
    qry.ParamByName('descricao').AsString :=Self.F_descricao;
    qry.ParamByName('valor').AsFloat :=Self.F_valor;
    qry.ParamByName('quantidade').AsFloat :=Self.F_quantidade;
    qry.ParamByName('categoriaId').AsInteger :=Self.F_categoriaId;
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

function TProduto.Selecionar(id: Integer): Boolean;
var qry:TZQuery;
begin
  try
    Result:=true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConectDB;
    qry.SQL.Clear;
    qry.SQL.Add('SELECT produtoId, '+
            '       nome, '+
            '       descricao, '+
            '       valor, '+
            '       quantidade, '+
            '       categoriaId '+
            ' FROM produtos '+
            ' WHERE produtoId=:produtoId');

    qry.ParamByName('produtoId').AsInteger:=id;
    try
      qry.Open;

      Self.F_produtoId :=qry.FieldByName('produtoId').AsInteger;
      Self.F_nome :=qry.FieldByName('nome').AsString;
      Self.F_descricao :=qry.FieldByName('descricao').AsString;
      Self.F_valor :=qry.FieldByName('valor').Asfloat;
      Self.F_quantidade :=qry.FieldByName('quantidade').Asfloat;
      Self.F_categoriaId :=qry.FieldByName('categoriaId').AsInteger;
    except
      result:=false;
    end;
  finally
    if Assigned(qry) then
       FreeAndNil(qry);
  end;
end;

function TProduto.Apagar:Boolean;
var qry:TZQuery;
begin
  if MessageDlg('Apagar o registro: '+#13+#13+
  'Código: '+IntToStr(F_produtoId)+#13+
  'Descrição: '+F_nome, mtConfirmation, [mbYes, mbNo], 0)=mrNo then begin
    result:=false;
    abort;
  end;
try
  Result:=True;
  qry:=TZquery.Create(nil);
  qry.Connection:=ConectDB;
  qry.SQL.Clear;
  qry.SQL.Add('DELETE FROM produtos '+
              ' WHERE produtoId=:produtoId ');
  qry.ParamByName('produtoId').AsInteger :=F_produtoId;
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
