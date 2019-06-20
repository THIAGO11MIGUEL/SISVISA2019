unit SISVISA.Model.CaminhoBD;

interface

uses
  FireDAC.Comp.Client, FMX.ListView.Appearances, System.Classes,
  SISVISA.Model.CaminhoBD.interfaces;

type
  TModelCaminhoDb = class(TInterfacedObject, iModelCaminhoDB)
  private
    FCaminho: string;
    FTabelaCaminho: string;
    Fdesc: string;
    FCaminhoBanco: string;
    FdescricaoBanco: string;
    FIDCaminho: integer;
    FDs: TFDQuery;
    FDescricaoNome : string;
    FCaminhoDoBancoDeDados: string;
  public
    constructor create;
    destructor destroy; override;
    class function New: iModelCaminhoDB;

    function ReceberCaminhoBD: iModelCaminhoDB;
    function PreencherCaminho(value: integer): string;

    function TabelaCaminho(value: string): iModelCaminhoDB;
    function desc(value: string): iModelCaminhoDB;
    function CaminhoBanco(value: string): iModelCaminhoDB;
    function descricaoBanco(value: string): iModelCaminhoDB;
    function DataSet: iModelCaminhoDB;
    function deletaCaminhoDoBanco: iModelCaminhoDB;

    function DescricaoNome (value: string): iModelCaminhoDB;
    function CaminhoDoBancoDeDados(value: string): iModelCaminhoDB;
    function ValidarCampos: iModelCaminhoDB;
    function VerificarDuplicidadeDeRegistros(value: string): iModelCaminhoDB;

  end;

implementation

uses
  U_dmSISVISA, System.SysUtils;

{ TModelCaminhoDb }

function TModelCaminhoDb.CaminhoBanco(value: string): iModelCaminhoDB;
begin
  Result := Self;
  FCaminhoBanco := value;
end;

function TModelCaminhoDb.CaminhoDoBancoDeDados(value: string): iModelCaminhoDB;
begin
  Result := Self;
  FCaminhoDoBancoDeDados := value;
end;

constructor TModelCaminhoDb.create;
begin
  FDs := TFDQuery.create(nil);
end;

function TModelCaminhoDb.DataSet: iModelCaminhoDB;
begin
  Result := Self;

  FDs.Close;
  FDs.sql.Clear;
  FDs.Connection := dmSISVisa.FD_ConnSISVISA;
  FDs.sql.Add('select ' + FCaminhoBanco + ' from ' + FTabelaCaminho + ' where '
    + FdescricaoBanco + ' = ' + Fdesc);
  FDs.Prepared := true;
  FDs.Open;

  FIDCaminho := FDs.FieldByName(FCaminhoBanco).AsInteger;
end;

function TModelCaminhoDb.deletaCaminhoDoBanco: iModelCaminhoDB;
begin
  Result := Self;

  FDs.Close;
  FDs.sql.Clear;
  FDs.Connection := dmSISVisa.FD_ConnSISVISA;
  dmSISVisa.FDtrs_SVisa.StartTransaction;
  FDs.sql.Add(' delete from ' + FTabelaCaminho + ' where  ' + FCaminhoBanco +
    '=' + IntToStr(FIDCaminho));
  FDs.Prepared := true;

  try
    FDs.ExecSQL;
    dmSISVisa.FDtrs_SVisa.Commit;
    dmSISVisa.FDqryCadastros.Close;
  except
    on E: Exception do
      raise Exception.create('Houve um erro ao Excluir dados de (' +
        FCaminhoBanco + '). " ' +
            sLineBreak + E.Message +
            sLineBreak + UnitName +
            sLineBreak + FDs.Text
      );
  end;
end;

function TModelCaminhoDb.desc(value: string): iModelCaminhoDB;
begin
  Result := Self;
  Fdesc := value;
end;

function TModelCaminhoDb.descricaoBanco(value: string): iModelCaminhoDB;
begin
  Result := Self;
  FdescricaoBanco := value;
end;

function TModelCaminhoDb.DescricaoNome(value: string): iModelCaminhoDB;
begin
  Result := Self;
  FDescricaoNome := value;
end;

destructor TModelCaminhoDb.destroy;
begin
  FreeAndNil(FDs);
  inherited;
end;


class function TModelCaminhoDb.New: iModelCaminhoDB;
begin
  Result := Self.create;
end;

function TModelCaminhoDb.PreencherCaminho(value: integer): string;
begin
  FDs.Close;
  FDs.sql.Clear;
  FDs.Connection := dmSISVisa.FD_ConnSISVISA;
  FDs.sql.Text := 'select caminho_bd from caminhobd where cod_caminhobd = ' +
    IntToStr(value);
  FDs.Prepared := true;
  FDs.Open();

  FCaminho := FDs.FieldByName('caminho_bd').AsString;

  Result := FCaminho

end;

function TModelCaminhoDb.ReceberCaminhoBD: iModelCaminhoDB;
begin

  Result := Self;
  // FCaminho := value;
end;

function TModelCaminhoDb.TabelaCaminho(value: string): iModelCaminhoDB;
begin
  Result := Self;
  FTabelaCaminho := value;
end;

function TModelCaminhoDb.ValidarCampos: iModelCaminhoDB;
begin
  Result := Self;

  if (FCaminhoDoBancoDeDados = EmptyStr) then
    raise Exception.Create('Caminho do Banco está vazio');

  if (FDescricaoNome = EmptyStr) then
    raise Exception.Create('informe o nome para identificação ou nome do usuário');

end;

function TModelCaminhoDb.VerificarDuplicidadeDeRegistros(value: string): iModelCaminhoDB;
begin
  Result := Self;

  FDs.Close;
  FDs.sql.Clear;
  FDs.Connection := dmSISVisa.FD_ConnSISVISA;
  FDs.sql.Text := ' select Upper(DESCRICAO) DESCRICAO ' +
                  ' from CAMINHOBD where UPPER(DESCRICAO) = ' + QuotedStr(UpperCase(value));

  FDs.Prepared := true;
  FDs.Open();

  if FDs.RecordCount > 0 then
    raise Exception.Create(' Descrição  : ' + FDescricaoNome + ' Já cadastro, ' +
               sLineBreak + ' Entre com uma nova Descrição' );

end;

end.
