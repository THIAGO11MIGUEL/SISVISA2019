unit U_SISVISA;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Ani, FMX.Layouts, FMX.Gestures,
  FMX.ListBox, FMX.StdCtrls, FMX.MultiView, FMX.Controls.Presentation,
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
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxGroupHeader4: TListBoxGroupHeader;
    ListBoxItem7: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    ListBoxGroupHeader5: TListBoxGroupHeader;
    ListBoxGroupHeader3: TListBoxGroupHeader;
    Image1: TImage;
    layoutPrincipal: TLayout;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    Label2: TLabel;
    Label3: TLabel;
    layoutMensagem: TLayout;
    Timer2: TTimer;
    procedure ToolbarCloseButtonClick(Sender: TObject);
    procedure FormGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure ListBoxItem1Click(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure ListBoxItem3Click(Sender: TObject);
    procedure ListBoxGroupHeader2Click(Sender: TObject);
    procedure ListBoxGroupHeader5Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    FGestureOrigin: TPointF;
    FGestureInProgress: Boolean;
    FFormAtual: TCommonCustomForm;
    { Private declarations }
    procedure ShowToolbar(AShow: Boolean);
  public
    { Public declarations }
  published
    property FormAtual : TCommonCustomForm read FFormAtual write FFormAtual;
    procedure ExibirMensagem(Layout: TLayout);
  end;

var
  frmSISVISA: TfrmSISVISA;

implementation

{$R *.fmx}

uses U_CadastroDenuncias, U_CadastroReceitas, U_CadastroProcADM,
  U_Configuracoes;

procedure TfrmSISVISA.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkEscape then
    ShowToolbar(not ToolbarPopup.IsOpen);
end;

procedure TfrmSISVISA.ListBoxGroupHeader2Click(Sender: TObject);
begin
   Self.layoutPrincipal.RemoveObject(0);
end;

procedure TfrmSISVISA.ListBoxGroupHeader5Click(Sender: TObject);
var
  FormConfig : TfrmConfiguracoesGerais;
begin
  if not Assigned(FormConfig) then
     FormConfig := TfrmConfiguracoesGerais.Create(Self);
  Self.layoutPrincipal.RemoveObject(0);
  Self.layoutPrincipal.AddObject(FormConfig.layoutMain);
end;

procedure TfrmSISVISA.ListBoxItem1Click(Sender: TObject);
var
  FormReceitas :  TfrmCadastroReceitas;
begin
   if not Assigned(FormReceitas) then
      FormReceitas := TfrmCadastroReceitas.Create(Self);
   Self.layoutPrincipal.RemoveObject(0);
   Self.layoutPrincipal.AddObject(FormReceitas.Layout1);
end;

procedure TfrmSISVISA.ListBoxItem2Click(Sender: TObject);
var
  FormDenuncias :  TfrmCadastroDenuncias;
begin
   if not Assigned(FormDenuncias) then
      FormDenuncias := TfrmCadastroDenuncias.Create(Self);

   Self.layoutPrincipal.RemoveObject(0);
   Self.layoutPrincipal.AddObject(FormDenuncias.Layout1);
end;


procedure TfrmSISVISA.ListBoxItem3Click(Sender: TObject);
var
 FormProcADM : TfrmCadastroProcADM;
begin
  if not Assigned(FormProcADM) then
     FormProcADM := TfrmCadastroProcADM.Create(Self);
  Self.layoutPrincipal.RemoveObject(0);
  Self.layoutPrincipal.AddObject(FormProcADM.Layout1);
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
  timer1.Enabled := True;
  frmSISVISA.layoutMensagem.Visible := True;
  frmSISVISA.layoutMensagem.RemoveObject(0);
  frmSISVISA.layoutMensagem.AddObject(Layout);
end;

procedure TfrmSISVISA.FormCreate(Sender: TObject);
begin
  layoutMensagem.Visible := false;
end;

procedure TfrmSISVISA.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
var
  DX, DY : Single;
begin
  if EventInfo.GestureID = igiPan then
  begin
    if (TInteractiveGestureFlag.gfBegin in EventInfo.Flags)
      and ((Sender = ToolbarPopup)
        or (EventInfo.Location.Y > (ClientHeight - 70))) then
    begin
      FGestureOrigin := EventInfo.Location;
      FGestureInProgress := True;
    end;

    if FGestureInProgress and (TInteractiveGestureFlag.gfEnd in EventInfo.Flags) then
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
  ToolbarPopup.PlacementRectangle.Rect := TRectF.Create(0, ClientHeight-ToolbarPopup.Height, ClientWidth-1, ClientHeight-1);
  ToolbarPopupAnimation.StartValue := ToolbarPopup.Height;
  ToolbarPopupAnimation.StopValue := 0;

  ToolbarPopup.IsOpen := AShow;
end;

end.
