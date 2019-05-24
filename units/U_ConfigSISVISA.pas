unit U_ConfigSISVISA;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  U_CADASTROPADRAO, FMX.TabControl, System.Actions, FMX.ActnList, FMX.Edit,
  FMX.SearchBox, FMX.ListBox, FMX.Layouts, FMX.Controls.Presentation,
  FMX.EditBox, FMX.NumberBox, FMX.ComboEdit, FMX.Objects;

type
  TfrmConfiguracoesSISVISA = class(TfrmCadastroPadrao)
    changeTabConfigBanco: TChangeTabAction;
    tabArtigos1059: TTabItem;
    changeTabArtigos: TChangeTabAction;
    tabCadCaminhoBanco: TTabItem;
    tabCadArtigos: TTabItem;
    changeTabCadBanco: TChangeTabAction;
    changeTabCadArtigo: TChangeTabAction;
    layoutArtigos: TLayout;
    layoutCadCaminhoBanco: TLayout;
    tabConfigBanco: TTabItem;
    layoutConfigBanco: TLayout;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    lbxConfigBanco: TListBox;
    SearchBox2: TSearchBox;
    Layout9: TLayout;
    lbxArtigos: TListBox;
    SearchBox3: TSearchBox;
    Panel3: TPanel;
    btnInserirArtigo: TButton;
    btnAlterarArtigo: TButton;
    btnExcluirArtigo: TButton;
    btnImprimirArtigo: TButton;
    btnSalvarArtigo: TButton;
    btnVoltarMenuConfig: TButton;
    Button16: TButton;
    Edit2: TEdit;
    ListBoxItem7: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    actInserirArtigo: TAction;
    Panel1: TPanel;
    btnInserirBanco: TButton;
    btnAlterarBanco: TButton;
    btnExcluirBanco: TButton;
    btnImprimirBanco: TButton;
    btnSalvarBanco: TButton;
    btnVoltarMenu: TButton;
    btnConectarBanco: TButton;
    edtCaminhoConexao: TEdit;
    Panel4: TPanel;
    btnInsereBD: TButton;
    btnAlteraBD: TButton;
    btnExcluiBD: TButton;
    btnImprimeBD: TButton;
    btnSalvaBD: TButton;
    btnVolta: TButton;
    btnConectaBD: TButton;
    Edit1: TEdit;
    actInserirBD: TAction;
    actSalvaBD: TAction;
    layoutConteiner: TLayout;
    procedure ListBoxItem1Click(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure lbxConfigBancoItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure actInserirArtigoExecute(Sender: TObject);
    procedure actInserirBDExecute(Sender: TObject);
    procedure actSalvaBDExecute(Sender: TObject);
  private
    { Private declarations }
    procedure fnc_ExecutarCadBanco;
  public
    { Public declarations }
  end;

var
  frmConfiguracoesSISVISA: TfrmConfiguracoesSISVISA;

implementation

{$R *.fmx}

uses U_SISVISA, U_CadastroArtigos;

procedure TfrmConfiguracoesSISVISA.actAlterarExecute(Sender: TObject);
begin
  inherited;
  changeTabCadBanco.ExecuteTarget(Self);
  btnVoltar.Enabled := False;
  lblTitulo.Text := lblTitulo.Text + CADALTERA;
end;

procedure TfrmConfiguracoesSISVISA.actInserirArtigoExecute(Sender: TObject);
begin
  changeTabCadArtigo.ExecuteTarget(Self);
  lblTitulo.Text := lblTitulo.Text + CADNOVO;
end;

procedure TfrmConfiguracoesSISVISA.actInserirBDExecute(Sender: TObject);
begin
  changeTabCadBanco.ExecuteTarget(Self);
end;

procedure TfrmConfiguracoesSISVISA.actSalvaBDExecute(Sender: TObject);
begin
  changeTabConfigBanco.ExecuteTarget(Self);
end;

procedure TfrmConfiguracoesSISVISA.Button1Click(Sender: TObject);
begin
  inherited;
  changeTabDados.ExecuteTarget(Self);
end;

procedure TfrmConfiguracoesSISVISA.Button2Click(Sender: TObject);
begin
  inherited;
  changeTabDados.ExecuteTarget(Self);
end;

procedure TfrmConfiguracoesSISVISA.Button3Click(Sender: TObject);
begin
  inherited;
  changeTabDados.ExecuteTarget(Self);
end;

procedure TfrmConfiguracoesSISVISA.Button4Click(Sender: TObject);
begin
  inherited;
  changeTabDados.ExecuteTarget(Self);
end;

procedure TfrmConfiguracoesSISVISA.fnc_ExecutarCadBanco;
begin
  changeTabCadBanco.ExecuteTarget(Self);
  Panel3.Visible := True;
  btnVoltar.Enabled := False;
end;

procedure TfrmConfiguracoesSISVISA.lbxConfigBancoItemClick
  (const Sender: TCustomListBox; const Item: TListBoxItem);
begin
  edtCaminhoConexao.Text := '';
  edtCaminhoConexao.Text := lbxConfigBanco.Items[lbxConfigBanco.ItemIndex];
end;

procedure TfrmConfiguracoesSISVISA.ListBoxItem1Click(Sender: TObject);
begin
  changeTabConfigBanco.ExecuteTarget(Self);
end;

procedure TfrmConfiguracoesSISVISA.ListBoxItem2Click(Sender: TObject);
var
  FormArtigo: TfrmCadastroArtigos;
begin
  if not Assigned(FormArtigo) then
    FormArtigo := TfrmCadastroArtigos.Create(Self);

  layoutConteiner.RemoveObject(0);
  layoutConteiner.AddObject(FormArtigo.Layout1);
end;

end.
