unit U_CadastroProcADM;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  U_CADASTROPADRAO, FMX.TabControl, System.Actions, FMX.ActnList, FMX.Edit,
  FMX.SearchBox, FMX.ListBox, FMX.Layouts, FMX.Controls.Presentation,
  FMX.DateTimeCtrls;

type
  TfrmCadastroProcADM = class(TfrmCadastroPadrao)
    ListBox2: TListBox;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    Layout2: TLayout;
    Label1: TLabel;
    Layout3: TLayout;
    Label8: TLabel;
    Layout4: TLayout;
    Label9: TLabel;
    Layout5: TLayout;
    Label10: TLabel;
    Layout6: TLayout;
    Label11: TLabel;
    Layout7: TLayout;
    Label12: TLabel;
    Layout8: TLayout;
    Label13: TLabel;
    edtCPFInfrator: TEdit;
    dtedtDataAutoInfracao: TDateEdit;
    dtedtDataProcesso: TDateEdit;
    edtInfrator: TEdit;
    cbbArtigo: TComboBox;
    edtNumAutoInfracao: TEdit;
    edtEndereco: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroProcADM: TfrmCadastroProcADM;

implementation

{$R *.fmx}

end.
