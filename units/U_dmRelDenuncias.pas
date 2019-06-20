unit U_dmRelDenuncias;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  Datasnap.Provider, Datasnap.DBClient, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.frxClass, FMX.frxDBSet;

type
  TdmRelDenuncias = class(TDataModule)
    frxRelDenuncias: TfrxReport;
    frxdsRelDenuncias: TfrxDBDataset;
    FDqryRelDenuncias: TFDQuery;
    cdsRelDenuncias: TClientDataSet;
    dspRelDenuncias: TDataSetProvider;
    dsRelDenuncias: TDataSource;
    cdsRelDenunciasCODIGO_DETALHE: TIntegerField;
    cdsRelDenunciasCODIGO_DENUNCIA: TIntegerField;
    cdsRelDenunciasENDERECO: TStringField;
    cdsRelDenunciasCODIGO_TIPODENUNCIA: TIntegerField;
    cdsRelDenunciasTIPDENUNCIA: TStringField;
    cdsRelDenunciasDATALANC: TDateField;
    cdsRelDenunciasOBS: TStringField;
    frxDBDataset1: TfrxDBDataset;
    FDQuery1: TFDQuery;
    FDQuery1ENDERECO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRelDenuncias: TdmRelDenuncias;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses U_dmSISVISA;

{$R *.dfm}

end.
