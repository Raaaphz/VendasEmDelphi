unit uFuncaoCriptografiaTESTE;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, graphics, Controls, Forms, Dialogs;

function Criptografar (const aEntrada: string): string;
function Descriptografar (const aEntrada:string): string;

implementation

function Criptografar (const aEntrada: string): string;
var i, iQtdeEnt, iIntervalo: Integer;
sSaida:String;
sProximoCaracter: String;
begin
  iIntervalo:= 6;
  i         := 0;
  iQtdeEnt := 0;

  if (aEntrada<>EmptyStr) then
  begin
    iQtdeEnt := Length(aEntrada);
    for i  := iQtdeEnt downto 1 do //Faz o loop contrario
      begin
        sProximoCaracter:= Copy(aEntrada, i,1);
        sSaida := sSaida + (char(ord(sProximoCaracter[1] )+iIntervalo));
      end;
  end;

  result:= sSaida;
end;

  function Descriptografar (const aEntrada:string): string;
  var i, iqtdeEnt, iIntervalo:Integer;
  sSaida:String;
  sProximoCaracter :String;
begin
  iIntervalo:= 6;
  i         := 0;
  iQtdeEnt := 0;
  if (aEntrada<>emptyStr) then begin
  iQtdeEnt:= length(aEntrada);

  for i := iqtdeEnt downto 1 do
  begin
    sProximoCaracter := Copy(aEntrada, i, 1);
    sSaida:= sSaida +(char(ord(sProximoCaracter[1])-iIntervalo));
  end;
end;

   Result:= sSaida;
end;
end.

