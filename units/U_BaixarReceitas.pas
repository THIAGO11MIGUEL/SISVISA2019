unit U_BaixarReceitas;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  MultiDetailAppearanceU,
  FMX.ListBox,
  FMX.Layouts,
  FMX.ListView,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.TabControl,
  FMX.Edit,
  FMX.DateTimeCtrls,
  Data.DB,
  Datasnap.DBClient,
  System.Actions,
  FMX.ActnList,
  Classes.Utils.View,
  FireDAC.Comp.Client, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, FMX.Grid.Style, Fmx.Bind.Grid,
  Data.Bind.Grid, FMX.ScrollBox, FMX.Grid, Data.Bind.Components,
  Data.Bind.DBScope;

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
    ListBox1: TListBox;
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
    changeTabDadosReceitas: TChangeTabAction;
    changeTabBaixarReceitas: TChangeTabAction;
    lvwReceitasBaixa: TListView;
    cdsBaixaReceitas: TClientDataSet;
    cdsBaixaReceitasCOD_RECEITA: TIntegerField;
    cdsBaixaReceitasNUM_INICIAL: TIntegerField;
    cdsBaixaReceitasNUM_FINAL: TIntegerField;
    cdsBaixaReceitasNUM_BLOCO: TIntegerField;
    lvwDadosReceitas: TListView;
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

uses U_SISVISA, Classes.Utils.Consts, U_dmSISVISA, U_CADASTROPADRAO,
  U_MensagemPadrao;

procedure TfrmBaixarReceitas.actBaixarExecute(Sender: TObject);
var
  campos, dt_baixa, responsavel: string;
  RST: Boolean;
begin
  dt_baixa := FormatDateTime('dd.mm.yyyy', dtedtDataBaixa.Date);
  responsavel := QuotedStr(edtResponsavelBaixa.Text);

  if cdsBaixaReceitas.RecordCount > 0 then
  begin
    cdsBaixaReceitas.First;

    cdsBaixaReceitas.Open;
    while not cdsBaixaReceitas.Eof do
    begin
      Cod_Rec := cdsBaixaReceitasCOD_RECEITA.Value;
      NumInicio := cdsBaixaReceitasNUM_INICIAL.Value;
      NumFinal := cdsBaixaReceitasNUM_FINAL.Value;
      Bloco := cdsBaixaReceitasNUM_BLOCO.Value;

      campos := IntToStr(Cod_Rec) + ', ' + QuotedStr(dt_baixa)
        + ', ' + IntToStr(Bloco) + ', ' +
        IntToStr(NumInicio) + ', ' + IntToStr(NumFinal) +
        ', ' + responsavel;

      FUtilsCAD.Incluir(TAB_BAIXA, FD_TAB_BAIXAREC, campos, qry);
      campos := '';
      campos := ' set STATUS = ' + QuotedStr(ST_BAIXADO) + ' where ' + TAB_REC_F1 + ' = ' +IntToStr(Cod_Rec);
      FUtilsCAD.Alterar(TAB_RECEITA, campos, qry);

      cdsBaixaReceitas.Next;
    end;
  end;
  FUtilsCAD.fnc_ExibirMensagem(BAIXA, MSG_BAIXADO, tpBaixar);
end;

procedure TfrmBaixarReceitas.edtBuscaReceitaLancadaClick(Sender: TObject);
var campo: string;
begin
  campo := TAB_VWRECEITA + ' where STATUS = ' + QuotedStr(ST_ABERTO);
  FUtilsCAD.CDReceita(lvwDadosReceitas, qry, campo);//, nil, nil);
  changeTabDadosReceitas.ExecuteTarget(Self);
end;

procedure TfrmBaixarReceitas.FormCreate(Sender: TObject);
begin
  FUtilsCAD := TUtilsView.Create;
  qry := dmSISVISA.FDqryCadastros;
  TabControl1.TabIndex := 0;
  TabControl1.TabPosition := TTabPosition.None;
  cdsBaixaReceitas.CreateDataSet;
end;

procedure TfrmBaixarReceitas.lvwDadosReceitasItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  FUtilsCAD.PreencherReceita(
             lvwDadosReceitas,
             lvwReceitasBaixa,
             NumInicio,
             NumFinal,
             Bloco,
             Cod_Rec,
             cdsBaixaReceitas);

  changeTabBaixarReceitas.ExecuteTarget(Self);
end;

end.
