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
    procedure actVoltarExecute(Sender: TObject);
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
  FireDAC.Comp.Client, U_dmSISVISA, SISVISA.Model.CaminhoBD,
  Classes.Utils.Consts;

{$R *.fmx}

procedure TfrmCadastroTipoDenuncia.actAlterarExecute(Sender: TObject);
begin
  TIPO := ListView1.Items[ListView1.Selected.Index].Text;
  lnIDTpDenun := FUtilsCAD.RetornaID(TAB_DEN_TIP, QuotedStr(TIPO), TAB_TIP_F1,
    TAB_TIP_F2, qry);
  edtTipoDenuncia.Text := TIPO;
  inherited;
end;

procedure TfrmCadastroTipoDenuncia.actExcluirExecute(Sender: TObject);
begin
  TIPO := ListView1.Items[ListView1.Selected.Index].Text;
  lnIDTpDenun := FUtilsCAD.RetornaID(TAB_DEN_TIP, QuotedStr(TIPO), TAB_TIP_F1,
    TAB_TIP_F2, qry);
  VALORES := ' WHERE ' + TAB_TIP_F1 + ' = ' + IntToStr(lnIDTpDenun);
  FUtilsCAD.Deletar(TAB_DEN_TIP, VALORES, qry);
  inherited;
  FUtilsCAD.CDTipDenuncia(ListView1, qry, TAB_DEN_TIP);
end;

procedure TfrmCadastroTipoDenuncia.actSalvarExecute(Sender: TObject);
begin
  TIPO := QuotedStr(edtTipoDenuncia.Text);
  case Acao of
    tpInsert:
      begin
        VALORES := TIPO;
        FUtilsCAD.Incluir(TAB_DEN_TIP, FD_TAB_TIP, VALORES, qry);
      end;
    tpUpdate:
      begin
        VALORES := ' set ' + TAB_TIP_F2 + ' = ' + TIPO + ' where ' + TAB_TIP_F1
          + ' = ' + IntToStr(lnIDTpDenun);
        FUtilsCAD.Alterar(TAB_DEN_TIP, VALORES, qry);
      end;
  end;

  inherited;
  FUtilsCAD.CDTipDenuncia(ListView1, qry, TAB_DEN_TIP);
  lblTitulo.Text := TIPDEN;
  LimparCampos;
end;

procedure TfrmCadastroTipoDenuncia.actVoltarExecute(Sender: TObject);
begin
  inherited;
  lblTitulo.Text := TIPDEN;
end;

procedure TfrmCadastroTipoDenuncia.FormCreate(Sender: TObject);
begin
  LimparCampos;
  FUtilsCAD.CDTipDenuncia(ListView1, qry, TAB_DEN_TIP);
  inherited;
end;

procedure TfrmCadastroTipoDenuncia.LimparCampos;
begin
  edtTipoDenuncia.Text := '';
  VALORES := '';
  TIPO := '';
end;

end.
