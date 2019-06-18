unit U_ImprimirDados;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.frxClass, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Objects, FMX.ListBox, FMX.TabControl, System.Actions,
  FMX.ActnList, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FMX.frxDBSet, Data.DB, Datasnap.Provider, Datasnap.DBClient;

type
  TfrmImprimirDados = class(TForm)
    Layout1: TLayout;
    btnImprimir: TButton;
    ToolBar1: TToolBar;
    lblTitulo: TLabel;
    panelButtonDados: TPanel;
    TabControl1: TTabControl;
    tabImprimir: TTabItem;
    Layout2: TLayout;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ActionList1: TActionList;
    actImprimir: TAction;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    DataSource1: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    FDQuery1: TFDQuery;
    ClientDataSet1COD_BAIXA: TIntegerField;
    ClientDataSet1DATA_BAIXA: TDateField;
    ClientDataSet1NUM_BLOCO_BAIXA: TIntegerField;
    ClientDataSet1NUM_INICIAL_BAIXA: TIntegerField;
    ClientDataSet1NUM_FINAL_BAIXA: TIntegerField;
    ClientDataSet1COD_RECEITA: TIntegerField;
    ClientDataSet1DATA_LANC: TDateField;
    ClientDataSet1QUANTIDADE: TIntegerField;
    ClientDataSet1NUM_BLOCO: TIntegerField;
    ClientDataSet1NUM_INICIAL: TIntegerField;
    ClientDataSet1NUM_FINAL: TIntegerField;
    ClientDataSet1COD_UNIDADE: TIntegerField;
    ClientDataSet1UNIDADE: TStringField;
    ClientDataSet1COD_TIP: TIntegerField;
    ClientDataSet1TIPO_RECEITA: TStringField;
    ClientDataSet1MEDICO: TStringField;
    ClientDataSet1SOLICITANTE: TStringField;
    ClientDataSet1STATUS: TStringField;
    FDQuery1COD_BAIXA: TIntegerField;
    FDQuery1DATA_BAIXA: TDateField;
    FDQuery1NUM_BLOCO_BAIXA: TIntegerField;
    FDQuery1NUM_INICIAL_BAIXA: TIntegerField;
    FDQuery1NUM_FINAL_BAIXA: TIntegerField;
    FDQuery1COD_RECEITA: TIntegerField;
    FDQuery1DATA_LANC: TDateField;
    FDQuery1QUANTIDADE: TIntegerField;
    FDQuery1NUM_BLOCO: TIntegerField;
    FDQuery1NUM_INICIAL: TIntegerField;
    FDQuery1NUM_FINAL: TIntegerField;
    FDQuery1COD_UNIDADE: TIntegerField;
    FDQuery1UNIDADE: TStringField;
    FDQuery1COD_TIP: TIntegerField;
    FDQuery1TIPO_RECEITA: TStringField;
    FDQuery1MEDICO: TStringField;
    FDQuery1SOLICITANTE: TStringField;
    FDQuery1STATUS: TStringField;
    frxReport1: TfrxReport;
    procedure actImprimirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImprimirDados: TfrmImprimirDados;

implementation

{$R *.fmx}

uses U_SISVISA, U_dmSISVISA;

procedure TfrmImprimirDados.actImprimirExecute(Sender: TObject);
begin
  frxReport1.SHOWREPORT;
end;

procedure TfrmImprimirDados.FormCreate(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
  TabControl1.TabPosition := TTabPosition.None;
end;

end.
