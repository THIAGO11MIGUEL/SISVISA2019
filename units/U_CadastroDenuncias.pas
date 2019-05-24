unit U_CadastroDenuncias;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  U_CADASTROPADRAO, System.Actions, FMX.ActnList, FMX.Controls.Presentation,
  FMX.Layouts, FMX.Edit, FMX.SearchBox, FMX.ListBox, FMX.TabControl,
  FMX.DateTimeCtrls;

type
  TfrmCadastroDenuncias = class(TfrmCadastroPadrao)
    ListBox2: TListBox;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    Layout2: TLayout;
    Label5: TLabel;
    Layout3: TLayout;
    Label2: TLabel;
    Layout4: TLayout;
    Label6: TLabel;
    Layout5: TLayout;
    Label7: TLabel;
    edtObs: TEdit;
    cbbTipoDenuncia: TComboBox;
    edtEnderecoDenuncia: TEdit;
    dtedtDataDenuncia: TDateEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroDenuncias: TfrmCadastroDenuncias;

implementation

{$R *.fmx}

end.
