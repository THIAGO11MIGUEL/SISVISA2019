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
  FMX.frxDBSet, Data.DB, Datasnap.Provider, Datasnap.DBClient,
  FMX.DateTimeCtrls, FMX.Edit, Classes.Utils.View;

type
  tpImprimir = (Denuncias, Receitas);

type
  tpDadosDenuncia = (Relatorio, Lista);

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
    dtedtInicial: TDateEdit;
    ListBoxItem2: TListBoxItem;
    Layout4: TLayout;
    Label2: TLabel;
    dtedtFinal: TDateEdit;
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
    dtedtFim: TDateEdit;
    dtedtInicio: TDateEdit;
    Layout14: TLayout;
    Label9: TLabel;
    Layout15: TLayout;
    rbtnListaDenuncias: TRadioButton;
    Layout16: TLayout;
    rbtnRelDenuncias: TRadioButton;
    lbxitUsuario: TListBoxItem;
    Edit1: TEdit;
    ListBoxItem9: TListBoxItem;
    Edit2: TEdit;
    procedure actImprimirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbxitemImprimirReceitasClick(Sender: TObject);
    procedure actVoltarExecute(Sender: TObject);
    procedure lbxitemImprimirDenunciasClick(Sender: TObject);
    procedure rbtnRelDenunciasClick(Sender: TObject);
    procedure rbtnListaDenunciasClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FImpressao: tpImprimir;
    FDados: tpDadosDenuncia;
    FUtils: TUtilsView;
    procedure SetImpressao(const Value: tpImprimir);
    procedure SetDados(const Value: tpDadosDenuncia);

    { Private declarations }
  public
    { Public declarations }
    qryDen, qryRec: TFDQuery;
  published
    property Impressao: tpImprimir read FImpressao write SetImpressao;
    property Dados: tpDadosDenuncia read FDados write SetDados;
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
          FUtils.ImprimirRelatorio(TAB_VWDEN, VW_DEN_F6, 'Denuncias',
            dtedtInicio, dtedtFim, qryDen);
          case Dados of
            Relatorio:
              begin
                ppRelDenuncias.Print;
              end;
            Lista:
              begin
                ppListaDenuncias.Print;
              end;
          end;
        end;
      end;
    Receitas:
      begin
        with dmRelReceitas do
        begin
          FUtils.ImprimirRelatorio(TAB_VWRECEITA, VW_REC_F7, 'Receitas',
            dtedtInicial, dtedtFinal, qryRec);
          ppRelReceitas.Print;
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
  FUtils := TUtilsView.Create;
  qryDen := dmRelDenuncias.FDqryRelDenuncias;
  qryRec := dmRelReceitas.FDqryRelReceitas;
  TabControl1.TabIndex := 0;
  TabControl1.TabPosition := TTabPosition.None;
end;

procedure TfrmImprimirDados.FormDestroy(Sender: TObject);
begin
  FUtils.Destroy;
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

procedure TfrmImprimirDados.rbtnListaDenunciasClick(Sender: TObject);
begin
  Dados := Lista;
end;

procedure TfrmImprimirDados.rbtnRelDenunciasClick(Sender: TObject);
begin
  Dados := Relatorio;
end;

procedure TfrmImprimirDados.SetDados(const Value: tpDadosDenuncia);
begin
  FDados := Value;
end;

procedure TfrmImprimirDados.SetImpressao(const Value: tpImprimir);
begin
  FImpressao := Value;
end;

end.
