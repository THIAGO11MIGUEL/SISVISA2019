unit U_MensagemPadrao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TTipMensagem = (tpExcluir, tpSalvo, tpBaixar);

type
  TfrmMensagemPadrao = class(TForm)
    layoutMSG: TLayout;
    lblTituloMSG: TLabel;
    lblMSG: TLabel;
    panelMSG: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure fnc_AtualizarMensagem(Titulo, Mensagem: String;
      tpMSG: TTipMensagem);
  end;

var
  frmMensagemPadrao: TfrmMensagemPadrao;

implementation

{$R *.fmx}
{ TfrmMensagemPadrao }

procedure TfrmMensagemPadrao.fnc_AtualizarMensagem(Titulo, Mensagem: String;
  tpMSG: TTipMensagem);
begin
  case tpMSG of
    tpExcluir:
      panelMSG.StyleLookup := 'panelstylevermelho';
    tpSalvo:
      panelMSG.StyleLookup := 'panelstyleorange';
    tpBaixar:
      panelMSG.StyleLookup := 'panelstyleverde';
  end;
  lblTituloMSG.Text := Titulo;
  lblMSG.Text := Mensagem;
end;

end.
