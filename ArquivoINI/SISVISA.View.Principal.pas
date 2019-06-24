unit SISVISA.View.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListBox, FMX.Layouts, FMX.Controls.Presentation, FMX.Objects, FMX.Edit


  ;

type
  Tfrm_Principal = class(TForm)
    layHead: TLayout;
    Layout2: TLayout;
    rectHead: TRectangle;
    Label1: TLabel;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    btnCarregarBD: TButton;
    Layout3: TLayout;
    btnSair: TButton;
    btnSalvar: TButton;
    edtCarregar: TButton;
    Layout4: TLayout;
    Layout5: TLayout;
    lfdDescricao: TLabel;
    edtDescricao: TEdit;
    OpenDialog1: TOpenDialog;
    Layout6: TLayout;
    lfdCaminho: TLabel;
    Layout7: TLayout;
    edtCaminho: TEdit;
    lfdStatus: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure btnCarregarBDClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtCarregarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Principal: Tfrm_Principal;

implementation

uses
  SISVISA.Model.Arquivo.Ini;

{$R *.fmx}

procedure Tfrm_Principal.btnCarregarBDClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
     edtCaminho.Text := OpenDialog1.FileName;

  btnSalvar.Enabled := not (edtCaminho.Text = EmptyStr);
end;

procedure Tfrm_Principal.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Principal.btnSalvarClick(Sender: TObject);
var
  lcPath : string;
begin
  lfdStatus.Text := 'Salvando caminho do Banco de dados';

  lcPath := TModelArquivoIni.New.IniFile ;

  TModelArquivoIni
             .New
               .WriteIni(lcPath,'BANCO','CAMINHO', edtCaminho.Text);

  TModelArquivoIni
             .New
               .WriteIni(lcPath,'BANCO','DESCRICAO', edtDescricao.Text);

end;

procedure Tfrm_Principal.edtCarregarClick(Sender: TObject);
var
  lcPath : string;
begin
 lcPath := TModelArquivoIni.New.IniFile;


 edtDescricao.Text := TModelArquivoIni
                          .New
                            .ReadIni(lcPath, 'BANCO', 'DESCRICAO');

 edtCaminho.Text :=    TModelArquivoIni
                          .New
                            .ReadIni(lcPath, 'BANCO', 'CAMINHO');

   btnSalvar.Enabled := not (edtCaminho.Text = EmptyStr);

   lfdStatus.Text := 'Arquivo carregado';
end;

end.
