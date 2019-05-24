unit U_CadastroArtigos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  U_CADASTROPADRAO, FMX.TabControl, System.Actions, FMX.ActnList,
  FMX.Controls.Presentation, FMX.Edit, FMX.SearchBox, FMX.ListBox, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  MultiDetailAppearanceU, FMX.ListView;

type
  TfrmCadastroArtigos = class(TfrmCadastroPadrao)
    ListBox4: TListBox;
    ListBoxItem9: TListBoxItem;
    Layout2: TLayout;
    Label1: TLabel;
    edtArtigo: TEdit;
    ListBoxItem10: TListBoxItem;
    Layout3: TLayout;
    Label2: TLabel;
    edtParagrafo: TEdit;
    ListBoxItem11: TListBoxItem;
    Layout4: TLayout;
    Label3: TLabel;
    edtInciso: TEdit;
    edtDescri��oArtigo: TEdit;
    ListBoxItem1: TListBoxItem;
    Layout5: TLayout;
    Label4: TLabel;
    ListView1: TListView;
    procedure actVoltarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
  private
    f1, f2, TABELA, FIELDS, VALORES, PARAG, INCISO, DESC: string;
    lnIDArtigo, NUMARTIGO: integer;
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmCadastroArtigos: TfrmCadastroArtigos;

implementation

uses
  U_dmSISVISA, FireDAC.Comp.Client, SISVISA.Model.CaminhoBD;

{$R *.fmx}

procedure TfrmCadastroArtigos.actAlterarExecute(Sender: TObject);
var
  qry: TFDQuery;
begin
  qry := dmSISVISA.FDqryCadastros;
  FIELDS := 'num_artigo, paragrafo, inciso';
  DESC := ListView1.Items[ListView1.Selected.Index].Text;
  lnIDArtigo := FUtilsCAD.RetornaID(TABELA, QuotedStr(DESC), f1, f2, qry);
  //edtDescri��oArtigo.Text := DESC;
  edtArtigo.Text := TModelCaminhoDb.New.ReceberCaminhoBD()
    .PreencherCaminho(lnIDArtigo);
  inherited;
end;

procedure TfrmCadastroArtigos.actExcluirExecute(Sender: TObject);
var
  qry: TFDQuery;
begin
  qry := dmSISVISA.FDqryCadastros;
  DESC := ListView1.Items[ListView1.Selected.Index].Text;
  lnIDArtigo := FUtilsCAD.RetornaID(TABELA, QuotedStr(DESC), f1, f2, qry);
  VALORES := ' WHERE cod_artigo = ' + IntToStr(lnIDArtigo);
  FUtilsCAD.Deletar(TABELA, VALORES, qry);
  inherited;
  FUtilsCAD.CDArtigo(ListView1, qry, TABELA);

end;

procedure TfrmCadastroArtigos.actSalvarExecute(Sender: TObject);
var
  qry: TFDQuery;
begin
  qry := dmSISVISA.FDqryCadastros;
  FIELDS := (' (num_artigo, paragrafo, inciso, descricao)');
  DESC := QuotedStr(edtDescri��oArtigo.Text);
  PARAG := QuotedStr(edtParagrafo.Text);
  INCISO := QuotedStr(edtInciso.Text);
  NUMARTIGO := StrToInt(edtArtigo.Text);

  case Acao of
    tpInsert:
      VALORES := IntToStr(NUMARTIGO) + ',' + PARAG + ',' + INCISO + ',' + DESC;
    tpUpdate:
      // VALORES := ' set num_ar = ' + DESC + ',caminho_bd = ' + CAMINHO +
      // ' where cod_caminhobd = ' + IntToStr(lnIDCaminho);
  end;

  if lnIDArtigo <> 0 then
  begin
    FUtilsCAD.Alterar(TABELA, VALORES, qry);
  end
  else
  begin
    FUtilsCAD.Incluir(TABELA, FIELDS, VALORES, qry);
  end;

  FUtilsCAD.CDArtigo(ListView1, qry, TABELA);
  lblTitulo.Text := BD;
  LimparCampos;

  inherited;
  lblTitulo.Text := ARTIGO;
end;

procedure TfrmCadastroArtigos.actVoltarExecute(Sender: TObject);
begin
  inherited;
  lblTitulo.Text := ARTIGO;
end;

procedure TfrmCadastroArtigos.FormCreate(Sender: TObject);
begin
 inherited;
  f1 := 'cod_artigo';
  f2 := 'num_artigo';
  TABELA := 'ARTIGOS';
  FIELDS := '';
  VALORES := '';
  DESC := '';
  PARAG := '';
  INCISO := '';
  FUtilsCAD.CDArtigo(ListView1, dmSISVISA.FDqryCadastros, TABELA);
end;

procedure TfrmCadastroArtigos.LimparCampos;
begin
  edtArtigo.Text := '';
  edtParagrafo.Text := '';
  edtInciso.Text := '';
  edtDescri��oArtigo.Text := '';
end;

end.