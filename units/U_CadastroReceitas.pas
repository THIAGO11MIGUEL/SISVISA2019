unit U_CadastroReceitas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  U_CADASTROPADRAO, System.Actions, FMX.ActnList, FMX.Controls.Presentation,
  FMX.Layouts, FMX.ListBox, FMX.Edit, FMX.SearchBox, FMX.TabControl,
  FMX.DateTimeCtrls, FMX.EditBox, FMX.NumberBox, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  MultiDetailAppearanceU, FMX.Objects;

type
  TfrmCadastroReceitas = class(TfrmCadastroPadrao)
    actLancar: TAction;
    actLimpar: TAction;
    actBaixar: TAction;
    ListBox2: TListBox;
    ListBoxItem3: TListBoxItem;
    Layout4: TLayout;
    Label3: TLabel;
    Label11: TLabel;
    dtedtLancamentoReceitas: TDateEdit;
    ListBoxItem4: TListBoxItem;
    Layout5: TLayout;
    Label1: TLabel;
    edtUnidadeReceita: TEdit;
    ListBoxItem5: TListBoxItem;
    Layout6: TLayout;
    Label2: TLabel;
    edtTipoReceita: TEdit;
    ListBoxItem6: TListBoxItem;
    Layout7: TLayout;
    Label4: TLabel;
    edtQTDBlocos: TEdit;
    ListBoxItem7: TListBoxItem;
    Layout8: TLayout;
    Label5: TLabel;
    edtNumBlocoInicial: TEdit;
    ListBoxItem8: TListBoxItem;
    edtFolhaInicial: TEdit;
    Layout9: TLayout;
    Label6: TLabel;
    ListBoxItem9: TListBoxItem;
    edtFolhaFinal: TEdit;
    Layout10: TLayout;
    Label7: TLabel;
    ListBoxItem10: TListBoxItem;
    Layout11: TLayout;
    Label8: TLabel;
    edtStatusReceita: TEdit;
    ListBoxItem11: TListBoxItem;
    edtResponsavel: TEdit;
    Layout12: TLayout;
    Label9: TLabel;
    tabTipReceita: TTabItem;
    tabUnidade: TTabItem;
    changeTabUnidades: TChangeTabAction;
    changeTabTipReceita: TChangeTabAction;
    lytTipReceita: TLayout;
    lytUnidades: TLayout;
    lvwDadosTipReceita: TListView;
    lvwDadosUnidade: TListView;
    lvwDadosReceitas: TListView;
    lvPedido: TListView;
    img_sinc: TImage;
    img_nsinc: TImage;
    procedure actInserirExecute(Sender: TObject);
    procedure edtUnidadeReceitaClick(Sender: TObject);
    procedure edtTipoReceitaClick(Sender: TObject);
    procedure lvwDadosTipReceitaItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lvwDadosUnidadeItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure actSalvarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lvwDadosReceitasItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure edtFolhaInicialChange(Sender: TObject);
  private
    { Private declarations }
    lnIDTip, lnIDUnidade: Integer;
  public
    { Public declarations }
  end;

var
  frmCadastroReceitas: TfrmCadastroReceitas;

implementation

{$R *.fmx}

uses Classes.Utils.Consts;

procedure TfrmCadastroReceitas.actInserirExecute(Sender: TObject);
begin
  inherited;
  edtStatusReceita.Text := ST_ABERTO;
end;

procedure TfrmCadastroReceitas.actSalvarExecute(Sender: TObject);
begin
  FUtilsCAD.LancarReceita(dtedtLancamentoReceitas, lnIDUnidade, lnIDTip,
    StrToInt(edtQTDBlocos.Text), StrToInt(edtNumBlocoInicial.Text),
    StrToInt(edtFolhaInicial.Text), StrToInt(edtFolhaFinal.Text),
    edtStatusReceita.Text, edtResponsavel.Text, TAB_RECEITA, qry);
  inherited;
  FUtilsCAD.CDReceita(lvwDadosReceitas, qry, TAB_RECEITA, nil, nil);
end;

procedure TfrmCadastroReceitas.edtFolhaInicialChange(Sender: TObject);
var
  qtd, vinicio: Integer;
begin

  qtd := StrToInt(edtQTDBlocos.Text);
  vinicio := StrToInt(edtFolhaInicial.Text);
  edtFolhaFinal.Text := IntToStr(FUtilsCAD.CalculaFolhaFinal(vinicio, qtd,
    lnIDTip));

end;

procedure TfrmCadastroReceitas.edtTipoReceitaClick(Sender: TObject);
begin
  changeTabTipReceita.ExecuteTarget(Self);
  FUtilsCAD.CDTipReceita(lvwDadosTipReceita, qry, TAB_TIPRECEITA);
end;

procedure TfrmCadastroReceitas.edtUnidadeReceitaClick(Sender: TObject);
begin
  changeTabUnidades.ExecuteTarget(Self);
  FUtilsCAD.CDUnidade(lvwDadosUnidade, qry, TAB_UNIDADE);
end;

procedure TfrmCadastroReceitas.FormCreate(Sender: TObject);
begin
  inherited;
//  FUtilsCAD.CDReceita(lvwDadosReceitas, qry, TAB_VWRECEITA);
  img_sinc.Visible := False;
  img_nsinc.Visible := False;
  FUtilsCAD.CDReceita(lvPedido, qry, TAB_VWRECEITA, img_sinc, img_nsinc);
end;

procedure TfrmCadastroReceitas.lvwDadosReceitasItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var
  status: string;
begin
  status := (Copy(lvwDadosReceitas.Items[lvwDadosReceitas.Selected.Index].Data
    [TMultiDetailAppearanceNames.Detail3].ToString, 10, 10));

  if status = ST_ABERTO then
    ShowMessage(ST_ABERTO)
  else
    ShowMessage(ST_BAIXADO);

end;

procedure TfrmCadastroReceitas.lvwDadosTipReceitaItemClick
  (const Sender: TObject; const AItem: TListViewItem);
VAR
  TIPO: string;
begin
  TIPO := lvwDadosTipReceita.Items[lvwDadosTipReceita.Selected.Index].Text;
  edtTipoReceita.Text := TIPO;
  lnIDTip := FUtilsCAD.RetornaID(TAB_TIPRECEITA, QuotedStr(TIPO), TAB_TPREC_F1,
    TAB_TPREC_F2, qry);
  changeTabCadastro.ExecuteTarget(Self);
end;

procedure TfrmCadastroReceitas.lvwDadosUnidadeItemClick(const Sender: TObject;
  const AItem: TListViewItem);
VAR
  UNI: string;
begin
  UNI := lvwDadosUnidade.Items[lvwDadosUnidade.Selected.Index].Text;
  edtUnidadeReceita.Text := UNI;
  lnIDUnidade := FUtilsCAD.RetornaID(TAB_UNIDADE, QuotedStr(UNI), TAB_UNI_F1,
    TAB_UNI_F2, qry);
  changeTabCadastro.ExecuteTarget(Self);
end;

end.
