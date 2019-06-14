unit U_BaixarReceitas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  MultiDetailAppearanceU, FMX.ListBox, FMX.Layouts, FMX.ListView, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.TabControl, FMX.Edit, FMX.DateTimeCtrls,
  Data.DB, Datasnap.DBClient, System.Actions, FMX.ActnList, Classes.Utils.View,
  FireDAC.Comp.Client;

type
  TfrmBaixarReceitas = class(TForm)
    Layout1: TLayout;
    TabControl1: TTabControl;
    tabBaixar: TTabItem;
    layoutDados: TLayout;
    panelButtonDados: TPanel;
    btnAddReceita: TButton;
    btnRemoverReceita: TButton;
    btnBaixarReceita: TButton;
    tabReceitas: TTabItem;
    layoutCadastro: TLayout;
    ToolBar1: TToolBar;
    lblTitulo: TLabel;
    lvwDadosReceitas: TListView;
    ListBox1: TListBox;
    lvwReceitasBaixa: TListView;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    Layout2: TLayout;
    Layout3: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    ListBoxItem3: TListBoxItem;
    Layout4: TLayout;
    Label3: TLabel;
    dtedtDataBaixa: TDateEdit;
    edtResponsavelBaixa: TEdit;
    edtBuscaReceitaLancada: TEdit;
    ActionList1: TActionList;
    actRemover: TAction;
    actBaixar: TAction;
    actAdicionar: TAction;
    cdsBaixaReceitas: TClientDataSet;
    cdsBaixaReceitasCOD_RECEITA: TIntegerField;
    changeTabDadosReceitas: TChangeTabAction;
    changeTabBaixarReceitas: TChangeTabAction;
    cdsBaixaReceitasNUM_INICIAL: TIntegerField;
    cdsBaixaReceitasNUM_FINAL: TIntegerField;
    cdsBaixaReceitasNUM_BLOCO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure edtBuscaReceitaLancadaClick(Sender: TObject);
    procedure lvwDadosReceitasItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure actBaixarExecute(Sender: TObject);
  private
    { Private declarations }
    FUtilsCAD: TUtilsView;
    qry: TFDQuery;
    Cod_Rec, NumInicio, NumFinal, Bloco: Integer;
  public
    { Public declarations }
  end;

var
  frmBaixarReceitas: TfrmBaixarReceitas;

implementation

{$R *.fmx}

uses U_SISVISA, Classes.Utils.Consts, U_dmSISVISA, U_CADASTROPADRAO;

procedure TfrmBaixarReceitas.actBaixarExecute(Sender: TObject);
var
  campos, dt_baixa, responsavel: string;
begin
  dt_baixa := FormatDateTime('dd.mm.yyyy', dtedtDataBaixa.Date);
  responsavel := QuotedStr(edtResponsavelBaixa.Text);

  if cdsBaixaReceitas.RecordCount > 0 then
  begin
    cdsBaixaReceitas.First;

    while not cdsBaixaReceitas.Eof do
    begin
      Cod_Rec := cdsBaixaReceitasCOD_RECEITA.Value;
      NumInicio := cdsBaixaReceitasNUM_INICIAL.Value;
      NumFinal := cdsBaixaReceitasNUM_FINAL.Value;
      Bloco := cdsBaixaReceitasNUM_BLOCO.Value;

      campos := '(' + QuotedStr(IntToStr(Cod_Rec)) + ', ' + QuotedStr(dt_baixa)
        + ', ' + QuotedStr(IntToStr(Bloco)) + ', ' +
        QuotedStr(IntToStr(NumInicio)) + ', ' + QuotedStr(IntToStr(NumFinal)) +
        ', ' + responsavel + ')';

      FUtilsCAD.Incluir(TAB_BAIXA, FD_TAB_BAIXAREC, campos, qry);
      campos := '';
      campos := ' set STATUS = ' + ST_BAIXADO;
      FUtilsCAD.Alterar(TAB_RECEITA, campos, qry);

      cdsBaixaReceitas.Next;
    end;
  end;
end;

procedure TfrmBaixarReceitas.edtBuscaReceitaLancadaClick(Sender: TObject);
var campo: string;
begin
  campo := TAB_VWRECEITA + ' where STATUS = ' + QuotedStr(ST_ABERTO);
  FUtilsCAD.CDReceita(lvwDadosReceitas, qry, campo);
  changeTabDadosReceitas.ExecuteTarget(Self);
end;

procedure TfrmBaixarReceitas.FormCreate(Sender: TObject);
begin
  FUtilsCAD := TUtilsView.Create;
  qry := dmSISVISA.FDqryCadastros;
  TabControl1.TabIndex := 0;
  TabControl1.TabPosition := TTabPosition.None;
end;

procedure TfrmBaixarReceitas.lvwDadosReceitasItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  FUtilsCAD.PreencherReceita(lvwDadosReceitas, lvwReceitasBaixa, NumInicio,
    NumFinal, Bloco, Cod_Rec, cdsBaixaReceitas);
  changeTabBaixarReceitas.ExecuteTarget(Self);
end;

end.
