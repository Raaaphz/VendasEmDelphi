unit uTelaHerançaConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Vcl.Buttons;

type
  TfrmHerancaConsulta = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    mskPesquisa: TMaskEdit;
    lblIndice: TLabel;
    qryListagem: TZQuery;
    dtsListagem: TDataSource;
    grdPesquisa: TDBGrid;
    btnFechar: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grdPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure grdPesquisaDblClick(Sender: TObject);
    procedure mskPesquisaChange(Sender: TObject);
  private
    procedure ExibirLabelIndice(Campo: string; aLabel: TLabel);
    function RetornarCampoTraduzido(Campo: String): string;
    { Private declarations }
  public
    { Public declarations }
    aRetornarIdSelecionado:Variant;
    aIniciarPesquisaId:Variant;
    aCampoId:string;
    IndiceAtual:string;
  end;

var
  frmHerancaConsulta: TfrmHerancaConsulta;

implementation

{$R *.dfm}

procedure TfrmHerancaConsulta.btnFecharClick(Sender: TObject);
begin
Close;
end;

procedure TfrmHerancaConsulta.grdPesquisaDblClick(Sender: TObject);
begin
  aRetornarIdSelecionado:=qryListagem.FieldByName(aCampoId).AsVariant;
  close;
end;

procedure TfrmHerancaConsulta.grdPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (shift = [ssCtrl]) and (key =  46) then
 key := 0;
end;

procedure TfrmHerancaConsulta.mskPesquisaChange(Sender: TObject);
begin
  qryListagem.Locate(IndiceAtual, TMaskEdit(sender).Text, [loPartialKey])
end;

procedure TfrmHerancaConsulta.FormCreate(Sender: TObject);
begin
  if qryListagem.Active then
     qryListagem.Close;

  qryListagem.Open;
end;

procedure TfrmHerancaConsulta.FormShow(Sender: TObject);
begin
  if (aIniciarPesquisaId<>Unassigned) then
  begin
    qryListagem.Locate(aCampoId, aIniciarPesquisaId,[loPartialKey])
  end;
end;

procedure TfrmHerancaConsulta.ExibirLabelIndice(Campo: string; aLabel:TLabel);
begin
  aLabel.Caption:=RetornarCampoTraduzido(campo);
end;

function TfrmHerancaConsulta.RetornarCampoTraduzido(Campo: String): string;
var i:Integer;
begin
  for I := 0 to qryListagem.FieldCount-1 do begin
    if LowerCase(qryListagem.Fields[i].FieldName) = LowerCase(campo) then begin
    Result:=qryListagem.Fields[i].DisplayLabel;
    break;
    end;

  end;

end;

end.
