unit SISVISA.Model.Denuncias;

interface

uses
  FireDAC.Comp.Client, FMX.ListView.Appearances, System.Classes, FMX.Edit,
  FMX.DateTimeCtrls;

type
  iModelDenuncias = interface
    ['{EF50123E-EF1A-434B-993B-9377BA38289F}']
    function ReceberDenuncia: iModelDenuncias;
    function PreencherDenuncia(vlr_den, vlr_tip: integer; f: string;
      p: TEdit; i: TDateEdit): string;
  end;

  TModelDenuncias = class(TInterfacedObject, iModelDenuncias)
  private
    FDataLanc: string;
    FTipoDen: string;
    FEndereco: string;
    procedure SetDataLanc(const value: string);
    procedure SetEndereco(const value: string);
    procedure SetTipoDen(const value: string);

  public

    constructor create;
    destructor destroy; override;
    class function New: iModelDenuncias;

    property Endereco: string read FEndereco write SetEndereco;
    property TipoDen: string read FTipoDen write SetTipoDen;
    property DataLanc: string read FDataLanc write SetDataLanc;

    function ReceberDenuncia: iModelDenuncias;
    function PreencherDenuncia(vlr_den, vlr_tip: integer; f: string;
      p: TEdit; i: TDateEdit): string;

  end;

implementation

uses
  U_dmSISVISA, System.SysUtils;

{ TModelCaminhoDb }

{ TModelArtigos }

constructor TModelDenuncias.create;
begin

end;

destructor TModelDenuncias.destroy;
begin
  inherited;
end;

class function TModelDenuncias.New: iModelDenuncias;
begin
  Result := Self.create;
end;

function TModelDenuncias.PreencherDenuncia(vlr_den, vlr_tip: integer; f: string;
      p: TEdit; i: TDateEdit): string;
var
  qry: TFDQuery;
begin
  qry := TFDQuery.create(nil);
  try
    qry.Close;
    qry.SQL.Clear;
    qry.Connection := dmSISVISA.FD_ConnSISVISA;
    qry.SQL.Text := 'select ' + f +
      ' from vw_denuncias where codigo_tipodenuncia = ' + intToStr(vlr_tip) +
      ' and codigo_denuncia = ' + intToStr(vlr_den);

    qry.Prepared := true;
    qry.Open();

    FEndereco := qry.FieldByName('endereco').AsString;
    FTipoDen := qry.FieldByName('tipdenuncia').AsString;
    FDataLanc := qry.FieldByName('datalanc').AsString;
  finally
    qry.destroy;
  end;

  Result := FEndereco;
  p.Text := FTipoDen;
  i.Text := FDataLanc;
end;

function TModelDenuncias.ReceberDenuncia: iModelDenuncias;
begin
  Result := Self;
  // FArtigo := value;
end;

procedure TModelDenuncias.SetDataLanc(const value: string);
begin
  FDataLanc := value;
end;

procedure TModelDenuncias.SetEndereco(const value: string);
begin
  FEndereco := value;
end;

procedure TModelDenuncias.SetTipoDen(const value: string);
begin
  FTipoDen := value;
end;

end.
