unit U_CadastroBD;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  U_CADASTROPADRAO, FMX.TabControl, System.Actions, FMX.ActnList,
  FMX.Controls.Presentation, FMX.Edit, FMX.SearchBox, FMX.ListBox, FMX.Layouts,
  FMX.ComboEdit, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, MultiDetailAppearanceU;

type
  TfrmCadastroBD = class(TfrmCadastroPadrao)
    ListBox5: TListBox;
    ListBoxItem13: TListBoxItem;
    Layout6: TLayout;
    Label5: TLabel;
    edtDescricaoBanco: TEdit;
    ListBoxItem14: TListBoxItem;
    Layout7: TLayout;
    Label6: TLabel;
    opdlgAbrirBD: TOpenDialog;
    btnBuscarCaminho: TButton;
    edtCaminhoBanco: TEdit;
    actBuscarCaminho: TAction;
    Panel1: TPanel;
    edtCaminhoBDConectar: TEdit;
    Button1: TButton;
    lvwCaminhoBD: TListView;
    procedure actSalvarExecute(Sender: TObject);
    procedure actVoltarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actBuscarCaminhoExecute(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actInserirExecute(Sender: TObject);
  private
    { Private declarations }
    VALORES, DESC, CAMINHO: string;
    lnIDCaminho: integer;
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmCadastroBD: TfrmCadastroBD;

implementation

{$R *.fmx}

uses U_dmSISVISA, SISVISA.Model.CaminhoBD, U_SISVISA, FireDAC.Comp.Client,
  Classes.Utils.Consts;

procedure TfrmCadastroBD.actAlterarExecute(Sender: TObject);
begin
  DESC := QuotedStr(lvwCaminhoBD.Items[lvwCaminhoBD.Selected.Index].Text);

  lnIDCaminho := FUtilsCAD
                     .RetornaID(
                         TAB_CAMINHO,
                         DESC,
                         TAB_CAM_F1,
                         TAB_CAM_F2,
                         qry);

  edtDescricaoBanco.Text := DESC;

  edtCaminhoBanco.Text :=
              TModelCaminhoDb
                  .New
                    .ReceberCaminhoBD()
                  .PreencherCaminho(lnIDCaminho);
  inherited;
end;

procedure TfrmCadastroBD.actBuscarCaminhoExecute(Sender: TObject);
begin
  if opdlgAbrirBD.Execute then
    edtCaminhoBanco.Text := opdlgAbrirBD.FileName;
end;

procedure TfrmCadastroBD.actExcluirExecute(Sender: TObject);
begin
  DESC := QuotedStr(lvwCaminhoBD.Items[lvwCaminhoBD.Selected.Index].Text);

  TModelCaminhoDb
         .New
          .TabelaCaminho(TAB_CAMINHO)
          .DESC(DESC)
          .CaminhoBanco(TAB_CAM_F1)
          .descricaoBanco(TAB_CAM_F2)
        .DataSet
          .deletaCaminhoDoBanco;

  inherited;
  FUtilsCAD
       .CDCaminho(
            lvwCaminhoBD,
            qry,
            TAB_CAMINHO);
end;

procedure TfrmCadastroBD.actInserirExecute(Sender: TObject);
begin
  inherited;
  LimparCampos;
end;

procedure TfrmCadastroBD.actSalvarExecute(Sender: TObject);
begin

  TModelCaminhoDb
         .New
           .DescricaoNome(edtDescricaoBanco.Text)
           .CaminhoDoBancoDeDados(edtCaminhoBanco.Text)
         .ValidarCampos
         .VerificarDuplicidadeDeRegistros(edtDescricaoBanco.Text);


  DESC := QuotedStr(edtDescricaoBanco.Text);
  CAMINHO := QuotedStr(edtCaminhoBanco.Text);

  case Acao of
    tpInsert:
      begin
        VALORES := DESC + ',' + CAMINHO;
        FUtilsCAD.Incluir(TAB_CAMINHO, FD_TAB_CAMINHO, VALORES, qry);
      end;
    tpUpdate:
      begin
        VALORES := ' set ' + TAB_CAM_F2 + ' = ' + DESC + ',' + TAB_CAM_F3 +
          ' = ' + CAMINHO + ' where ' + TAB_CAM_F1 + ' = ' +
          IntToStr(lnIDCaminho);
        FUtilsCAD.Alterar(TAB_CAMINHO, VALORES, qry);
      end;
  end;

  inherited;
  FUtilsCAD
        .CDCaminho(
             lvwCaminhoBD,
             qry,
             TAB_CAMINHO);

  lblTitulo.Text := BD;
  LimparCampos;
end;

procedure TfrmCadastroBD.actVoltarExecute(Sender: TObject);
begin
  inherited;
  lblTitulo.Text := BD;
end;

procedure TfrmCadastroBD.FormCreate(Sender: TObject);
begin
  FUtilsCAD.CDCaminho(lvwCaminhoBD, qry, TAB_CAMINHO);
  inherited;
end;

procedure TfrmCadastroBD.LimparCampos;
begin
  edtCaminhoBanco.Text := '';
  edtDescricaoBanco.Text := '';
  CAMINHO := '';
  DESC := '';
end;

procedure TfrmCadastroBD.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  DESC := QuotedStr(lvwCaminhoBD.Items[lvwCaminhoBD.Selected.Index].Text);

  lnIDCaminho := FUtilsCAD
                    .RetornaID(
                       TAB_CAMINHO,
                       DESC,
                       TAB_CAM_F1,
                       TAB_CAM_F2,
                       qry);
  inherited;

  edtCaminhoBDConectar.Text :=
               TModelCaminhoDb
                   .New
                     .ReceberCaminhoBD()
                   .PreencherCaminho(lnIDCaminho);
end;

end.
