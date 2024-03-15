unit cAcaoAcesso;
interface

uses system.Classes, vcl.Controls,vcl.ExtCtrls, vcl.Dialogs, ZAbstractConnection, ZConnection, ZAbstractRODataset,
ZAbstractDataset, Zdataset, System.SysUtils, Vcl.Forms, Vcl.Buttons, uDTMConect;

type TAcaoAcesso = class
private
  conectDB:TZConnection;
  f_acaoAcessoId:Integer;
  f_descricao:String;
  f_chave:String;
  class procedure PreencherAcoes(aForm:TForm; aConexao:TZConnection); static;
  class procedure VerificarUsuarioAcao (aUsuarioId, aAcaoAcessoid: Integer; aconexao: TZConnection); static;

public
  constructor create(aConexao:TZConnection);
  destructor Destroy; override;
    function Gravar:Boolean;
    function Atualizar:Boolean;
    function Selecionar(id:Integer):Boolean;
    function Apagar:Boolean;
    function chaveExiste(aChave:String; aId:Integer=0):Boolean;
    class procedure CriarAcoes(aNomeForm: TFormClass; aConexao:TZConnection); static;
    class procedure PreencherUsuariosVSAcoes(aConexao:TZConnection); static;

published
  property codigo :integer read f_acaoAcessoId write f_acaoAcessoId;
  property descricao :string read f_descricao write f_descricao;
  property chave :string read f_chave write f_chave;
end;

implementation

{ TAcaoAcesso }

function TAcaoAcesso.Apagar: Boolean;
var qry:TZQuery;
begin
  if MessageDlg ('Apagar o registro: '+#13+#13+
                 'Código: '+IntToStr(F_acaoAcessoId)+#13+
                 'Nome: '+F_descricao, mtConfirmation,[mbYes, mbNo],0) =mrNo then begin
  Result:=false;
  abort;
  end;

  try
    Result:=true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConectDb;
    qry.SQL.Clear;
    qry.SQL.Add('DELETE FROM acaoAcesso ' +
                ' WHERE acaoAcessoId=:acaoAcessoId ');
    qry.ParamByName('acaoAcessoId').AsInteger :=F_acaoAcessoId;
    try
      ConectDb.StartTransaction;
      qry.ExecSQL;
      conectDb.Commit;
    except
      ConectDb.RollBack;
      result:=false;
    end;

  finally
    if Assigned(qry) then
    FreeAndNil(qry);
  end;
end;

function TAcaoAcesso.Atualizar: Boolean;
var qry:TZQuery;
begin
 try
   Result:=True;
   qry:=TZQuery.Create(nil);
   qry.Connection:=ConectDb;
   qry.SQL.Clear;
   qry.SQL.Add('UPDATE acaoAcesso ' +
               '  SET descricao =:descricao ' +
               '  ,chave =:chave' +
               ' WHERE acaoAcessoId =:acaoAcessoId ');
   qry.ParamByName('acaoAcessoId').AsInteger :=Self.f_acaoAcessoId;
   qry.ParamByName('descricao').AsString :=Self.f_descricao;
   qry.ParamByName('chave').AsString :=Self.f_chave;

   try
     conectDb.StartTransaction;
     qry.ExecSQL;
     ConectDB.Commit;
   except
     ConectDb.RollBack;
     Result:=false;
   end;
 finally
   if Assigned (qry) then
      FreeAndNil(qry);
 end;
end;

function TAcaoAcesso.chaveExiste(aChave: String; aId:Integer): Boolean;
var qry:TZQuery;
begin
  try
    qry:=TZQuery.create(nil);
    qry.connection:=ConectDB;
    qry.SQL.Clear;
    qry.SQL.Add('SELECT COUNT (acaoAcessoId) AS Qtde ' +
                ' FROM acaoAcesso ' +
                ' WHERE chave =:chave ');
    qry.ParamByName('chave').AsString :=aChave;

    if aId > 0 then
    begin
      qry.SQL.Add( 'AND acaoAcessoId<>:acaoAcessoId');
      qry.ParamByName('acaoAcessoId').AsInteger :=aId;
    end;

    try
      qry.Open;
      if qry.FieldByName('Qtde').AsInteger>0 then
      result:=true
      else
      result:=false;

    except
      result:=false;
    end;
  finally
   if Assigned (qry) then
     FreeAndNil(qry);
  end;
end;

constructor TAcaoAcesso.create(aConexao: TZConnection);
begin
 ConectDb:=aConexao;
end;

destructor TAcaoAcesso.Destroy;
begin

  inherited;
end;

function TAcaoAcesso.Gravar: Boolean;
var Qry:TZQuery;
begin
  try
   Result:=True;
   qry:=TZQuery.Create(nil);
   qry.Connection:=ConectDb;
   qry.SQL.Clear;
   qry.SQL.Add('INSERT INTO acaoAcesso (descricao, ' +
               '                         chave)'  +
               ' VALUES                 (:descricao,' +
               '                          :chave)' );

   qry.ParamByName('descricao').AsString :=Self.f_descricao;
   qry.ParamByName('chave').AsString :=Self.f_chave;

   try
     conectDb.StartTransaction;
     qry.ExecSQL;
     ConectDB.Commit;
   except
     ConectDb.RollBack;
     Result:=false;
   end;
 finally
   if Assigned (qry) then
      FreeAndNil(qry);
 end;
end;

