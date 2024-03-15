unit cArquivoINI;
interface

uses System.Classes,
vcl.Controls,
vcl.Dialogs,
System.SysUtils,
System.IniFiles,
Vcl.Forms;


type
  TarquivoINI=class
    private

    public
    class function ArquivoINI:string; static;
    class function LerIni(aSecao:String; aEntrada:String):String; Static;
    class procedure AtualizarINI(aSecao, aEntrada, aValor: String); static;
  end;
implementation

{ TarquvioINI }

class function TarquivoINI.ArquivoINI: string;
begin
  result:=ChangeFileExt(Application.ExeName, '.INI');
end;

class procedure TarquivoINI.AtualizarINI(aSecao, aEntrada, aValor: String);
var Ini:TIniFile;
begin
  try
    ini:=TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
    Ini.WriteString(aSecao, aEntrada, aValor);
  finally
    Ini.Free;
  end;
end;

class function TarquivoINI.LerIni(aSecao, aEntrada: String): String;
var ini:TiniFile;
begin
try
  Ini:=TIniFile.Create(arquivoIni);
  Result:= ini.ReadString(aSecao, aEntrada, 'NAO ENCONTRADO' );
finally
Ini.Free;
end;
end;

end.
