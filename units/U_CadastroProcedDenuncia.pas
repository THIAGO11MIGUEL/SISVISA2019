unit U_CadastroProcedDenuncia;

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
  TfrmCadastroProcedDenuncia = class(TfrmCadastroPadrao)
    lvwDadosProcedDenuncia: TListView;
    lbxProcedDenuncia: TListBox;
    ListBoxItem1: TListBoxItem;
    Layout2: TLayout;
    Label1: TLabel;
    edtProcedDenuncia: TEdit;
    procedure actSalvarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
  private
    { Private declarations }
    PROCE: string;
    lnIDProcedDenun: Integer;
    PROCEDURE LimparCampos;
  public
    { Public declarations }
  end;

var
  frmCadastroProcedDenuncia: TfrmCadastroProcedDenuncia;

implementation

{$R *.fmx}

procedure TfrmCadastroProcedDenuncia.actAlterarExecute(Sender: TObject);
begin
  PROCE := lvwDadosProcedDenuncia.Items[lvwDadosProcedDenuncia.Selected.
    Index].Text;
  lnIDProcedDenun := FUtilsCAD.RetornaID(TABPROCEDDEN, QuotedStr(PROCE),
    F1TBPRODEN, F2TBPRODEN, qry);
  edtProcedDenuncia.Text := PROCE;
  inherited;
end;

procedure TfrmCadastroProcedDenuncia.actExcluirExecute(Sender: TObject);
begin
  PROCE := lvwDadosProcedDenuncia.Items[lvwDadosProcedDenuncia.Selected.
    Index].Text;
  lnIDProcedDenun := FUtilsCAD.RetornaID(TABPROCEDDEN, QuotedStr(PROCE),
    F1TBPRODEN, F2TBPRODEN, qry);
  VALORES := ' WHERE cod_proced = ' + IntToStr(lnIDProcedDenun);
  FUtilsCAD.Deletar(TABPROCEDDEN, VALORES, qry);
  inherited;
  FUtilsCAD.CDProcedDenuncia(lvwDadosProcedDenuncia, qry, TABPROCEDDEN);
end;

procedure TfrmCadastroProcedDenuncia.actSalvarExecute(Sender: TObject);
begin
  FIELDS := (' (descricao)');
  PROCE := QuotedStr(edtProcedDenuncia.Text);
  case Acao of
    tpInsert:
      begin
        VALORES := PROCE;
        FUtilsCAD.Incluir(TABPROCEDDEN, FIELDS, VALORES, qry);
      end;
    tpUpdate:
      begin
        VALORES := ' set descricao = ' + PROCE + ' where cod_proced = ' +
          IntToStr(lnIDProcedDenun);
        FUtilsCAD.Alterar(TABPROCEDDEN, VALORES, qry);
      end;
  end;

  inherited;
  FUtilsCAD.CDProcedDenuncia(lvwDadosProcedDenuncia, qry, TABPROCEDDEN);
  lblTitulo.Text := PROCED;
  LimparCampos;
end;

procedure TfrmCadastroProcedDenuncia.FormCreate(Sender: TObject);
begin
  LimparCampos;
  FUtilsCAD.CDProcedDenuncia(lvwDadosProcedDenuncia, qry, TABPROCEDDEN);
  inherited;
end;

procedure TfrmCadastroProcedDenuncia.LimparCampos;
begin
  edtProcedDenuncia.Text := '';
  PROCE := '';
end;

end.
