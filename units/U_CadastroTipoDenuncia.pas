unit U_CadastroTipoDenuncia;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  U_CADASTROPADRAO, FMX.TabControl, System.Actions, FMX.ActnList, FMX.Edit,
  FMX.Controls.Presentation, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.ListBox;

type
  TfrmCadastroTipoDenuncia = class(TfrmCadastroPadrao)
    ListView1: TListView;
    Layout2: TLayout;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    Layout3: TLayout;
    Label1: TLabel;
    edtTipoDenuncia: TEdit;
    procedure actSalvarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
  private
    { Private declarations }
    f1, f2, FIELDS, TIPO, VALORES: string;
    lnIDTpDenun: Integer;
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmCadastroTipoDenuncia: TfrmCadastroTipoDenuncia;

implementation

uses
  FireDAC.Comp.Client, U_dmSISVISA, SISVISA.Model.CaminhoBD;

{$R *.fmx}

procedure TfrmCadastroTipoDenuncia.actAlterarExecute(Sender: TObject);
begin
  TIPO := ListView1.Items[ListView1.Selected.Index].Text;
  lnIDTpDenun := FUtilsCAD.RetornaID(TABTIPDEN, QuotedStr(TIPO), F1TBTPDEN, F2TBTPDEN, qry);
  edtTipoDenuncia.Text := TIPO;
  inherited;
end;

procedure TfrmCadastroTipoDenuncia.actExcluirExecute(Sender: TObject);
begin
  TIPO := ListView1.Items[ListView1.Selected.Index].Text;
  lnIDTpDenun := FUtilsCAD.RetornaID(TABTIPDEN, QuotedStr(TIPO), F1TBTPDEN, F2TBTPDEN, qry);
  VALORES := ' WHERE cod_tipdenuncia = ' + IntToStr(lnIDTpDenun);
  FUtilsCAD.Deletar(TABELA, VALORES, qry);
  inherited;
  FUtilsCAD.CDTipDenuncia(ListView1, qry, TABTIPDEN);
end;

procedure TfrmCadastroTipoDenuncia.actSalvarExecute(Sender: TObject);
begin
  FIELDS := (' (descricao)');
  TIPO := QuotedStr(edtTipoDenuncia.Text);
  case Acao of
    tpInsert:
      begin
        VALORES := TIPO;
        FUtilsCAD.Incluir(TABTIPDEN, FIELDS, VALORES, qry);
      end;
    tpUpdate:
      begin
        VALORES := ' set descricao = ' + TIPO + ' where cod_tipdenuncia = ' +
          IntToStr(lnIDTpDenun);
        FUtilsCAD.Alterar(TABTIPDEN, VALORES, qry);
      end;
  end;

  inherited;
  FUtilsCAD.CDTipDenuncia(ListView1, qry, TABTIPDEN);
  lblTitulo.Text := BD;
  LimparCampos;
end;

procedure TfrmCadastroTipoDenuncia.FormCreate(Sender: TObject);
begin
  LimparCampos;
  FUtilsCAD.CDTipDenuncia(ListView1, qry, TABTIPDEN);
  inherited;
end;

procedure TfrmCadastroTipoDenuncia.LimparCampos;
begin
  edtTipoDenuncia.Text := '';
  VALORES := '';
  TIPO := '';
end;

end.
