unit U_PrimeiroAcesso;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Layouts, FMX.ListBox,
  Classes.Utils.View;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    edtCaminhoBDConectar: TEdit;
    Button1: TButton;
    opdlgAbrirBD: TOpenDialog;
    ListBox5: TListBox;
    ListBoxItem13: TListBoxItem;
    Layout6: TLayout;
    Label5: TLabel;
    edtDescricaoBanco: TEdit;
    ListBoxItem14: TListBoxItem;
    Layout7: TLayout;
    Label6: TLabel;
    btnBuscarCaminho: TButton;
    edtCaminhoBanco: TEdit;
    procedure btnBuscarCaminhoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FUtils: TUtilsView;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses U_dmSISVISA, FireDAC.Comp.Client, Classes.Utils.Consts;

procedure TForm1.btnBuscarCaminhoClick(Sender: TObject);
begin
  if opdlgAbrirBD.Execute then
    edtCaminhoBanco.Text := opdlgAbrirBD.FileName;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  campos: string;
  qry : TFDQuery;
begin
  campos := QuotedStr(  edtDescricaoBanco.Text + ', ' + edtCaminhoBanco.Text);
  with dmSISVISA do
  begin
    FD_ConnSISVISA.Close;
    FD_ConnSISVISA.Params.Database := edtCaminhoBanco.Text;
    try
      FD_ConnSISVISA.Connected := True;
      qry := FDqryCadastros;
      FDtrs_SVisa.Connection := FD_ConnSISVISA;
    except on E: Exception do
      ShowMessage('ERRO DE CONEXÃO!!!');
    end;
  end;

  FUtils.Incluir(TAB_CAMINHO, FD_TAB_CAMINHO, campos, qry);

  Close;
end;

end.
