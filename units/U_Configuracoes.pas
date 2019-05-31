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
    lbxitBD: TListBoxItem;
    lbxitArtigos: TListBoxItem;
    lbxitTipDenuncias: TListBoxItem;
    lbxitTipReceitas: TListBoxItem;
    lbxitUnidades: TListBoxItem;
    procedure lbxitArtigosClick(Sender: TObject);
    procedure lbxitBDClick(Sender: TObject);
    procedure lbxitTipDenunciasClick(Sender: TObject);
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
  U_CadastroArtigos, U_SISVISA, U_CadastroBD, U_CadastroTipoDenuncia;

{$R *.fmx}

procedure TfrmConfiguracoesGerais.lbxitBDClick(Sender: TObject);
var
  FormBD :  TfrmCadastroBD;
begin
   if not Assigned(FormBD) then
      FormBD := TfrmCadastroBD.Create(Self);

   Self.layoutClient.RemoveObject(0);
   Self.layoutClient.AddObject(FormBD.Layout1);
   FormBD.lblTitulo.Text := BANCO;
end;

procedure TfrmConfiguracoesGerais.lbxitTipDenunciasClick(Sender: TObject);
var FormTipDen: TfrmCadastroTipoDenuncia;
begin
  if not ASsigned(FormTipDen) then
      FormTipDen := TfrmCadastroTipoDenuncia.Create(Self);

  layoutClient.RemoveObject(0);
  layoutClient.AddObject(FormTipDen.Layout1);
  formTipDen.lblTitulo.text := TIPDEN;
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
