unit uCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  uEnum, cCadUsuario, udtmConect, cAcaoAcesso;


type
  TfrmCadUsuario = class(TfrmHeranca)
    qryListagemusuarioId: TIntegerField;
    qryListagemnome: TWideStringField;
    qryListagemsenha: TWideStringField;
    edtUsuarioId: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtSenha: TLabeledEdit;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    oUsuario:TUsuario;
    function Excluir:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

{$R *.dfm}

{ TfrmCadUsuario }

procedure TfrmCadUsuario.btnAlterarClick(Sender: TObject);
begin
  if oUsuario.Selecionar(qryListagem.FieldByName('usuarioID').AsInteger) then begin
     edtUsuarioId.Text:=IntToStr(oUsuario.codigo);
     edtNome.Text :=oUsuario.nome;
     edtsenha.Text :=oUsuario.senha;
  end
  else begin
    btnCancelar.Click;
    abort;
  end;
  inherited;

end;

procedure TfrmCadUsuario.btnGravarClick(Sender: TObject);
begin
if oUsuario.UsuarioExiste(edtNome.text) then begin
   MessageDlg('Usu�rio j� cadastrado', mtInformation, [mbOK],0);
   edtNome.SetFocus;
   abort;
end;

  if edtUsuarioId.Text<>EmptyStr then
      oUsuario.codigo:=StrToInt(edtUsuarioId.Text)
  else
  oUsuario.codigo:=0;
  oUsuario.nome :=edtNome.text;
  oUsuario.senha:=edtSenha.Text;
  inherited;

end;

procedure TfrmCadUsuario.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

function TfrmCadUsuario.Excluir: Boolean;
begin
  if oUsuario.Selecionar(qryListagem.FieldByName('usuarioID').AsInteger) then begin
  result:=oUsuario.Apagar;
  end;

end;

procedure TfrmCadUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oUsuario) then
     freeAndnil(oUsuario);

end;

procedure TfrmCadUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  oUsuario:=TUsuario.Create(dtmPrincipal.ConectDB);
  IndiceAtual:='nome';
end;

function TfrmCadUsuario.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if EstadoDoCadastro=ecNovo then
  Result:= oUsuario.gravar
  else if EstadoDoCadastro=ecAlterar then
          Result:= oUsuario.Atualizar;

  TAcaoAcesso.PreencherUsuariosVsAcoes(DtmPrincipal.ConectDB);

end;

end.
