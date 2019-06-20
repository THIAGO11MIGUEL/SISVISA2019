unit U_dmRelReceitas;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FMX.frxClass,
  Datasnap.DBClient, FMX.frxDBSet, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.Provider;

type
  TdmRelReceitas = class(TDataModule)
    dsRelReceitas: TDataSource;
    dspRelReceitas: TDataSetProvider;
    FDqryRelReceitas: TFDQuery;
    FDqryRelReceitasCOD_BAIXA: TIntegerField;
    FDqryRelReceitasDATA_BAIXA: TDateField;
    FDqryRelReceitasNUM_BLOCO_BAIXA: TIntegerField;
    FDqryRelReceitasNUM_INICIAL_BAIXA: TIntegerField;
    FDqryRelReceitasNUM_FINAL_BAIXA: TIntegerField;
    FDqryRelReceitasCOD_RECEITA: TIntegerField;
    FDqryRelReceitasDATA_LANC: TDateField;
    FDqryRelReceitasQUANTIDADE: TIntegerField;
    FDqryRelReceitasNUM_BLOCO: TIntegerField;
    FDqryRelReceitasNUM_INICIAL: TIntegerField;
    FDqryRelReceitasNUM_FINAL: TIntegerField;
    FDqryRelReceitasCOD_UNIDADE: TIntegerField;
    FDqryRelReceitasUNIDADE: TStringField;
    FDqryRelReceitasCOD_TIP: TIntegerField;
    FDqryRelReceitasTIPO_RECEITA: TStringField;
    FDqryRelReceitasMEDICO: TStringField;
    FDqryRelReceitasSOLICITANTE: TStringField;
    FDqryRelReceitasSTATUS: TStringField;
    frxdsRelReceitas: TfrxDBDataset;
    cdsRelReceitas: TClientDataSet;
    cdsRelReceitasCOD_BAIXA: TIntegerField;
    cdsRelReceitasDATA_BAIXA: TDateField;
    cdsRelReceitasNUM_BLOCO_BAIXA: TIntegerField;
    cdsRelReceitasNUM_INICIAL_BAIXA: TIntegerField;
    cdsRelReceitasNUM_FINAL_BAIXA: TIntegerField;
    cdsRelReceitasCOD_RECEITA: TIntegerField;
    cdsRelReceitasDATA_LANC: TDateField;
    cdsRelReceitasQUANTIDADE: TIntegerField;
    cdsRelReceitasNUM_BLOCO: TIntegerField;
    cdsRelReceitasNUM_INICIAL: TIntegerField;
    cdsRelReceitasNUM_FINAL: TIntegerField;
    cdsRelReceitasCOD_UNIDADE: TIntegerField;
    cdsRelReceitasUNIDADE: TStringField;
    cdsRelReceitasCOD_TIP: TIntegerField;
    cdsRelReceitasTIPO_RECEITA: TStringField;
    cdsRelReceitasMEDICO: TStringField;
    cdsRelReceitasSOLICITANTE: TStringField;
    cdsRelReceitasSTATUS: TStringField;
    frxRelReceitas: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRelReceitas: TdmRelReceitas;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
