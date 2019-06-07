unit U_CadastroArtigos;

interface

uses
  System.SysUtils, System.Types, System.UITypes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  U_CADASTROPADRAO, FMX.TabControl, System.Actions, FMX.ActnList,
  FMX.Controls.Presentation, FMX.Edit, FMX.SearchBox, FMX.ListBox, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  MultiDetailAppearanceU, FMX.ListView, System.Classes;

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
    edtDescriçãoArtigo: TEdit;
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
    f1, f2, TABELA, FIELDS, VALORES, PARAG, INCISO, NUM: string;
    lnIDArtigo, NUMARTIGO: integer;
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmCadastroArtigos: TfrmCadastroArtigos;

implementation

uses
  U_dmSISVISA, FireDAC.Comp.Client, SISVISA.Model.CaminhoBD,
  SISVISA.Model.Artigos, Classes.Utils.Consts;

{$R *.fmx}

procedure TfrmCadastroArtigos.actAlterarExecute(Sender: TObject);
begin
  FIELDS := 'descricao, paragrafo, inciso';
  NUM := ListView1.Items[ListView1.Selected.Index].Text;
  lnIDArtigo := FUtilsCAD.RetornaID(TABELA, QuotedStr(NUM), f1, f2, qry);
  edtArtigo.Text := NUM;
  edtDescriçãoArtigo.Text := TModelArtigos.New.ReceberArtigo.PreencherArtigo
    (lnIDArtigo, FIELDS, edtParagrafo, edtInciso);
  inherited;
end;

procedure TfrmCadastroArtigos.actExcluirExecute(Sender: TObject);
begin
  NUM := ListView1.Items[ListView1.Selected.Index].Text;
  lnIDArtigo := FUtilsCAD.RetornaID(TABELA, QuotedStr(NUM), f1, f2, qry);
  VALORES := ' WHERE cod_artigo = ' + IntToStr(lnIDArtigo);
  FUtilsCAD.Deletar(TABELA, VALORES, qry);
  inherited;
  FUtilsCAD.CDArtigo(ListView1, qry, TABELA);

end;

procedure TfrmCadastroArtigos.actSalvarExecute(Sender: TObject);
begin
  NUM := QuotedStr(edtDescriçãoArtigo.Text);
  PARAG := QuotedStr(edtParagrafo.Text);
  INCISO := QuotedStr(edtInciso.Text);
  NUMARTIGO := StrToInt(edtArtigo.Text);

  case Acao of
    tpInsert:
    begin
      VALORES := IntToStr(NUMARTIGO) + ',' + PARAG + ',' + INCISO + ',' + NUM;
      FUtilsCAD.Incluir(TAB_ARTIGO, FD_TAB_ART, VALORES, qry);
    end;
    tpUpdate:
      begin
        VALORES := ' set num_artigo = ' + IntToStr(NUMARTIGO) + ', paragrafo ='
          + PARAG + ', inciso = ' + INCISO + ',' + 'descricao = ' + NUM +
          ' where (cod_artigo = ' + IntToStr(lnIDArtigo) + ')';

        FUtilsCAD.Alterar(TABELA, VALORES, qry);
      end;
  end;
  FUtilsCAD.CDArtigo(ListView1, qry, TABELA);
  lblTitulo.Text := ARTIGO;
  LimparCampos;
  inherited;
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
  NUM := '';
  PARAG := '';
  INCISO := '';
  FUtilsCAD.CDArtigo(ListView1, qry, TABELA);
end;

procedure TfrmCadastroArtigos.LimparCampos;
begin
  edtArtigo.Text := '';
  edtParagrafo.Text := '';
  edtInciso.Text := '';
  edtDescriçãoArtigo.Text := '';
end;

end.
