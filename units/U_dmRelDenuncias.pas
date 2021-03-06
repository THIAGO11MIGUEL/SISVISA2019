unit U_dmRelDenuncias;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  Datasnap.Provider, Datasnap.DBClient, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.frxClass, FMX.frxDBSet, ppCtrls, ppDB, ppDBPipe,
  ppVar, ppPrnabl, ppClass, ppBands, ppCache, ppDesignLayer, ppParameter,
  ppComm, ppRelatv, ppProd, ppReport, daDataView, daQueryDataView, daFireDAC,
  ppModule, daDataModule;

type
  TdmRelDenuncias = class(TDataModule)
    frxRelDenuncias: TfrxReport;
    frxdsRelDenuncias: TfrxDBDataset;
    frxDBDataset1: TfrxDBDataset;
    ppRelDenuncias: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppSystemVariable1: TppSystemVariable;
    pplblPeriodo: TppLabel;
    ppLine3: TppLine;
    pplblTextoRodape: TppLabel;
    ppDBPipeline1: TppDBPipeline;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppdbListaDenuncias: TppDBPipeline;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppListaDenuncias: TppReport;
    ppParameterList2: TppParameterList;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLabel7: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppTitleBand2: TppTitleBand;
    ppLine2: TppLine;
    ppDBText6: TppDBText;
    pplblPeriodo1: TppLabel;
    ppDadosRodap�1: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLine5: TppLine;
    ppDBText7: TppDBText;
    cdsRelDenuncias: TClientDataSet;
    dspRelDenuncias: TDataSetProvider;
    dsRelDenuncias: TDataSource;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    FDqryRelDenuncias: TFDQuery;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBText10: TppDBText;
    ppLabel12: TppLabel;
    ppDBText11: TppDBText;
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
