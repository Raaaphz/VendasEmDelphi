unit cUsuarioLogado;
interface

uses System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Dialogs, System.SysUtils;

type
  TUsuarioLogado = Class
    private
    F_usuarioId:Integer;
    F_nome:String;
    F_senha: string;

    public

    published
      property codigo :integer read f_usuarioId write f_usuarioId;
      property nome :string read F_nome write F_nome;
      property senha :string read F_senha write F_senha;
  End;

implementation

end.
