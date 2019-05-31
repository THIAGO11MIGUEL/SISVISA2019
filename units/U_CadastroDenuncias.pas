unit U_CadastroDenuncias;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  U_CADASTROPADRAO, System.Actions, FMX.ActnList, FMX.Controls.Presentation,
  FMX.Layouts, FMX.Edit, FMX.SearchBox, FMX.ListBox, FMX.TabControl,
  FMX.DateTimeCtrls, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, Data.DB, Datasnap.DBClient;

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
    ListView1: TListView;
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
    procedure edtTipDenunciaClick(Sender: TObject);
    procedure actVoltarTabCadExecute(Sender: TObject);
    procedure ListView2ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure actRemoverExecute(Sender: TObject);
  private
    { Private declarations }
    procedure addTipDenuncia;
  public
    { Public declarations }
  end;

var
  frmCadastroDenuncias: TfrmCadastroDenuncias;

implementation

uses
  U_dmSISVISA;

{$R *.fmx}

procedure TfrmCadastroDenuncias.actRemoverExecute(Sender: TObject);
var
  tipo: integer;
begin
  tipo := lbxTipDenuncia.ItemIndex;
  lbxTipDenuncia.Items.Delete(tipo);
end;

procedure TfrmCadastroDenuncias.actVoltarTabCadExecute(Sender: TObject);
begin
  inherited;
  changeTabCadastro.ExecuteTarget(Self);
  lblTitulo.Text := 'CADASTRO DE DENÚNCIAS' + CADNOVO
end;

procedure TfrmCadastroDenuncias.addTipDenuncia;
var
  tipo: string;
  cod: integer;
  lbxi: TListBoxItem;
begin
  lbxi := TListBoxItem.Create(Self);
  tipo := ListView2.Items[ListView2.Selected.Index].Text;
  lbxi.Text := tipo;
  cod := FUtilsCAD.RetornaID('TIPODENUNCIA', QuotedStr(tipo), 'cod_tipdenuncia',
    'descricao', qry);
  lbxTipDenuncia.AddObject(lbxi);
end;

procedure TfrmCadastroDenuncias.edtTipDenunciaClick(Sender: TObject);
begin
  FUtilsCAD.CDTipDenuncia(ListView2, qry, 'TIPODENUNCIA');
  changeTabTipDenuncia.ExecuteTarget(Self);
  lblTitulo.Text := lblTitulo.Text + ' TIPO DENUNCIA';
end;

procedure TfrmCadastroDenuncias.ListView2ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  addTipDenuncia;
  actVoltarTabCadExecute(Self);
end;

end.
