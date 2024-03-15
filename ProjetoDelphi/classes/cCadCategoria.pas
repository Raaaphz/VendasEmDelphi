unit cCadCategoria;

interface

uses system.Classes, vcl.Controls,vcl.ExtCtrls, vcl.Dialogs, ZAbstractConnection, ZConnection, ZAbstractRODataset,
ZAbstractDataset, Zdataset, System.SysUtils; //lista de units

type
TCategoria = class   //declaracao do tipo da classe
  private
  ConexaoDB:TZConnection;
  F_categoriaId:Integer;
  F_descricao:string;
    function getCodigo: Integer;
    function getDescricao: string;
    procedure setCodigo(const Value: Integer);
    procedure setDescricao(const Value: string);

                //variaveis privadas somente dentro da classe
  public
  //variaveis publicas que pode ser usada fora da classe)
constructor Create(aConexao:TZCOnnection);
destructor Destroy; override;
function Gravar:Boolean;
function Atualizar:Boolean;
function Selecionar(id:Integer):Boolean;
function Apagar:Boolean;

published //variaveis publicas utilizadas para propriedades da classe para fornecer informacoes em runtime
  property codigo:Integer read getCodigo write setCodigo;
  property descricao:string read getDescricao write setDescricao;
end;


implementation

function TCategoria.Apagar: Boolean;
var qry:TZQuery;
begin
  if MessageDlg('APAGAR O REGISTRO: '+#13+#13+
                'CODIGO: '+IntToStr(F_categoriaId)+#13+
                'DESCRICAO: '+F_descricao, mtConfirmation, [mbyes, mbno],0) =mrNo then begin
  result:=false;
  abort;
  end;
  try
    Result:=true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    qry.SQL.Add('DELETE FROM categorias ' +
                ' WHERE categoriaId=:categoriaId ');
    qry.ParamByName('categoriaId').AsInteger :=F_categoriaId;
    try
      conexaoDB.StartTransaction;
      qry.ExecSQL;
      ConexaoDb.Commit;
    except
    conexaoDb.Rollback;
      result:=false;
    end;

  finally
    if Assigned (qry) then
    FreeAndNil (qry);
  end;

end;

function TCategoria.Atualizar: Boolean;
var qry: TZQuery;
begin
  qry := TZQuery.Create(nil);
  try
    qry.Connection := ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add('UPDATE categorias ' +
                 '   SET descricao =:descricao ' +
                 ' WHERE categoriaId =:categoriaId');
    qry.ParamByName('categoriaId').AsInteger := Self.F_categoriaId;
    qry.ParamByName('descricao').AsString := Self.F_descricao;

    try
      conexaoDB.StartTransaction;
      qry.ExecSQL;
      ConexaoDb.Commit;
    except
    conexaoDb.Rollback;
      result:=false;
    end;
  finally
    qry.Free;
  end;
end;

constructor TCategoria.Create(aConexao:TZCOnnection);
begin
 ConexaoDB:=aConexao;
end;

destructor Tcategoria.Destroy;
begin

end;

function TCategoria.getCodigo: Integer;
begin
  Result := Self.F_categoriaId;
end;

function TCategoria.getDescricao: string;
begin
  Result:=Self.F_descricao;
end;

function TCategoria.Gravar: Boolean;
var qry:TZQuery;
begin
   try
     qry:=TZQuery.Create(nil);
     qry.Connection:=ConexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('INSERT INTO categorias (descricao) values (:descricao)');
     qry.ParamByName('descricao').AsString:=Self.F_descricao;
    try
      conexaoDB.StartTransaction;
      qry.ExecSQL;
      ConexaoDb.Commit;
    except
    conexaoDb.Rollback;
      result:=false;
    end;
   finally
     if Assigned(qry) then
     freeandnil(qry);
   end;
end;

function TCategoria.Selecionar(id: Integer): Boolean;
var qry:TZQuery;
begin
   try
     Result:=true;
     qry:=TZQuery.Create(nil);
     qry.Connection:=ConexaoDB;
     qry.SQL.Clear;
     qry.SQL.Add('SELECT categoriaId, '+
                 '       descricao  '+
                 '  FROM categorias '+
                 ' WHERE categoriaId=:categoriaId');
     qry.ParamByName('categoriaId').AsInteger:=id;
     try
       qry.Open;

       Self.F_categoriaId := Qry.FieldByName('categoriaId').AsInteger;
       Self.F_descricao   := Qry.FieldByName('descricao').AsString;
     except
       Result:=false;
     end;
   finally
     if Assigned(qry) then
     freeandnil(qry);
  end;

end;

procedure TCategoria.setCodigo(const Value: Integer);
begin
  Self.F_categoriaId:=Value;
end;

procedure TCategoria.setDescricao(const Value: string);
begin
  Self.F_descricao :=Value;
end;

end.
