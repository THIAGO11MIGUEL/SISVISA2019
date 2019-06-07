unit U_CADASTROPADRAO;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions,
  FMX.ActnList, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ListBox, FMX.Edit, FMX.SearchBox, FMX.TabControl, U_MensagemPadrao,
  Classes.Utils.View, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, MultiDetailAppearanceU,
  FireDAC.Comp.Client;

type
  tpOperacao = (tpInsert, tpUpdate);

type
  TfrmCadastroPadrao = class(TForm)
    ActionList1: TActionList;
    actInserir: TAction;
    actAlterar: TAction;
    actExcluir: TAction;
    actImprimir: TAction;
    actSalvar: TAction;
    actFechar: TAction;
    Layout1: TLayout;
    ToolBar1: TToolBar;
    lblTitulo: TLabel;
    TabControl1: TTabControl;
    tabDados: TTabItem;
    tabCadastro: TTabItem;
    changeTabDados: TChangeTabAction;
    changeTabCadastro: TChangeTabAction;
    layoutCadastro: TLayout;
    layoutDados: TLayout;
    actVoltar: TAction;
    actConectar: TAction;
    panelButtonDados: TPanel;
    btnInserir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnImprimir: TButton;
    panelButtonsCad: TPanel;
    btnSalvar: TButton;
    btnVoltar: TButton;
    ToolBar2: TToolBar;
    edtBuscaRegistro: TEdit;
    procedure actInserirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actVoltarExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure actExcluirExecute(Sender: TObject);
  private
    FAcao: tpOperacao;
    { Private declarations }
    procedure fnc_GerenciaForms;
    procedure SetAcao(const Value: tpOperacao);
  public
    { Public declarations }
    FUtilsCAD: TUtilsView;
    FIELDS, VALORES: string;
    qry: TFDQuery;
  published
    property Acao: tpOperacao read FAcao write SetAcao;
  end;

var
  frmCadastroPadrao: TfrmCadastroPadrao;

implementation

{$R *.fmx}

uses U_SISVISA, U_dmSISVISA, Classes.Utils.Consts;

procedure TfrmCadastroPadrao.actAlterarExecute(Sender: TObject);
begin
  Self.Acao := tpUpdate;
  changeTabCadastro.ExecuteTarget(Self);
  lblTitulo.Text := lblTitulo.Text + CADALTERA;
end;

procedure TfrmCadastroPadrao.actExcluirExecute(Sender: TObject);
begin
  FUtilsCAD.fnc_ExibirMensagem(MSG_EXCLUIR, MSG_eXCLUIDO, tpExcluir);
end;

procedure TfrmCadastroPadrao.actInserirExecute(Sender: TObject);
begin
  Self.Acao := tpInsert;
  changeTabCadastro.ExecuteTarget(Self);
  lblTitulo.Text := lblTitulo.Text + CADNOVO;
end;

procedure TfrmCadastroPadrao.actSalvarExecute(Sender: TObject);
begin
  case Acao of
    tpInsert:
      begin
        FUtilsCAD.fnc_ExibirMensagem(MSG_INSERIR, MSG_SUCESSO, tpSalvo);
      end;

    tpUpdate:
      begin
        FUtilsCAD.fnc_ExibirMensagem(MSG_ALTERAR, MSG_SUCESSO, tpSalvo);
      end;
  end;

  changeTabDados.ExecuteTarget(Self);
end;

procedure TfrmCadastroPadrao.actVoltarExecute(Sender: TObject);
begin
  changeTabDados.ExecuteTarget(Self);
end;

procedure TfrmCadastroPadrao.fnc_GerenciaForms;
begin
  if Assigned(frmSISVISA.FormAtual) then
    frmSISVISA.FormAtual.Free;

  frmSISVISA.FormAtual := Self;

end;

procedure TfrmCadastroPadrao.FormCreate(Sender: TObject);
begin
  FUtilsCAD := TUtilsView.Create;
  qry := dmSISVISA.FDqryCadastros;
  fnc_GerenciaForms;
  TabControl1.TabIndex := 0;
  TabControl1.TabPosition := TTabPosition.None;
end;

procedure TfrmCadastroPadrao.FormDestroy(Sender: TObject);
begin
  FUtilsCAD.Destroy;
end;

procedure TfrmCadastroPadrao.ListView1ItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  if ItemObject is TListItemAccessory then
  begin
    ShowMessage('TESTE');
  end;
end;

procedure TfrmCadastroPadrao.SetAcao(const Value: tpOperacao);
begin
  FAcao := Value;
end;

end.
