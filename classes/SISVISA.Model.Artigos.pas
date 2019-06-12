unit SISVISA.Model.Artigos;

interface

uses
  FireDAC.Comp.Client, FMX.ListView.Appearances, System.Classes, FMX.Edit;

type
  iModelArtigos = interface
    ['{EF50123E-EF1A-434B-993B-9377BA38289F}']
    function CodArtigo(value: integer): iModelArtigos;
    function Fields(value: string): iModelArtigos;
    function PreencherArtigo: string;
    function Artigo(value: string): iModelArtigos;
    function Paragrafo(value: string): iModelArtigos;
    function Inciso(value: string): iModelArtigos;
  end;

  TModelArtigos = class(TInterfacedObject, iModelArtigos)
  private
    FCodArtigo: integer;
    FFields: string;
    FArtigo: string;
    FInciso: string;
    FParagrafo: string;
  public

    constructor create;
    destructor destroy; override;
    class function New: iModelArtigos;

    function CodArtigo(value: integer): iModelArtigos;
    function Fields(value: string): iModelArtigos;
    function Artigo(value: string): iModelArtigos;
    function Paragrafo(value: string): iModelArtigos;
    function Inciso(value: string): iModelArtigos;

    function PreencherArtigo: string;

  end;

implementation

uses
  U_dmSISVISA, System.SysUtils;

{ TModelCaminhoDb }

{ TModelArtigos }

function TModelArtigos.Artigo(value: string): iModelArtigos;
begin
  Result := Self;
  FArtigo := value;
end;

function TModelArtigos.CodArtigo(value: integer): iModelArtigos;
begin
  Result := Self;
  FCodArtigo := value;
end;

constructor TModelArtigos.create;
begin

end;

destructor TModelArtigos.destroy;
begin
  inherited;
end;

function TModelArtigos.Fields(value: string): iModelArtigos;
begin
  Result := Self;
  FFields := value;
end;

function TModelArtigos.Inciso(value: string): iModelArtigos;
begin
  Result := Self;
  FInciso := value;
end;

class function TModelArtigos.New: iModelArtigos;
begin
  Result := Self.create;
end;

function TModelArtigos.Paragrafo(value: string): iModelArtigos;
begin
  Result := Self;
  FParagrafo := value;
end;

function TModelArtigos.PreencherArtigo: string;
var
  qry: TFDQuery;
begin
  qry := TFDQuery.create(nil);
  try
    qry.Close;
    qry.SQL.Clear;
    qry.Connection := dmSISVISA.FD_ConnSISVISA;
    qry.SQL.Text := 'select ' + FFields + ' from artigos where cod_artigo = ' +
      intToStr(FCodArtigo);
    qry.Prepared := true;
    qry.Open();

    FArtigo := qry.FieldByName(FFields).AsString;
  finally
    qry.destroy;
  end;

  Result := FArtigo;
end;

end.
