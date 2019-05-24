unit U_CadastroReceitas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  U_CADASTROPADRAO, System.Actions, FMX.ActnList, FMX.Controls.Presentation,
  FMX.Layouts, FMX.ListBox, FMX.Edit, FMX.SearchBox, FMX.TabControl,
  FMX.DateTimeCtrls, FMX.EditBox, FMX.NumberBox;

type
  TfrmCadastroReceitas = class(TfrmCadastroPadrao)
    Layout2: TLayout;
    layoutButtons: TLayout;
    btnLançarReceitas: TButton;
    btnLimparReceitas: TButton;
    actLancar: TAction;
    actLimpar: TAction;
    actBaixar: TAction;
    btnBaixarReceitas: TButton;
    ListBox2: TListBox;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    cbbUnidade: TComboBox;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    cbbTipoReceita: TComboBox;
    ListBoxItem8: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    ListBoxItem10: TListBoxItem;
    ListBoxItem11: TListBoxItem;
    cbbStatus: TComboBox;
    edtResponsavel: TEdit;
    Layout4: TLayout;
    Layout5: TLayout;
    Label1: TLabel;
    Layout6: TLayout;
    Label2: TLabel;
    Layout7: TLayout;
    Label4: TLabel;
    Layout8: TLayout;
    Label5: TLabel;
    Layout11: TLayout;
    Label8: TLabel;
    Layout12: TLayout;
    Label9: TLabel;
    dtedtLancamentoReceitas: TDateEdit;
    edtQTDBlocos: TEdit;
    edtNumBlocoInicial: TEdit;
    edtFolhaInicial: TEdit;
    edtFolhaFinal: TEdit;
    Label3: TLabel;
    Label11: TLabel;
    Layout9: TLayout;
    Label6: TLabel;
    lbxInserirReceitas: TListBox;
    ListBoxItem2: TListBoxItem;
    Layout10: TLayout;
    Label7: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroReceitas: TfrmCadastroReceitas;

implementation

{$R *.fmx}

end.
