unit U_AtenderDenuncia;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.TabControl, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.DateTimeCtrls,
  FMX.Edit, FMX.ListBox, FMX.ListView, System.Actions, FMX.ActnList,
  Classes.Utils.View, FireDAC.Comp.Client, MultiDetailAppearanceU,
  U_MensagemPadrao;

type
  TfrmAtenderDenuncias = class(TForm)
    Layout1: TLayout;
    TabControl1: TTabControl;
    tabAtenderDenuncias: TTabItem;
    layoutDados: TLayout;
    panelButtonDados: TPanel;
    tabListaDenuncias: TTabItem;
    layoutCadastro: TLayout;
    panelButtonsCad: TPanel;
    btnVoltar: TButton;
    ToolBar1: TToolBar;
    lblTitulo: TLabel;
    btnAddDenuncia: TButton;
    btnAtender: TButton;
    btnRemoveDenuncia: TButton;
    lytDadosDenuncias: TLayout;
    lvwDenuncias: TListView;
    lytHistoricoDenuncias: TLayout;
    ListBox1: TListBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    lytEndereco: TLayout;
    lytTipo: TLayout;
    lytDataLanc: TLayout;
    lytProcedimento: TLayout;
    lytPrazo: TLayout;
    edtPrazo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lytNumInfracao: TLayout;
    edtNumAutoInfracao: TEdit;
    lytArtigo: TLayout;
    Label8: TLabel;
    edtNumArtigo: TEdit;
    ListBoxItem6: TListBoxItem;
    dtedtDtLanc: TDateEdit;
    dtedtDTAtend: TDateEdit;
    lytDTAtend: TLayout;
    Label6: TLabel;
    dtedtFimPrazo: TDateEdit;
    lytDataFinalPrazo: TLayout;
    Label9: TLabel;
    Label7: TLabel;
    lytDescArtigo: TLayout;
    Label10: TLabel;
    edtArtigo: TEdit;
    edtTipoDenuncia: TEdit;
    edtEnderecoDenuncia: TEdit;
    ActionList1: TActionList;
    actAddDenuncia: TAction;
    actRemoveDenuncia: TAction;
    actAtendeDenuncia: TAction;
    changeTabDenuncias: TChangeTabAction;
    actVoltar: TAction;
    changeTabAtender: TChangeTabAction;
    lvwDadosDenuncia: TListView;
    tabProcedimento: TTabItem;
    Layout2: TLayout;
    lvwListaProced: TListView;
    edtProced: TEdit;
    ListBoxItem7: TListBoxItem;
    Layout3: TLayout;
    Label11: TLabel;
    edtOBS: TEdit;
    changeTabProced: TChangeTabAction;
    procedure FormCreate(Sender: TObject);
    procedure actAddDenunciaExecute(Sender: TObject);
    procedure actVoltarExecute(Sender: TObject);
    procedure lvwDenunciasItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lvwDadosDenunciaItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure edtProcedClick(Sender: TObject);
    procedure lvwListaProcedItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure actAtendeDenunciaExecute(Sender: TObject);
  private
    { Private declarations }
    FUtilsCAD: TutilsView;
    DADO, valor, obs, VALORES, CAMPOS: string;
    lnIDTip, lnIDDen, lnIDDet, lnIDProced, num_infracao, prazo: Integer;
    DT, DTRET: TDate;
    qry: TFDQuery;
    procedure GerenciaForms;
    procedure fnc_ExibirMensagem(Tit, MSG: String; tpMSG: TTipMensagem);
    procedure VerificaProced;
    procedure LimparCampos;

  const
    ATEND = 'ATENDIMENTO A DENÚNCIAS';
    LISTA = ' - LISTA DE DENUNCIAS ';
    PROCED = ' - LISTA DE PROCEDIMENTOS EM DENÚNCIA';
    TABDEN = 'DENUNCIAS';
    TABTIP = 'TIPODENUNCIA';
    TABPROCED = 'DENUNCIAS_PROCED';
    TABATEND = 'DENUNCIAS_ATEND';
    VIEWDEN = 'VW_DENUNCIAS';
    FIELDS = ' codigo_detalhe, endereco, tipdenuncia, datalanc ';
    ft1 = 'cod_tipdenuncia';
    ft2 = 'descricao';
    fd1 = 'cod_denuncia';
    fd2 = 'endereco';
    fp1 = 'cod_proced';
    FTABATEND =
      'cod_detalhe, data, prazo, data_ret, num_infracao, cod_proced, obs';
  public
    { Public declarations }
  end;

var
  frmAtenderDenuncias: TfrmAtenderDenuncias;

implementation

{$R *.fmx}

uses U_SISVISA, SISVISA.Model.Denuncias, U_dmSISVISA;

procedure TfrmAtenderDenuncias.actAddDenunciaExecute(Sender: TObject);
begin
  FUtilsCAD.CDDenuncia(lvwDenuncias, qry, TABDEN);
  changeTabDenuncias.ExecuteTarget(Self);
  lblTitulo.Text := lblTitulo.Text + LISTA;
end;

