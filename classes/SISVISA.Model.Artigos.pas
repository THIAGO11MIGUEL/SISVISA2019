unit SISVISA.Model.Artigos;

interface

uses
  FireDAC.Comp.Client, FMX.ListView.Appearances, System.Classes;

type
  iModelArtigos = interface
    ['{EF50123E-EF1A-434B-993B-9377BA38289F}']
    function ReceberArtigo: iModelArtigos;
    function PreencherArtigo(value: integer; f, p, i: string): string;
  end;

  TModelArtigos = class(TInterfacedObject, iModelArtigos)
  private
    FArtigo: string;
    Finciso: string;
    Fparag: string;
    procedure Setinciso(const Value: string);
    procedure Setparag(const Value: string);
  public

    constructor create;
    destructor destroy; override;
    class function New: iModelArtigos;

    property parag: string read Fparag write Setparag;
    property inciso: string read Finciso write Setinciso;

    function ReceberArtigo: iModelArtigos;
    function PreencherArtigo(value: integer; f, p, i: string): string;

  end;

implementation

uses
  U_dmSISVISA, System.SysUtils, U_CadastroArtigos;

{ TModelCaminhoDb }

{ TModelArtigos }

constructor TModelArtigos.create;
begin

end;

destructor TModelArtigos.destroy;
begin
  inherited;
end;

class function TModelArtigos.New: iModelArtigos;
begin
  Result := Self.create;
end;

function TModelArtigos.PreencherArtigo(value: integer; f, p, i: string): string;
var
  qry: TFDQuery;
begin
  qry := TFDQuery.create(nil);
  try
    qry.Close;
    qry.SQL.Clear;
    qry.Connection := dmSISVISA.FD_ConnSISVISA;
    qry.SQL.Text :=
      'select ' + f +' from artigos where cod_artigo = ' +
      intToStr(value);
    qry.Prepared := true;
    qry.Open();

    FArtigo := qry.FieldByName('descricao').AsString;
   { parag := qry.FieldByName('paragrafo').AsString;
    inciso := qry.FieldByName('inciso').AsString;}
  finally
    qry.destroy;
  end;

  Result := FArtigo;
//  p := parag;
//  i := inciso;
end;

function TModelArtigos.ReceberArtigo: iModelArtigos;
begin
  Result := Self;
  // FArtigo := value;
end;
procedure TModelArtigos.Setinciso(const Value: string);
begin
  Finciso := Value;
end;

procedure TModelArtigos.Setparag(const Value: string);
begin
  Fparag := Value;
end;

end.
