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
  MultiDetailAppearanceU;

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
    lvwHistoricoDenuncia: TListView;
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
  private
    { Private declarations }
    FIELDS, VALORES, ENDERECO, Data, OBS: string;
    DT: TDate;
    lnIDDenuncia, cod_den, cod_det, COD_TIPO: Integer;
    procedure addTipDenuncia;
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmCadastroDenuncias: TfrmCadastroDenuncias;

implementation

uses
  U_dmSISVISA;

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
        FIELDS := '(' + F2TBDEN + ')';
        VALORES := ENDERECO;
        FUtilsCAD.Incluir(TABDEN, FIELDS, VALORES, qry);
      end;
    tpUpdate:
      begin
        lnIDDenuncia := FUtilsCAD.RetornaID(TABDEN, ENDERECO, F1TBDEN,
          F2TBDEN, qry);
        FIELDS := ' set ' + F2TBDEN + ' = ' + ENDERECO + ' where ' + F1TBDEN +
          ' = ' + IntToStr(lnIDDenuncia);
        VALORES := FIELDS;
        FUtilsCAD.Alterar(TABDEN, VALORES, qry);
      end;
  end;

  ClientDataSet1.First;
  FIELDS := '';

  while not ClientDataSet1.Eof do
  begin
    OBS := QuotedStr(edtObs.Text);
    DT := dtedtDataDenuncia.Date;
    COD_TIPO := (ClientDataSet1CODIGO.Value);
    lnIDDenuncia := FUtilsCAD.RetornaID(TABDEN, ENDERECO, F1TBDEN,
      F2TBDEN, qry);
    case Acao of
      tpInsert:
        begin
          FIELDS := '(' + F1TBDEN + ',' + F1TBTPDEN + ',' + F4TBDET + ',' +
            F5TBDET + ')';
          VALORES := QuotedStr(IntToStr(lnIDDenuncia)) + ', ' +
            QuotedStr(IntToStr(COD_TIPO)) + ', ' +
            QuotedStr(FormatDateTime('DD.MM.YYYY', DT)) + ', ' + OBS;
          FUtilsCAD.Incluir(TABDENDET, FIELDS, VALORES, qry);
        end;
      tpUpdate:
        begin

          FIELDS := '(' + F1TBDEN + ',' + F1TBTPDEN + ',' + F4TBDET + ',' +
            F5TBDET + ')';
          VALORES := ' set endereco = ' + ENDERECO + ', cod_tipo =' +
            QuotedStr(IntToStr(COD_TIPO)) + ', DATA_LANC = ' +
            QuotedStr(FormatDateTime('DD.MM.YYYY', DT)) + ',' + 'obs = ' + OBS +
            ' where (cod_denuncia = ' + IntToStr(lnIDDenuncia) + ')';
          FUtilsCAD.Alterar(TABDENDET, VALORES, qry);
        end;
    end;

    ClientDataSet1.Next;
  end;

  FUtilsCAD.CDDenuncia(lvwDadosDenuncia, qry, TABDEN);
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

procedure TfrmCadastroDenuncias.addTipDenuncia;
var
  tipo: string;
  cod: Integer;
  lbxi: TListBoxItem;
begin
  lbxi := TListBoxItem.Create(Self);
  tipo := ListView2.Items[ListView2.Selected.Index].Text;
  lbxi.Text := tipo;
  cod := FUtilsCAD.RetornaID(TABTIPDEN, QuotedStr(tipo), F1TBTPDEN,
    F2TBTPDEN, qry);
  ClientDataSet1.Append;
  ClientDataSet1.FieldByName('CODIGO').AsInteger := cod;
  ClientDataSet1.Post;
  ClientDataSet1.Close;
  ClientDataSet1.Open;
  lbxTipDenuncia.AddObject(lbxi);
end;

procedure TfrmCadastroDenuncias.edtTipDenunciaClick(Sender: TObject);
begin
  FUtilsCAD.CDTipDenuncia(ListView2, qry, TABTIPDEN);
  changeTabTipDenuncia.ExecuteTarget(Self);
  lblTitulo.Text := lblTitulo.Text + ' TIPO DENUNCIA';
end;

procedure TfrmCadastroDenuncias.FormCreate(Sender: TObject);
begin
  FUtilsCAD.CDDenuncia(lvwDadosDenuncia, qry, TABDEN);
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
  dtedtDataDenuncia.Date := Now;
end;

procedure TfrmCadastroDenuncias.ListView2ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  addTipDenuncia;
  actVoltarTabCadExecute(Self);
end;

procedure TfrmCadastroDenuncias.lvwDadosDenunciaItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  LimparCampos;
  ENDERECO := lvwDadosDenuncia.Items[lvwDadosDenuncia.Selected.Index].Text;
  lnIDDenuncia := FUtilsCAD.RetornaID(TABDEN, QuotedStr(ENDERECO), F1TBDEN, F2TBDEN, qry);
  FUtilsCAD.CDDenunciaDet(lvwHistoricoDenuncia, qry, VIEWDEN, IntToStr(lnIDDenuncia));
  lytHistDenuncias.Visible := True;
end;

end.
