unit U_Configuracoes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.SearchBox, FMX.ListBox, FMX.Layouts,
  FMX.Objects, FMX.StdCtrls;

type
  TfrmConfiguracoesGerais = class(TForm)
    layoutMain: TLayout;
    layoutClient: TLayout;
    Rectangle1: TRectangle;
    ListBox1: TListBox;
    ToolBar1: TToolBar;
    lblTitulo: TLabel;
    SearchBox1: TSearchBox;
    lbxitArtigos: TListBoxItem;
    lbxitTipDenuncias: TListBoxItem;
    lbxitTipReceitas: TListBoxItem;
    lbxitUnidades: TListBoxItem;
    ListBoxItem1: TListBoxItem;
    procedure lbxitArtigosClick(Sender: TObject);
    procedure lbxitTipDenunciasClick(Sender: TObject);
    procedure ListBoxItem1Click(Sender: TObject);
    procedure lbxitTipReceitasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    const
    ARTIGO = 'ARTIGOS COD. SANITÁRIO';
    BANCO = 'BANCO DE DADOS';
    TIPDEN = 'TIPOS DE DENÚNCIAS';
  public
    { Public declarations }
  end;

var
  frmConfiguracoesGerais: TfrmConfiguracoesGerais;

implementation

uses
  U_CadastroArtigos, U_SISVISA, U_CadastroTipoDenuncia,
  U_CadastroProcedDenuncia, U_CadastroTipoReceita;

{$R *.fmx}

procedure TfrmConfiguracoesGerais.lbxitTipDenunciasClick(Sender: TObject);
var FormTipDen: TfrmCadastroTipoDenuncia;
begin
  if not ASsigned(FormTipDen) then
      FormTipDen := TfrmCadastroTipoDenuncia.Create(Self);

  layoutClient.RemoveObject(0);
  layoutClient.AddObject(FormTipDen.Layout1);
  formTipDen.lblTitulo.text := TIPDEN;
end;

procedure TfrmConfiguracoesGerais.lbxitTipReceitasClick(Sender: TObject);
var FormTipRec : TfrmCadastroTipReceita;
begin
   if not Assigned(FormTipRec) then
      FormTipRec := TfrmCadastroTipReceita.Create(Self);

   layoutClient.RemoveObject(0);
   layoutClient.AddObject(FormTipRec.Layout1);
end;

procedure TfrmConfiguracoesGerais.ListBoxItem1Click(Sender: TObject);
var FormProcedDen : TFrmCadastroProcedDenuncia;
begin
  if not Assigned(FormProcedDen) then
     FormProcedDen := TfrmCadastroProcedDenuncia.Create(Self);

     layoutClient.RemoveObject(0);
     layoutClient.AddObject(FormProcedDen.Layout1);
end;

procedure TfrmConfiguracoesGerais.FormCreate(Sender: TObject);
begin
  lbxitArtigos.Visible := False;
  lbxitUnidades.Visible := False;
end;

procedure TfrmConfiguracoesGerais.lbxitArtigosClick(Sender: TObject);
var
  FormArtigo: TfrmCadastroArtigos;
begin
  if not Assigned(FormArtigo) then
    FormArtigo := TfrmCadastroArtigos.Create(Self);

  layoutClient.RemoveObject(0);
  layoutClient.AddObject(FormArtigo.Layout1);
  FormArtigo.lblTitulo.Text := ARTIGO;
end;

end.