procedure TfrmAtenderDenuncias.actAtendeDenunciaExecute(Sender: TObject);
begin
  if not(edtPrazo.Text = '') then
  begin
    obs := QuotedStr(edtOBS.Text);
    prazo := StrToInt(edtPrazo.Text);
    VerificaProced;
    num_infracao := StrToInt(edtNumAutoInfracao.Text);
    DT := dtedtDTAtend.Date;
    DTRET := dtedtFimPrazo.Date;

    CAMPOS := '(' + FTABATEND + ')';
    VALORES := QuotedStr(IntToStr(lnIDDet)) + ', ' +
      QuotedStr(FormatDateTime('DD.MM.YYYY', DT)) + ', ' +
      QuotedStr(IntToStr(prazo)) + ', ' +
      QuotedStr(FormatDateTime('DD.MM.YYYY', DTRET)) + ', ' +
      QuotedStr(IntToStr(num_infracao)) + ', ' + QuotedStr(IntToStr(lnIDProced))
      + ', ' + obs;
    FUtilsCAD.Incluir(TABATEND, CAMPOS, VALORES, qry);
    fnc_ExibirMensagem(ATEND, 'DENÚNCIA ATENDIDA COM SUCESSO!!!', tpBaixar);
    LimparCampos;
  end;
  if edtPrazo.Text = '' then
     fnc_ExibirMensagem(ATEND, 'CAMPO PRAZO PRECISA RECEBER UM VALOR', tpExcluir);
end;

procedure TfrmAtenderDenuncias.actVoltarExecute(Sender: TObject);
begin
  changeTabAtender.ExecuteTarget(Self);
  lblTitulo.Text := ATEND;
end;

procedure TfrmAtenderDenuncias.edtProcedClick(Sender: TObject);
begin
  FUtilsCAD.CDProcedDenuncia(lvwListaProced, qry, TABPROCED);
  changeTabProced.ExecuteTarget(Self);
  lblTitulo.Text := lblTitulo.Text + PROCED;
end;

procedure TfrmAtenderDenuncias.fnc_ExibirMensagem(Tit, MSG: String;
  tpMSG: TTipMensagem);
var
  FormMensagem: TfrmMensagemPadrao;
begin
  FormMensagem := TfrmMensagemPadrao.Create(Self);
  FormMensagem.fnc_AtualizarMensagem(Tit, MSG, tpMSG);
  frmSISVISA.ExibirMensagem(FormMensagem.layoutMSG);

end;

procedure TfrmAtenderDenuncias.FormCreate(Sender: TObject);
begin
  qry := dmSISVISA.FDqryCadastros;
  GerenciaForms;
  LimparCampos;
  TabControl1.TabIndex := 0;
  TabControl1.TabPosition := TTabPosition.None;
end;

procedure TfrmAtenderDenuncias.GerenciaForms;
begin
  if Assigned(frmSISVISA.FormAtual) then
    frmSISVISA.FormAtual.Free;

  frmSISVISA.FormAtual := Self;
end;

procedure TfrmAtenderDenuncias.LimparCampos;
begin
  edtEnderecoDenuncia.Text := '';
  edtTipoDenuncia.Text := '';
  edtPrazo.Text := '';
  edtNumAutoInfracao.Text := '';
  edtOBS.Text := '';
  edtProced.Text := '';
  dtedtDtLanc.Date := Now;
  dtedtDTAtend.Date := Now;
  dtedtFimPrazo.Date := Now;
  lnIDTip := 0;
  lnIDDen := 0;
  lnIDDet := 0;
  lnIDProced := 0;
end;

procedure TfrmAtenderDenuncias.lvwListaProcedItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  DADO := lvwListaProced.Items[lvwListaProced.Selected.Index].Text;
  lnIDProced := FUtilsCAD.RetornaID(TABPROCED, QuotedStr(DADO), fp1, ft2, qry);
  edtProced.Text := DADO;
  actVoltarExecute(Self);
end;

procedure TfrmAtenderDenuncias.VerificaProced;
begin
  if not(edtTipoDenuncia.Text = 'AUTO DE INFRAÇÃO') then
    edtNumAutoInfracao.Text := IntToStr(0);
  edtNumAutoInfracao.Enabled := False;
end;

procedure TfrmAtenderDenuncias.lvwDadosDenunciaItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var
  f: string;
begin
  DADO := lvwDenuncias.Items[lvwDenuncias.Selected.Index].Text;
  lnIDDen := FUtilsCAD.RetornaID(TABDEN, QuotedStr(DADO), fd1, fd2, qry);
  lnIDTip := FUtilsCAD.RetornaID(TABTIP,
    QuotedStr(lvwDadosDenuncia.Items[lvwDadosDenuncia.Selected.Index].Text),
    ft1, ft2, qry);
  valor := 'codigo_tipodenuncia = ' + IntToStr(lnIDTip) +
    ' and codigo_denuncia ';
  lnIDDet := FUtilsCAD.RetornaID(VIEWDEN, IntToStr(lnIDDen), 'codigo_detalhe',
    valor, qry);
  edtEnderecoDenuncia.Text := TModelDenuncias.New.ReceberDenuncia.
    PreencherDenuncia(lnIDDen, lnIDTip, FIELDS, edtTipoDenuncia, dtedtDtLanc);
  actVoltarExecute(Self);
end;

procedure TfrmAtenderDenuncias.lvwDenunciasItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  DADO := lvwDenuncias.Items[lvwDenuncias.Selected.Index].Text;
  lnIDDen := FUtilsCAD.RetornaID(TABDEN, QuotedStr(DADO), fd1, fd2, qry);
  FUtilsCAD.CDDenunciaDet(lvwDadosDenuncia, qry, VIEWDEN, IntToStr(lnIDDen));

end;

end.
