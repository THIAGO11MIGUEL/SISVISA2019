program SISVISA;

uses
  FMX.Forms,
  U_SISVISA in 'units\U_SISVISA.pas' {frmSISVISA},
  U_CadastroDenuncias in 'units\U_CadastroDenuncias.pas',
  U_CADASTROPADRAO in 'units\U_CADASTROPADRAO.pas' {frmCadastroPadrao},
  U_CadastroReceitas in 'units\U_CadastroReceitas.pas' {frmCadastroReceitas},
  U_dmSISVISA in 'units\U_dmSISVISA.pas' {dmSISVISA: TDataModule},
  U_CadastroProcADM in 'units\U_CadastroProcADM.pas' {frmCadastroProcADM},
  U_MensagemPadrao in 'units\U_MensagemPadrao.pas' {frmMensagemPadrao},
  Classes.Utils.View in 'classes\Classes.Utils.View.pas',
  U_CadastroArtigos in 'units\U_CadastroArtigos.pas' {frmCadastroArtigos},
  U_Configuracoes in 'units\U_Configuracoes.pas' {frmConfiguracoesGerais},
  U_CadastroBD in 'units\U_CadastroBD.pas' {frmCadastroBD},
  SISVISA.Model.CaminhoBD in 'classes\SISVISA.Model.CaminhoBD.pas',
  SISVISA.Model.Artigos in 'classes\SISVISA.Model.Artigos.pas',
  U_CadastroTipoDenuncia in 'units\U_CadastroTipoDenuncia.pas' {frmCadastroTipoDenuncia},
  U_AtenderDenuncia in 'units\U_AtenderDenuncia.pas' {frmAtenderDenuncias},
  SISVISA.Model.Denuncias in 'classes\SISVISA.Model.Denuncias.pas',
  U_CadastroProcedDenuncia in 'units\U_CadastroProcedDenuncia.pas' {frmCadastroProcedDenuncia},
  Classes.Utils.Consts in 'classes\Classes.Utils.Consts.pas',
  U_CadastroTipoReceita in 'units\U_CadastroTipoReceita.pas' {frmCadastroTipReceita},
  U_BaixarReceitas in 'units\U_BaixarReceitas.pas' {frmBaixarReceitas},
  U_ImprimirDados in 'units\U_ImprimirDados.pas' {frmImprimirDados},
  U_dmRelReceitas in 'units\U_dmRelReceitas.pas' {dmRelReceitas: TDataModule},
  U_dmRelDenuncias in 'units\U_dmRelDenuncias.pas' {dmRelDenuncias: TDataModule},
  SISVISA.Model.CaminhoBD.interfaces in 'classes\SISVISA.Model.CaminhoBD.interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmSISVISA, frmSISVISA);
  Application.CreateForm(TdmSISVISA, dmSISVISA);
  Application.Run;
end.
