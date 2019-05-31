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
    ListView1: TListView;
    procedure actSalvarExecute(Sender: TObject);
    procedure actVoltarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actBuscarCaminhoExecute(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
  private
    { Private declarations }
    f1, f2, TABELA, FIELDS, VALORES, DESC, CAMINHO: string;
    lnIDCaminho: integer;
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmCadastroBD: TfrmCadastroBD;

implementation

{$R *.fmx}

uses U_dmSISVISA, SISVISA.Model.CaminhoBD, U_SISVISA, FireDAC.Comp.Client;

procedure TfrmCadastroBD.actAlterarExecute(Sender: TObject);
begin
  FIELDS := 'caminho_bd';
  DESC := ListView1.Items[ListView1.Selected.Index].Text;
  lnIDCaminho := FUtilsCAD.RetornaID(TABELA, QuotedStr(DESC), f1, f2, qry);
  edtDescricaoBanco.Text := DESC;
  edtCaminhoBanco.Text := TModelCaminhoDb.New.ReceberCaminhoBD()
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
  DESC := ListView1.Items[ListView1.Selected.Index].Text;
  lnIDCaminho := FUtilsCAD.RetornaID(TABELA, QuotedStr(DESC), f1, f2, qry);
  VALORES := ' WHERE cod_caminhobd = ' + IntToStr(lnIDCaminho);
  FUtilsCAD.Deletar(TABELA, VALORES, qry);
  inherited;
  FUtilsCAD.CDCaminho(ListView1, qry, TABELA);
end;

procedure TfrmCadastroBD.actSalvarExecute(Sender: TObject);
begin
  FIELDS := (' (descricao, caminho_bd)');
  DESC := QuotedStr(edtDescricaoBanco.Text);
  CAMINHO := QuotedStr(edtCaminhoBanco.Text);
  case Acao of
    tpInsert:
      VALORES := DESC + ',' + CAMINHO;
    tpUpdate:
      VALORES := ' set descricao = ' + DESC + ',caminho_bd = ' + CAMINHO +
        ' where cod_caminhobd = ' + IntToStr(lnIDCaminho);
  end;

  if lnIDCaminho <> 0 then
  begin
    FUtilsCAD.Alterar(TABELA, VALORES, qry);
  end
  else
  begin
    FUtilsCAD.Incluir(TABELA, FIELDS, VALORES, qry);
  end;
  inherited;
  FUtilsCAD.CDCaminho(ListView1, qry, TABELA);
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
  inherited;
  f1 := 'cod_caminhobd';
  f2 := 'descricao';
  TABELA := 'CAMINHOBD';
  FIELDS := '';
  VALORES := '';
  DESC := '';
  CAMINHO := '';
  FUtilsCAD.CDCaminho(ListView1, qry, TABELA);
end;

procedure TfrmCadastroBD.LimparCampos;
begin
  edtCaminhoBanco.Text := '';
  edtDescricaoBanco.Text := '';
end;

procedure TfrmCadastroBD.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  qry := dmSISVISA.FDqryCadastros;
  DESC := ListView1.Items[ListView1.Selected.Index].Text;
  lnIDCaminho := FUtilsCAD.RetornaID(TABELA, QuotedStr(DESC), f1, f2, qry);
  inherited;
  edtCaminhoBDConectar.Text := TModelCaminhoDb.New.ReceberCaminhoBD()
    .PreencherCaminho(lnIDCaminho);
end;

end.