class procedure TAcaoAcesso.PreencherAcoes(aForm: TForm;
  aConexao: TZConnection);
  var i: integer;
      oacaoAcesso:TAcaoAcesso;
begin
  try
    oAcaoAcesso:=TAcaoAcesso.create(aConexao);
    oAcaoAcesso.descricao:=aForm.Caption;
    oAcaoAcesso.chave:=aForm.Name;
    if not oAcaoAcesso.chaveExiste(oAcaoAcesso.chave) then
       oacaoAcesso.Gravar;

    for I:= 0 to aForm.ComponentCount -1 do
    begin
      if(aform.Components[i] is TBitBtn)then
      begin
        if TBitBtn(aForm.Components[i]).Tag=99 then
        begin
          oAcaoAcesso.descricao:= '    - BOTÃO '+StringReplace (TBitBtn(aForm.Components[i]).Caption,'&','',[rfReplaceAll]);
          oAcaoAcesso.chave := aform.Name+'_'+TBitBtn(aForm.Components[i]).Name;
          if not oAcaoAcesso.chaveExiste(oAcaoAcesso.Chave) then
          oAcaoAcesso.gravar;
        end;
      end;
    end;
  finally
    if Assigned(oAcaoAcesso) then
       FreeAndNil(oAcaoAcesso);
  end;
end;

class procedure TAcaoAcesso.CriarAcoes(aNomeForm: TFormClass;
  aConexao: TZConnection);
  var form: TForm;
begin
  try
    form:=aNomeForm.Create(Application);
    PreencherAcoes(form,aConexao);
  finally
    if Assigned(form) then
       form.Release;
  end;

end;

function TAcaoAcesso.Selecionar(id: Integer): Boolean;
var qry:TZQuery;
begin
 try
   Result:=True;
   qry:=TZQuery.Create(nil);
   qry.Connection:=ConectDb;
   qry.SQL.Clear;
   qry.SQL.Add('SELECT acaoAcessoId, ' +
               '   descricao, ' +
               '  chave ' +
               ' FROM acaoAcesso '+
               ' WHERE acaoAcessoId =:acaoAcessoId ');
   qry.ParamByName('acaoAcessoId').AsInteger :=id;
   try
   qry.Open;
   Self.F_acaoAcessoId :=qry.FieldByName('acaoAcessoId').AsInteger;
   Self.F_descricao :=qry.FieldByName('descricao').AsString;
   Self.F_chave :=qry.FieldByName('chave').AsString;

   except
     Result:=false;
   end;
 finally
   if Assigned (qry) then
      FreeAndNil(qry);
 end;
end;

class procedure TAcaoAcesso.VerificarUsuarioAcao(aUsuarioId,
  aAcaoAcessoid: Integer; aconexao: TZConnection);
  var qry:TZQuery;
begin
try
  qry:=TZQuery.Create(nil);
  qry.Connection:=aConexao;
  qry.SQL.Clear;
  qry.SQL.Add('SELECT usuarioId ' +
              '  FROM usuariosAcaoAcesso' +
              ' WHERE usuarioId=:usuarioId '+
              ' AND acaoAcessoId=:acaoAcessoId ');
  qry.ParamByName('usuarioId').AsInteger:=aUsuarioId;
  qry.ParamByName('acaoAcessoId').AsInteger:=aAcaoAcessoId;
  qry.Open;

  if qry.IsEmpty then
  begin
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('INSERT INTO usuariosAcaoAcesso (usuarioId, acaoAcessoId, ativo) '+
                '     VALUES (:usuarioId, :acaoAcessoId, :ativo) ');
    qry.ParamByName('usuarioId').AsInteger:=aUsuarioId;
    qry.ParamByName('acaoAcessoId').AsInteger:=aAcaoAcessoid;
    qry.ParamByName('ativo').AsBoolean:=true;
    try
      aConexao.StartTransaction;
      qry.ExecSQL;
      aConexao.Commit;
    except
      aConexao.Rollback;
    end;
  end;

finally
  if Assigned(qry) then
     freeAndNil(qry);
end;

end;

class procedure TAcaoAcesso.PreencherUsuariosVSAcoes(aConexao: TZConnection);
var qry:TZquery;
    qryAcaoAcesso:TZquery;
begin
 try
   qry:=TZQuery.Create(nil);
   qry.Connection:=aConexao;
   qry.SQL.Clear;

   qryAcaoAcesso:=TZQuery.Create(nil);
   qryAcaoAcesso.Connection:=aConexao;
   qryAcaoAcesso.SQL.Clear;

   qry.SQL.Add('SELECT usuarioId FROM usuarios ');
   qry.Open;

   qryAcaoAcesso.SQL.Add('SELECT acaoAcessoId FROM acaoAcesso ');
   qryAcaoAcesso.Open;

   qry.First;
   while not qry.Eof do //usuarios
   begin
     qryAcaoAcesso.First;

     while not qryAcaoAcesso.Eof do   //AcaoAcesso
     begin
       VerificarUsuarioAcao(qry.FieldByName('usuarioId').AsInteger,
                                            qryAcaoAcesso.FieldByName('acaoAcessoid')
                                            .AsInteger, aConexao);
       qryAcaoAcesso.Next;
     end;

     qry.Next;
   end;

 finally
   if Assigned(qry) then
      FreeAndNil(qry);
   if Assigned(qryacaoAcesso) then
      FreeAndNil(qryacaoAcesso);

 end;
end;


end.
