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
    procedure actVoltarExecute(Sender: TObject);
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

uses Classes.Utils.Consts;

procedure TfrmCadastroProcedDenuncia.actAlterarExecute(Sender: TObject);
begin
  PROCE := lvwDadosProcedDenuncia.Items[lvwDadosProcedDenuncia.Selected.
    Index].Text;
  lnIDProcedDenun := FUtilsCAD.RetornaID(TAB_DEN_PROCED, QuotedStr(PROCE),
    TAB_PROC_F1, TAB_PROC_F2, qry);
  edtProcedDenuncia.Text := PROCE;
  lblTitulo.Text := PROC + CADALTERA;
  inherited;
end;

procedure TfrmCadastroProcedDenuncia.actExcluirExecute(Sender: TObject);
begin
  PROCE := lvwDadosProcedDenuncia.Items[lvwDadosProcedDenuncia.Selected.
    Index].Text;
  lnIDProcedDenun := FUtilsCAD.RetornaID(TAB_DEN_PROCED, QuotedStr(PROCE),
    TAB_PROC_F1, TAB_PROC_F2, qry);
  VALORES := ' WHERE ' + TAB_PROC_F1 + ' = ' + IntToStr(lnIDProcedDenun);
  FUtilsCAD.Deletar(TAB_DEN_PROCED, VALORES, qry);
  inherited;
  FUtilsCAD.CDProcedDenuncia(lvwDadosProcedDenuncia, qry, TAB_DEN_PROCED);
end;

procedure TfrmCadastroProcedDenuncia.actSalvarExecute(Sender: TObject);
begin
  PROCE := QuotedStr(edtProcedDenuncia.Text);
  case Acao of
    tpInsert:
      begin
        VALORES := PROCE;
        FUtilsCAD.Incluir(TAB_DEN_PROCED, FD_TAB_PROC, VALORES, qry);
      end;
    tpUpdate:
      begin
        VALORES := ' set ' + TAB_PROC_F2 + ' = ' + PROCE + ' where ' +
          TAB_PROC_F1 + ' = ' + IntToStr(lnIDProcedDenun);
        FUtilsCAD.ALTERAR(TAB_DEN_PROCED, VALORES, qry);
      end;
  end;

  inherited;
  FUtilsCAD.CDProcedDenuncia(lvwDadosProcedDenuncia, qry, TAB_DEN_PROCED);
  lblTitulo.Text := PROCED;
  LimparCampos;
end;

procedure TfrmCadastroProcedDenuncia.actVoltarExecute(Sender: TObject);
begin
  inherited;
  lblTitulo.Text := PROC;
end;

procedure TfrmCadastroProcedDenuncia.FormCreate(Sender: TObject);
begin
  LimparCampos;
  FUtilsCAD.CDProcedDenuncia(lvwDadosProcedDenuncia, qry, TAB_DEN_PROCED);
  inherited;
end;

procedure TfrmCadastroProcedDenuncia.LimparCampos;
begin
  edtProcedDenuncia.Text := '';
  PROCE := '';
end;

end.
