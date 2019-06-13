unit U_CadastroDenuncias;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  U_CADASTROPADRAO, System.Actions, FMX.ActnList, FMX.Controls.Presentation,
  FMX.Layouts, FMX.Edit, FMX.SearchBox, FMX.ListBox, FMX.TabControl,
  FMX.DateTimeCtrls, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, Data.DB, Datasnap.DBClient,
  MultiDetailAppearanceU, FMX.ScrollBox, FMX.Memo;

type
  TfrmCadastroDenuncias = class(TfrmCadastroPadrao)
    Layout2: TLayout;
    ListBox2: TListBox;
    ListBoxItem2: TListBoxItem;
    Layout5: TLayout;
    Label7: TLabel;
    dtedtDataDenuncia: TDateEdit;
    ListBoxItem3: TListBoxItem;
    Layout4: TLayout;
    Label6: TLabel;
    edtEnderecoDenuncia: TEdit;
    ListBoxItem4: TListBoxItem;
    Layout3: TLayout;
    Label2: TLabel;
    tabTipDenuncia: TTabItem;
    Layout7: TLayout;
    ListView2: TListView;
    edtTipDenuncia: TEdit;
    ListBoxItem1: TListBoxItem;
    edtObs: TEdit;
    Layout6: TLayout;
    Label5: TLabel;
    changeTabTipDenuncia: TChangeTabAction;
    Panel2: TPanel;
    btnVoltarChangeCad: TButton;
    actVoltarTabCad: TAction;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1CODIGO: TIntegerField;
    Layout8: TLayout;
    btnRemoveTipDenuncia: TButton;
    actRemover: TAction;
    lbxTipDenuncia: TListBox;
    lytDadosDenuncias: TLayout;
    lytHistDenuncias: TLayout;
    lvwDadosDenuncia: TListView;
    lvwDetalheDenuncia: TListView;
    lvwHist_Denuncias: TListView;
    mmHistorico: TMemo;
    procedure edtTipDenunciaClick(Sender: TObject);
    procedure actVoltarTabCadExecute(Sender: TObject);
    procedure ListView2ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure actRemoverExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actInserirExecute(Sender: TObject);
    procedure lvwDadosDenunciaItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lvwDetalheDenunciaItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
    FIELDS, VALORES, ENDERECO, TIPO, Data, OBS: string;
    DT: TDate;
    lnIDDenuncia, cod_den, cod_det, COD_TIPO: Integer;
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmCadastroDenuncias: TfrmCadastroDenuncias;

implementation

uses
  U_dmSISVISA, Classes.Utils.Consts;

{$R *.fmx}

procedure TfrmCadastroDenuncias.actInserirExecute(Sender: TObject);
begin
  LimparCampos;
  inherited;
end;

procedure TfrmCadastroDenuncias.actRemoverExecute(Sender: TObject);
var
  tipo: Integer;
begin
  tipo := lbxTipDenuncia.ItemIndex;
  lbxTipDenuncia.Items.Delete(tipo);
end;

procedure TfrmCadastroDenuncias.actSalvarExecute(Sender: TObject);
begin
  ENDERECO := QuotedStr(edtEnderecoDenuncia.Text);

  case Acao of
    tpInsert:
      begin
        VALORES := ENDERECO;
        FUtilsCAD.Incluir(TAB_DEN, FD_TAB_DEN, VALORES, qry);
      end;
    tpUpdate:
      begin
        lnIDDenuncia := FUtilsCAD.RetornaID(TAB_DEN, ENDERECO, TAB_DEN_F1,
          TAB_DEN_F2, qry);
        FIELDS := ' set ' + TAB_DEN_F2 + ' = ' + ENDERECO + ' where ' + TAB_DEN_F1 +
          ' = ' + IntToStr(lnIDDenuncia);
        VALORES := FIELDS;
        FUtilsCAD.Alterar(TAB_DEN, VALORES, qry);
      end;
  end;

  ClientDataSet1.First;
  while not ClientDataSet1.Eof do
  begin
    OBS := QuotedStr(edtObs.Text);
    DT := dtedtDataDenuncia.Date;
    COD_TIPO := (ClientDataSet1CODIGO.Value);
    lnIDDenuncia := FUtilsCAD.RetornaID(TAB_DEN, ENDERECO, TAB_DEN_F1,
      TAB_DEN_F2, qry);
    case Acao of
      tpInsert:
        begin
          VALORES := QuotedStr(IntToStr(lnIDDenuncia)) + ', ' +
            QuotedStr(IntToStr(COD_TIPO)) + ', ' +
            QuotedStr(FormatDateTime('DD.MM.YYYY', DT)) + ', ' + OBS;
          FUtilsCAD.Incluir(TAB_DEN_DET, FD_TAB_DET, VALORES, qry);
        end;
      tpUpdate: //UPDATE
      ;
    end;

    ClientDataSet1.Next;
  end;

  FUtilsCAD.CDDenuncia(lvwDadosDenuncia, qry, TAB_DEN);
  lblTitulo.Text := DEN;
  LimparCampos;
  inherited;
