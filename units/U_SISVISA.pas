unit U_SISVISA;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Ani, FMX.Layouts,
  FMX.Gestures, FMX.ListBox, FMX.StdCtrls, FMX.MultiView, FMX.Controls.Presentation,
  FMX.Objects;

type
  TfrmSISVISA = class(TForm)
    StyleBook1: TStyleBook;
    ToolbarHolder: TLayout;
    ToolbarPopup: TPopup;
    ToolbarPopupAnimation: TFloatAnimation;
    ToolBar1: TToolBar;
    ToolbarApplyButton: TButton;
    ToolbarCloseButton: TButton;
    ToolbarAddButton: TButton;
    Layout1: TLayout;
    MultiView1: TMultiView;
    ToolBar2: TToolBar;
    Label1: TLabel;
    ListBox1: TListBox;
    lbxghControleGeral: TListBoxGroupHeader;
    lbxitemReceitas: TListBoxItem;
    lbxitemDenuncias: TListBoxItem;
    lbxitemProcADM: TListBoxItem;
    lbxghRelatorios: TListBoxGroupHeader;
    lbxghConfiguracoes: TListBoxGroupHeader;
    lbxghEncerraSistema: TListBoxGroupHeader;
    Image1: TImage;
    layoutPrincipal: TLayout;
    lbxghInicio: TListBoxGroupHeader;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    Label2: TLabel;
    layoutMensagem: TLayout;
    Timer2: TTimer;
    Label3: TLabel;
    lbxitemAtenderDenuncia: TListBoxItem;
    lbxitemBaixarReceitas: TListBoxItem;
    procedure ToolbarCloseButtonClick(Sender: TObject);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure lbxitemReceitasClick(Sender: TObject);
    procedure lbxitemDenunciasClick(Sender: TObject);
    procedure lbxitemProcADMClick(Sender: TObject);
    procedure lbxghInicioClick(Sender: TObject);
    procedure lbxghConfiguracoesClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure lbxghRelatoriosClick(Sender: TObject);
    procedure lbxitemAtenderDenunciaClick(Sender: TObject);
    procedure lbxitemBaixarReceitasClick(Sender: TObject);
  private
    FGestureOrigin: TPointF;
    FGestureInProgress: Boolean;
    FFormAtual: TCommonCustomForm;
    { Private declarations }
    procedure ShowToolbar(AShow: Boolean);
  public
    { Public declarations }
  published
    property FormAtual: TCommonCustomForm read FFormAtual write FFormAtual;
    procedure ExibirMensagem(Layout: TLayout);
  end;

var
  frmSISVISA: TfrmSISVISA;

implementation

{$R *.fmx}

uses U_CadastroDenuncias, U_CadastroReceitas, U_CadastroProcADM,
  U_Configuracoes, U_CadastroTipoDenuncia, U_AtenderDenuncia,
  Classes.Utils.View, U_BaixarReceitas, U_ImprimirDados, U_dmSISVISA;

procedure TfrmSISVISA.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkEscape then
    ShowToolbar(not ToolbarPopup.IsOpen);
end;

procedure TfrmSISVISA.lbxghInicioClick(Sender: TObject);
begin
  Self.layoutPrincipal.RemoveObject(0);
end;

procedure TfrmSISVISA.lbxghRelatoriosClick(Sender: TObject);
var
  FormImprimir: TfrmImprimirDados;
begin
  if not Assigned(FormImprimir) then
    FormImprimir := TfrmImprimirDados.Create(Self);

  Self.layoutPrincipal.RemoveObject(0);
  Self.layoutPrincipal.AddObject(FormImprimir.Layout1);
  FormImprimir.ListBoxItem3.Visible := False;
  FormImprimir.ListBoxItem4.Visible := False;
  FormImprimir.panelButtonDados.Visible := False;
end;

procedure TfrmSISVISA.lbxghConfiguracoesClick(Sender: TObject);
var
  FormConfig: TfrmConfiguracoesGerais;
begin
  if not Assigned(FormConfig) then
    FormConfig := TfrmConfiguracoesGerais.Create(Self);
  Self.layoutPrincipal.RemoveObject(0);
  Self.layoutPrincipal.AddObject(FormConfig.layoutMain);
end;

procedure TfrmSISVISA.lbxitemReceitasClick(Sender: TObject);
var
  FormReceitas: TfrmCadastroReceitas;
