unit U_dmSISVISA;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  FireDAC.Phys.IBDef, FireDAC.Phys.IBBase, FireDAC.Phys.IB, FireDAC.Comp.UI,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef;

type
  TdmSISVISA = class(TDataModule)
    FD_ConnSISVISA: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDtrs_SVisa: TFDTransaction;
    FDqryCadastros: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSISVISA: TdmSISVISA;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
