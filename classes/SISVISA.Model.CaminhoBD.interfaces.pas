unit SISVISA.Model.CaminhoBD.interfaces;

interface

type
  iModelCaminhoDB = interface
    ['{DC988476-EA72-4DED-9344-1183187D996E}']
    function ReceberCaminhoBD: iModelCaminhoDB;
    function PreencherCaminho(value: integer): string;

    function TabelaCaminho(value: string): iModelCaminhoDB;
    function desc(value: string): iModelCaminhoDB;
    function CaminhoBanco(value: string): iModelCaminhoDB;
    function descricaoBanco(value: string): iModelCaminhoDB;
    function DataSet: iModelCaminhoDB;
    function DescricaoNome(value: string): iModelCaminhoDB;
    function CaminhoDoBancoDeDados(value: string): iModelCaminhoDB;
    function ValidarCampos: iModelCaminhoDB;
    function VerificarDuplicidadeDeRegistros(value: string): iModelCaminhoDB;

    function deletaCaminhoDoBanco: iModelCaminhoDB;
  end;

implementation

end.
