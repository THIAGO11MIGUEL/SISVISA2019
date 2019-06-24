program prjArqquivoINI;

uses
  System.StartUpCopy,
  FMX.Forms,
  SISVISA.View.Principal in 'SISVISA.View.Principal.pas' {frm_Principal},
  SISVISA.Model.Arquivo.Ini in '..\classes\SISVISA.Model.Arquivo.Ini.pas',
  SISVISA.Model.interfaces in '..\classes\SISVISA.Model.interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_Principal, frm_Principal);
  Application.Run;
end.
