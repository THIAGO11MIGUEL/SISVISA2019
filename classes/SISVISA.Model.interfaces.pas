unit SISVISA.Model.interfaces;

interface

type
  iArquivoINI = interface
    ['{0E960C3E-DF87-4C2C-AEF0-25553E67FDDF}']
    function ReadIni(lcIni, lcSessao, lcSub: string): string;
    procedure WriteIni(lcIni, lcSessao, lcSub, lcValor: string);
    function IniFile: string;
  end;

implementation

end.