end;

procedure TfrmCadastroDenuncias.actVoltarTabCadExecute(Sender: TObject);
begin
  inherited;
  changeTabCadastro.ExecuteTarget(Self);
  lblTitulo.Text := DEN + CADNOVO
end;

procedure TfrmCadastroDenuncias.edtTipDenunciaClick(Sender: TObject);
begin
  FUtilsCAD.CDTipDenuncia(ListView2, qry, TAB_DEN_TIP);
  changeTabTipDenuncia.ExecuteTarget(Self);
  lblTitulo.Text := lblTitulo.Text + TIP;
end;

procedure TfrmCadastroDenuncias.FormCreate(Sender: TObject);
begin
  FUtilsCAD.CDDenuncia(lvwDadosDenuncia, qry, TAB_DEN);
  inherited;
end;

procedure TfrmCadastroDenuncias.LimparCampos;
begin
  ENDERECO := '';
  Data := '';
  COD_TIPO := 0;
  OBS := '';
  edtEnderecoDenuncia.Text := '';
  edtObs.Text := '';
  lbxTipDenuncia.Items.Clear;
  lvwDetalheDenuncia.Items.Clear;
  lvwHist_Denuncias.Items.Clear;
  mmHistorico.Lines.Clear;
  dtedtDataDenuncia.Date := Now;
end;

procedure TfrmCadastroDenuncias.ListView2ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  FUtilsCAD.AddDenuncia(ListView2, lbxTipDenuncia, ClientDataSet1, qry);
  actVoltarTabCadExecute(Self);
end;

procedure TfrmCadastroDenuncias.lvwDadosDenunciaItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  LimparCampos;
  ENDERECO := QuotedStr(lvwDadosDenuncia.Items[lvwDadosDenuncia.Selected.Index].Text);

  lnIDDenuncia := FUtilsCAD
                      .RetornaID(TAB_VWDEN,
                                 ENDERECO,
                                 VW_DEN_F2,
                                 VW_DEN_F3,
                                 qry);

  FUtilsCAD.CDDenunciaDet(lvwDetalheDenuncia, qry, TAB_VWDEN, IntToStr(lnIDDenuncia));

  lytHistDenuncias.Visible := True;
end;

procedure TfrmCadastroDenuncias.lvwDetalheDenunciaItemClick(
  const Sender: TObject; const AItem: TListViewItem);
begin
  //LimparCampos;
{
  TIPO := QuotedStr(lvwDetalheDenuncia.Items[lvwDetalheDenuncia.Selected.Index].Text);
  COD_TIPO := FUtilsCAD.RetornaID(TAB_VWDEN, TIPO, VW_HIST_F2, VW_HIST_F3, qry);
  FIELDS := IntToStr(COD_TIPO) + ' and ' + VW_HIST_F4 + ' = ' + ENDERECO;
  FUtilsCAD.CDDenunciaAtend(lvwHist_Denuncias, qry, TAB_VWHIST, FIELDS);
  lytHistDenuncias.Visible := True;
 }
  TIPO := QuotedStr(lvwDetalheDenuncia.Items[lvwDetalheDenuncia.Selected.Index].Text);
  COD_TIPO := FUtilsCAD.RetornaID(TAB_VWDEN, TIPO, VW_HIST_F2, VW_HIST_F3, qry);
  FIELDS := IntToStr(COD_TIPO) + ' and ' + VW_HIST_F4 + ' = ' + ENDERECO;
  FUtilsCAD.CDDenunciaAtend(mmHistorico, qry, TAB_VWHIST, FIELDS);
  lytHistDenuncias.Visible := True;
end;

end.
