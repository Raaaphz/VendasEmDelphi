unit cFuncao;

interface

uses System.Classes,
Vcl.Controls,
Vcl.Dialogs,
ZAbstractconnection,
ZConnection,
ZAbstractRODataset,
ZAbstractDataset,
ZDataset,
System.SysUtils,
Vcl.Forms,
Vcl.Buttons,
cAcaoAcesso,
cUsuarioLogado,
RLReport;

type
Tfuncao = class
  private

  public
  class procedure CriarForm(aNomeForm: TformClass; oUsuarioLogado:TUsuarioLogado; aconexao:TZConnection); static;
  class procedure CriarRelatorio(aNomeForm:TformClass; oUsuarioLogado:TUsuarioLogado; aconexao:TZConnection); static;
end;

implementation



{ Tfuncao }

class procedure Tfuncao.CriarForm(aNomeForm: TformClass;
  oUsuarioLogado: TUsuarioLogado; aconexao: TZConnection);
  var form: Tform;
begin
  try
    form:= aNomeForm.Create(Application);
    if TUsuarioLogado.TenhoAcesso(oUsuariologado.codigo, form.Name, aConexao) then
    begin
      form.ShowModal;
    end
    else begin
      MessageDlg('Usuário: '+oUsuarioLogado.nome+' Não tem Permissão de Acesso', mtWarning,[mbOK],0);
    end;
  finally
    if Assigned(form) then
       form.Release;
  end;
end;

Class procedure Tfuncao.CriarRelatorio(aNomeForm: TFormClass; oUsuarioLogado: TUsuarioLogado; aconexao: TZConnection);
var form: Tform;
aRelatorio:TRLReport;
i:integer;
begin
  try
    form:=aNomeForm.Create(Application);
    if TusuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, form.Name, aConexao) then
    begin
      for I := 0 to form.ComponentCount-1 do
        begin
          if form.Components[i] is TRLReport then
          begin
            TRLreport(form.Components[i]).PreviewModal;
            break;
          end;
        end;
    end
    else begin
      MessageDLG('Usuário: '+oUsuarioLogado.nome+', não tem permissão de acesso', mtWarning, [mbOK],0);
    end;
  finally
    if Assigned(form) then
       form.Release;
  end;
end;




end.
