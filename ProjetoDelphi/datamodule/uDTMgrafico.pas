unit uDTMgrafico;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TdtmGrafico = class(TDataModule)
    qryProdutoEstoque: TZQuery;
    qryProdutoEstoqueLabel: TWideStringField;
    qryProdutoEstoqueValue: TFloatField;
    dtsProdutoEstoque: TDataSource;
    qryValorVendaPorCliente: TZQuery;
    dtsValorVendaPorCliente: TDataSource;
    qryValorVendaPorClientelabel: TWideStringField;
    qryValorVendaPorClienteValue: TFloatField;
    qryTopProdutosVendidos: TZQuery;
    dtsTopProdutosVendidos: TDataSource;
    qryTopProdutosVendidosLabel: TWideStringField;
    qryTopProdutosVendidosValue: TFloatField;
    qryVendaUltimaSemana: TZQuery;
    dtsVendaUltimaSemana: TDataSource;
    qryVendaUltimaSemanaLabel: TWideStringField;
    qryVendaUltimaSemanaValue: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmGrafico: TdtmGrafico;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