begin
  if not Assigned(FormReceitas) then
    FormReceitas := TfrmCadastroReceitas.Create(Self);
  Self.layoutPrincipal.RemoveObject(0);
  Self.layoutPrincipal.AddObject(FormReceitas.Layout1);
end;

procedure TfrmSISVISA.lbxitemDenunciasClick(Sender: TObject);
var
  FormDenuncias: TfrmCadastroDenuncias;
begin
  if not Assigned(FormDenuncias) then
    FormDenuncias := TfrmCadastroDenuncias.Create(Self);

  Self.layoutPrincipal.RemoveObject(0);
  Self.layoutPrincipal.AddObject(FormDenuncias.Layout1);
  FormDenuncias.lytHistDenuncias.Visible := False;
end;

procedure TfrmSISVISA.lbxitemProcADMClick(Sender: TObject);
var
  FormProcADM: TfrmCadastroProcADM;
begin
  if not Assigned(FormProcADM) then
    FormProcADM := TfrmCadastroProcADM.Create(Self);
  Self.layoutPrincipal.RemoveObject(0);
  Self.layoutPrincipal.AddObject(FormProcADM.Layout1);
end;

procedure TfrmSISVISA.lbxitemAtenderDenunciaClick(Sender: TObject);
var
  FormAtender: TfrmAtenderDenuncias;
begin
  if not Assigned(FormAtender) then
    FormAtender := TfrmAtenderDenuncias.Create(Self);
  Self.layoutPrincipal.RemoveObject(0);
  Self.layoutPrincipal.AddObject(FormAtender.Layout1);
end;

procedure TfrmSISVISA.lbxitemBaixarReceitasClick(Sender: TObject);
var
  FormBaixaRec: TfrmBaixarReceitas;
begin
  if not Assigned(FormBaixaRec) then
    FormBaixaRec := TfrmBaixarReceitas.Create(Self);
  Self.layoutPrincipal.RemoveObject(0);
  Self.layoutPrincipal.AddObject(FormBaixaRec.Layout1);
end;

procedure TfrmSISVISA.Timer1Timer(Sender: TObject);
begin
  if layoutMensagem.Visible then
    layoutMensagem.Visible := False;

  Timer1.Enabled := False;
end;

procedure TfrmSISVISA.Timer2Timer(Sender: TObject);
begin
  Label2.Text := FormatDateTime('dd/mmmm/yy', Now);
  Label3.Text := TimeToStr(Now);
end;

procedure TfrmSISVISA.ToolbarCloseButtonClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmSISVISA.ExibirMensagem(Layout: TLayout);
begin
  Timer1.Enabled := True;
  frmSISVISA.layoutMensagem.Visible := True;
  frmSISVISA.layoutMensagem.RemoveObject(0);
  frmSISVISA.layoutMensagem.AddObject(Layout);
end;

procedure TfrmSISVISA.FormCreate(Sender: TObject);
begin
  layoutMensagem.Visible := False;
  lbxitemProcADM.Visible := False;
end;

procedure TfrmSISVISA.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
var
  DX, DY: Single;
begin
  if EventInfo.GestureID = igiPan then
  begin
    if (TInteractiveGestureFlag.gfBegin in EventInfo.Flags) and
      ((Sender = ToolbarPopup) or (EventInfo.Location.Y > (ClientHeight - 70)))
    then
    begin
      FGestureOrigin := EventInfo.Location;
      FGestureInProgress := True;
    end;

    if FGestureInProgress and (TInteractiveGestureFlag.gfEnd in EventInfo.Flags)
    then
    begin
      FGestureInProgress := False;
      DX := EventInfo.Location.X - FGestureOrigin.X;
      DY := EventInfo.Location.Y - FGestureOrigin.Y;
      if (Abs(DY) > Abs(DX)) then
        ShowToolbar(DY < 0);
    end;
  end
end;

procedure TfrmSISVISA.ShowToolbar(AShow: Boolean);
begin
  ToolbarPopup.Width := ClientWidth;
  ToolbarPopup.PlacementRectangle.Rect :=
    TRectF.Create(0, ClientHeight - ToolbarPopup.Height, ClientWidth - 1,
    ClientHeight - 1);
  ToolbarPopupAnimation.StartValue := ToolbarPopup.Height;
  ToolbarPopupAnimation.StopValue := 0;

  ToolbarPopup.IsOpen := AShow;
end;

end.
