unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, cCadUsuario, udtmConect;

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btnFechar: TBitBtn;
    btnAcessar: TBitBtn;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
  private
    { Private declarations }
    bFechar:boolean;
    procedure fecharAplicacao;
    procedure fecharFormulario;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation
uses uPrincipal;
{$R *.dfm}

procedure TfrmLogin.btnAcessarClick(Sender: TObject);
var oUsuario:TUsuario;
begin
  try
    oUsuario:=TUsuario.Create(dtmprincipal.ConectDB);
    if oUsuario.Logar(edtUsuario.Text,edtSenha.Text) then begin
       oUsuarioLogado.Codigo:= oUsuario.codigo;
       oUsuarioLogado.nome:= oUsuario.nome;
       oUsuarioLogado.senha := oUsuario.senha;
    fecharFormulario
    end
    else begin
      MessageDlg('Usu�rio Inv�lido',mtInformation, [mbOK],0);
      edtUsuario.SetFocus;
    end;
  finally
    if Assigned(oUsuario) then
       FreeAndNil(oUsuario);
  end;
end;

procedure TfrmLogin.fecharAplicacao;
begin
  bFechar := true;
  Application.Terminate;
end;

procedure TfrmLogin.fecharFormulario;
begin
  bFechar := true;
  close;
end;

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin
  fecharAplicacao;
end;

procedure TfrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose:=bFechar;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
    bFechar:=False;
end;

end.

