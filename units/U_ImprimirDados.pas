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
  FMX.frxDBSet, Data.DB, Datasnap.Provider, Datasnap.DBClient, FMX.DateTimeCtrls;

type
  tpImprimir = (Denuncias, Receitas);

type
  TfrmImprimirDados = class(TForm)
    Layout1: TLayout;
    btnImprimir: TButton;
    ToolBar1: TToolBar;
    lblTitulo: TLabel;
    panelButtonDados: TPanel;
    TabControl1: TTabControl;
    tabImprimirMenu: TTabItem;
    Layout2: TLayout;
    ActionList1: TActionList;
    actImprimir: TAction;
    tabImprimirReceitas: TTabItem;
    tabImprimirDenuncias: TTabItem;
    lytImprimirReceitas: TLayout;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    Layout3: TLayout;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    ListBoxItem2: TListBoxItem;
    Layout4: TLayout;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    ListBoxItem3: TListBoxItem;
    Layout5: TLayout;
    Label3: TLabel;
    ListBoxItem4: TListBoxItem;
    Layout6: TLayout;
    Label4: TLabel;
    changeTabMenuImprimir: TChangeTabAction;
    changeTabReceitas: TChangeTabAction;
    changeTabDenúncias: TChangeTabAction;
    ListBox2: TListBox;
    lbxitemImprimirDenuncias: TListBoxItem;
    lbxitemImprimirReceitas: TListBoxItem;
    Button1: TButton;
    actVoltar: TAction;
    ListBox3: TListBox;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    Layout7: TLayout;
    Layout8: TLayout;
    Layout9: TLayout;
    Layout10: TLayout;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Label5: TLabel;
    Layout11: TLayout;
    Label6: TLabel;
    Layout12: TLayout;
    Label7: TLabel;
    Layout13: TLayout;
    Label8: TLabel;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    Layout14: TLayout;
    Label9: TLabel;
    Layout15: TLayout;
    RadioButton4: TRadioButton;
    Layout16: TLayout;
    RadioButton5: TRadioButton;
    procedure actImprimirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbxitemImprimirReceitasClick(Sender: TObject);
    procedure actVoltarExecute(Sender: TObject);
    procedure lbxitemImprimirDenunciasClick(Sender: TObject);
  private
    FImpressao: tpImprimir;
    procedure SetImpressao(const Value: tpImprimir);
    { Private declarations }
  public
    { Public declarations }
  published
    property Impressao: tpImprimir read FImpressao write SetImpressao;
  end;

var
  frmImprimirDados: TfrmImprimirDados;

implementation

{$R *.fmx}

uses U_SISVISA, U_dmSISVISA, Classes.Utils.Consts, U_dmRelReceitas,
  U_dmRelDenuncias;

procedure TfrmImprimirDados.actImprimirExecute(Sender: TObject);
begin

    case Impressao of
      Denuncias:
      begin
        with dmRelDenuncias do
        begin
           frxRelDenuncias.ShowReport;
        end;
      end;
      Receitas:
      begin
       with dmRelReceitas do
       begin
         frxRelReceitas.ShowReport;
       end;
      end;
  end;
end;

procedure TfrmImprimirDados.actVoltarExecute(Sender: TObject);
begin
  changeTabMenuImprimir.ExecuteTarget(Self);
  panelButtonDados.Visible := False;
  lblTitulo.Text := IMPRIMIR;
end;

procedure TfrmImprimirDados.FormCreate(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
  TabControl1.TabPosition := TTabPosition.None;
end;

procedure TfrmImprimirDados.lbxitemImprimirDenunciasClick(Sender: TObject);
begin
  Impressao := Denuncias;
  changeTabDenúncias.ExecuteTarget(Self);
  panelButtonDados.Visible := True;
  lblTitulo.Text := IMPRIMIR + IMPRIME_DEN;
end;

procedure TfrmImprimirDados.lbxitemImprimirReceitasClick(Sender: TObject);
begin
  Impressao := Receitas;
  changeTabReceitas.ExecuteTarget(Self);
  panelButtonDados.Visible := True;
  lblTitulo.Text := lblTitulo.Text + IMPRIME_REC;
end;


procedure TfrmImprimirDados.SetImpressao(const Value: tpImprimir);
begin
  FImpressao := Value;
end;

end.
