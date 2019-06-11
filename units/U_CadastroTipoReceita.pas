unit U_CadastroTipoReceita;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  U_CADASTROPADRAO, FMX.TabControl, System.Actions, FMX.ActnList, FMX.Edit,
  FMX.Controls.Presentation, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListBox,
  FMX.ListView;

type
  TfrmCadastroTipReceita = class(TfrmCadastroPadrao)
    lvwDadosTipReceitas: TListView;
    lbxCadTipReceita: TListBox;
    ListBoxItem1: TListBoxItem;
    Layout2: TLayout;
    Label1: TLabel;
    edtTipReceita: TEdit;
    procedure actVoltarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroTipReceita: TfrmCadastroTipReceita;

implementation

{$R *.fmx}

uses Classes.Utils.Consts;

procedure TfrmCadastroTipReceita.actSalvarExecute(Sender: TObject);
begin
  inherited;
  lblTitulo.Text := TIPREC;
end;

procedure TfrmCadastroTipReceita.actVoltarExecute(Sender: TObject);
begin
  inherited;
  lblTitulo.Text := TIPREC;
end;

procedure TfrmCadastroTipReceita.FormCreate(Sender: TObject);
begin
  inherited;
  FUtilsCAD.CDTipReceita(lvwDadosTipReceitas, qry, TAB_TIPRECEITA);
end;

end.
