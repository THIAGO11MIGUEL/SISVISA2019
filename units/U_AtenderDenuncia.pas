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
    procedure LimparCampos;

  const
    ATENDERDENUNCIAS_ATEND = 'ATENDIMENTO A DENÚNCIAS';
    LISTA = ' - LISTA DE DENUNCIAS ';
    PROCED = ' - LISTA DE PROCEDIMENTOS EM DENÚNCIA';
  public
    { Public declarations }
  end;

var
  frmAtenderDenuncias: TfrmAtenderDenuncias;

implementation

{$R *.fmx}

uses U_SISVISA, SISVISA.Model.Denuncias, U_dmSISVISA, Classes.Utils.Consts;

procedure TfrmAtenderDenuncias.actAddDenunciaExecute(Sender: TObject);
begin
  FUtilsCAD.CDDenuncia(lvwDenuncias, qry, TAB_DEN);
  changeTabDenuncias.ExecuteTarget(Self);
  lblTitulo.Text := lblTitulo.Text + LISTA;
end;

procedure TfrmAtenderDenuncias.actAtendeDenunciaExecute(Sender: TObject);
var
  rt: Boolean;
begin
  rt := FUtilsCAD.VerificaProced(edtProced, edtPrazo, edtNumAutoInfracao);
  case rt of
    true:
      FUtilsCAD.fnc_ExibirMensagem(MSG_ATEND, MSG_ATEND_PRAZO, tpExcluir);
    false:
      begin
        obs := QuotedStr(edtOBS.Text);
        prazo := StrToInt(edtPrazo.Text);
        num_infracao := StrToInt(edtNumAutoInfracao.Text);
        DT := dtedtDTAtend.Date;
        DTRET := dtedtFimPrazo.Date;

        VALORES := QuotedStr(IntToStr(lnIDDet)) + ', ' +
          QuotedStr(FormatDateTime('DD.MM.YYYY', DT)) + ', ' +
          QuotedStr(IntToStr(prazo)) + ', ' +
          QuotedStr(FormatDateTime('DD.MM.YYYY', DTRET)) + ', ' +
          QuotedStr(IntToStr(num_infracao)) + ', ' +
          QuotedStr(IntToStr(lnIDProced)) + ', ' + obs;
        FUtilsCAD.Incluir(TAB_DEN_AT, FD_TAB_AT, VALORES, qry);
        FUtilsCAD.fnc_ExibirMensagem(MSG_ATEND, MSG_ATEND_SUCESSO, tpBaixar);
        LimparCampos;
      end;
  end;

end;

procedure TfrmAtenderDenuncias.actVoltarExecute(Sender: TObject);
begin
  changeTabAtender.ExecuteTarget(Self);
  lblTitulo.Text := ATENDERDENUNCIAS_ATEND;
end;

procedure TfrmAtenderDenuncias.edtProcedClick(Sender: TObject);
begin
  FUtilsCAD.CDProcedDenuncia(lvwListaProced, qry, TAB_DEN_PROCED);
  changeTabProced.ExecuteTarget(Self);
  lblTitulo.Text := lblTitulo.Text + PROCED;
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
  lnIDProced := FUtilsCAD.RetornaID(TAB_DEN_PROCED, QuotedStr(DADO), TAB_PROC_F1, TAB_PROC_F2, qry);
  edtProced.Text := DADO;
  actVoltarExecute(Self);
end;

procedure TfrmAtenderDenuncias.lvwDadosDenunciaItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var
  tip: string;
begin
  DADO := lvwDenuncias.Items[lvwDenuncias.Selected.Index].Text;
  tip := QuotedStr(lvwDadosDenuncia.Items[lvwDadosDenuncia.Selected.
    Index].Text);
  lnIDDen := FUtilsCAD.RetornaID(TAB_DEN, QuotedStr(DADO), TAB_DEN_F1,
    TAB_DEN_F2, qry);
  lnIDTip := FUtilsCAD.RetornaID(TAB_DEN_TIP, tip, TAB_TIP_F1, TAB_TIP_F2, qry);
  valor := VW_DEN_F4 + ' = ' + IntToStr(lnIDTip) + ' and ' + VW_DEN_F2;
  lnIDDet := FUtilsCAD.RetornaID(TAB_VWDEN, IntToStr(lnIDDen), VW_DEN_F1,
    valor, qry);
  edtEnderecoDenuncia.Text := TModelDenuncias.New.ReceberDenuncia.
    PreencherDenuncia(lnIDDen, lnIDTip, FD_VWDEN, edtTipoDenuncia, dtedtDtLanc);
  actVoltarExecute(Self);
end;

procedure TfrmAtenderDenuncias.lvwDenunciasItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  DADO := lvwDenuncias.Items[lvwDenuncias.Selected.Index].Text;
  lnIDDen := FUtilsCAD.RetornaID(TAB_DEN, QuotedStr(DADO), TAB_DEN_F1,
    TAB_DEN_F2, qry);
  FUtilsCAD.CDDenunciaDet(lvwDadosDenuncia, qry, TAB_VWDEN, IntToStr(lnIDDen));
end;

end.
