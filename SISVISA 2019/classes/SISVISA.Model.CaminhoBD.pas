unit SISVISA.Model.CaminhoBD;

interface

uses
  FireDAC.Comp.Client, FMX.ListView.Appearances, System.Classes;

type
  iModelCaminhoDB = interface
    ['{EF50123E-EF1A-434B-993B-9377BA38289F}']
    function ReceberCaminhoBD: iModelCaminhoDB;
    function PreencherCaminho(value: integer): string;
  end;

  TModelCaminhoDb = class(TInterfacedObject, iModelCaminhoDB)
  private
    FCaminho: string;
  public
    constructor create;
    destructor destroy; override;
    class function New: iModelCaminhoDB;

    function ReceberCaminhoBD: iModelCaminhoDB;
    function PreencherCaminho(value: integer): string;

  end;

implementation

uses
  U_dmSISVISA, System.SysUtils;

{ TModelCaminhoDb }

constructor TModelCaminhoDb.create;
begin

end;

destructor TModelCaminhoDb.destroy;
begin
  inherited;
end;

class function TModelCaminhoDb.New: iModelCaminhoDB;
begin
  Result := Self.create;
end;

function TModelCaminhoDb.PreencherCaminho(value: integer): string;
var
  qry: TFDQuery;
begin
  qry := TFDQuery.create(nil);
  try
    qry.Close;
    qry.SQL.Clear;
    qry.Connection := dmSISVISA.FD_ConnSISVISA;
    qry.SQL.Text :=
      'select caminho_bd from caminhobd where cod_caminhobd = ' + intToStr(value);
    qry.Prepared := true;
    qry.Open();

    FCaminho := qry.FieldByName('caminho_bd').AsString;

  finally
    qry.destroy;
  end;

  Result := FCaminho

end;

function TModelCaminhoDb.ReceberCaminhoBD: iModelCaminhoDB;
begin

  Result := Self;
  //FCaminho := value;
end;


end.
