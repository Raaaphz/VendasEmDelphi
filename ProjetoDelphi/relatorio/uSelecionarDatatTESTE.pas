unit uSelecionarDatatTESTE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RxToolEdit, System.DateUtils,
  Vcl.Buttons;

type
  TfrmSelecionarData = class(TForm)
    edtDataInicio: TDateEdit;
    Label3: TLabel;
    edtDataFinal: TDateEdit;
    Label1: TLabel;
    btnOK: TBitBtn;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionarData: TfrmSelecionarData;

implementation

{$R *.dfm}

procedure TfrmSelecionarData.FormShow(Sender: TObject);
begin
  edtDataInicio.Date :=StartOfTheMonth(Date);
  edtDataFinal.Date :=EndOfTheMonth(Date);
end;

procedure TfrmSelecionarData.btnOKClick(Sender: TObject);
begin
  if (edtDataInicio.date=0) and (edtDataFinal.Date=0) then begin
     MessageDlg('Data Inicial e Final s�o campos obrigat�rios',MtInformation, [mbOK], 0);
    edtDatainicio.SetFocus;
    abort;
  end
  else if (edtDataInicio.date=0) then begin
    MessageDlg('Data Inicial � campo obrigat�rio',MtInformation, [mbOK], 0);
    edtDatainicio.SetFocus;
    abort;
  end
  else if (edtDataFinal.Date=0) then begin
       MessageDLg('Data Final � campo obrigat�rio', mtInformation, [mbOK], 0);
       edtDataFinal.SetFocus;
       abort;
  end;

    if(edtDataFinal.Date) < (edtDataInicio.Date) then begin
    MessageDlg('Data Final n�o pode ser maior que a data inicio', mtInformation, [mbOK], 0);
    edtDataFinal.SetFocus;
    abort;
  end;

  Close;
end;

end.

