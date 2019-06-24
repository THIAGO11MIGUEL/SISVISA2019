unit SISVISA.Model.Arquivo.Ini;

interface

uses
  SISVISA.Model.interfaces, FMX.Forms, System.IOUtils;

type
  TModelArquivoIni = class(TInterfacedObject, iArquivoINI)
  private

  public
    constructor create;
    destructor destroy; override;
    class function New: iArquivoINI;

    function ReadIni(lcIni, lcSessao, lcSub: string): string;
    procedure WriteIni(lcIni, lcSessao, lcSub, lcValor: string);
    function IniFile: string;
  end;

implementation

uses
  System.SysUtils, IniFiles  ;

{ TModelArquivoIni }

constructor TModelArquivoIni.create;
begin

end;

destructor TModelArquivoIni.destroy;
begin

  inherited;
end;

function TModelArquivoIni.IniFile: string;
begin
  Result :=  ExtractFilePath(ParamStr(0)) + 'Caminho.ini';
end;

class function TModelArquivoIni.New: iArquivoINI;
begin
  result := Self.create;
end;

function TModelArquivoIni.ReadIni(lcIni, lcSessao, lcSub: string): string;
var
  loINI: TIniFile;
begin
  loINI := TIniFile.Create(lcIni);
  try
    result := loINI.ReadString(lcSessao, lcSub, '');
  finally
    FreeAndNil(loINI);
  end;
end;

procedure TModelArquivoIni.WriteIni(lcIni, lcSessao, lcSub, lcValor: string);
var
  loINI: TIniFile;
begin
  loINI := TIniFile.Create(lcIni);
  try
    loINI.WriteString(lcSessao, lcSub, lcValor);
  finally
    FreeAndNil(loINI);
  end;
end;

end.
