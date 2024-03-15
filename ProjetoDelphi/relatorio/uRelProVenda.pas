unit uRelProVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, uDTMConect, RLReport, RLFilters, RLPDFFilter,
  RLXLSXFilter, RLXLSFilter;

type
  TfrmRelProVenda = class(TForm)
    qryVenda: TZQuery;
    dtsVenda: TDataSource;
    Relatorio: TRLReport;
    Cabecalho: TRLBand;
    RLLabel1: TRLLabel;
    RLDraw1: TRLDraw;
    rodape: TRLBand;
    RLDraw2: TRLDraw;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSFilter1: TRLXLSFilter;
    RLXLSXFilter1: TRLXLSXFilter;
    BandaGrupo: TRLGroup;
    RLBand3: TRLBand;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel8: TRLLabel;
    RLDBText5: TRLDBText;
    RLBand5: TRLBand;
    RLDraw4: TRLDraw;
    RLLabel6: TRLLabel;
    RLDBResult2: TRLDBResult;
    qryVendaItens: TZQuery;
    dtsVendaItens: TDataSource;
    qryVendaItensvendaId: TIntegerField;
    qryVendaItensProdutoId: TIntegerField;
    qryVendaItensNome: TWideStringField;
    qryVendaItensquantidade: TFloatField;
    qryVendaItensvalorUnitario: TFloatField;
    qryVendaItenstotalProduto: TFloatField;
    RLLabel5: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel7: TRLLabel;
    RLSubDetail1: TRLSubDetail;
    RLBand2: TRLBand;
    RLBand4: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel9: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    qryVendavendaId: TIntegerField;
    qryVendaclienteId: TIntegerField;
    qryVendaNome: TWideStringField;
    qryVendaDataVenda: TDateTimeField;
    qryVendaTotalVenda: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProVenda: TfrmRelProVenda;

implementation

{$R *.dfm}

procedure TfrmRelProVenda.FormCreate(Sender: TObject);
begin
    qryVenda.Open;
end;

procedure TfrmRelProVenda.FormDestroy(Sender: TObject);
begin
    qryVenda.Close;
    qryVendaItens.Close;
end;

end.
