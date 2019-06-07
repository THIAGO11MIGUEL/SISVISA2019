unit Classes.Utils.Consts;

interface

const

  // Tabelas
  TAB_DEN: string = 'DENUNCIAS';
  TAB_DEN_DET: string = 'DENUNCIAS_DETALHE';
  TAB_DEN_AT: string = 'DENUNCIAS_ATEND';
  TAB_DEN_PROCED: string = 'DENUNCIAS_PROCED';
  TAB_DEN_TIP: string = 'TIPODENUNCIA';
  TAB_VWDEN: string = 'VW_DENUNCIAS';
  TAB_CAMINHO: string = 'CAMINHOBD';
  TAB_ARTIGO: string = 'ARTIGOS';
  TAB_UNIDADE: string = 'UNIDADES';
  TAB_TIPRECEITA: string = 'TIPO_RECEITUARIO';
  TAB_RECEITA: string = 'CONTROLE_RECEITUARIOS';
  TAB_BAIXA: string = 'BAIXA_RECEITUARIO';

  // Campos Individuais
  TAB_DEN_F1: string = 'COD_DENUNCIA';
  TAB_DEN_F2: string = 'ENDERECO';

  TAB_DET_F1: string = 'COD_DETALHE';
  TAB_DET_F2: STRING = 'COD_DENUNCIA';
  TAB_DET_F3: string = 'COD_TIPDENUNCIA';
  TAB_DET_F4: string = 'DATA';
  TAB_DET_F5: string = 'OBS';

  TAB_AT_F1: string = 'COD_ATEND';
  TAB_AT_F2: string = 'COD_DETALHE';
  TAB_AT_F3: string = 'DATA';
  TAB_AT_F4: string = 'PRAZO';
  TAB_AT_F5: string = 'DATA_RET';
  TAB_AT_F6: string = 'NUM_INFRACAO';
  TAB_AT_F7: string = 'COD_PROCED';
  TAB_AT_F8: string = 'OBS';

  TAB_PROC_F1: string = 'COD_PROCED';
  TAB_PROC_F2: string = 'DESCRICAO';

  TAB_TIP_F1: string = 'COD_TIPDENUNCIA';
  TAB_TIP_F2: string = 'DESCRICAO';

  VW_DEN_F1: string = 'CODIGO_DETALHE';
  VW_DEN_F2: string = 'CODIGO_DENUNCIA';
  VW_DEN_F3: string = 'ENDERECO';
  VW_DEN_F4: string = 'CODIGO_TIPODENUNCIA';
  VW_DEN_F5: string = 'TIPDENUNCIA';
  VW_DEN_F6: string = 'DATA_LANC';
  VW_DEN_F7: string = 'OBS';

  TAB_CAM_F1: string = 'COD_CAMINHOBD';
  TAB_CAM_F2: string = 'DESCRICAO';
  TAB_CAM_F3: string = 'CAMINHO_BD';

  TAB_ART_F1: string = 'COD_ARTIGO';
  TAB_ART_F2: string = 'NUM_ARTIGO';
  TAB_ART_F3: string = 'PARAGRAFO';
  TAB_ART_F4: string = 'INCISO';
  TAB_ART_F5: string = 'DESCRICAO';

  // Fields
  FD_TAB_DEN: string = '(endereco)';
  FD_TAB_DET: string = '(cod_denuncia, cod_tipdenuncia, data, obs)';
  FD_TAB_AT: string =
    '(cod_detalhe, data, prazo, data_ret, num_infracao, cod_proced, obs)';
  FD_TAB_PROC: string = '(descricao)';
  FD_TAB_TIP: string = '(descricao)';
  FD_VWDEN: string = '(codigo_detalhe, endereco, tipdenuncia, datalanc)';
  FD_TAB_CAMINHO: string = '(descricao, caminho_bd)';
  FD_TAB_ART : string = '(num_artigo, paragrafo, inciso, descricao)';

  // Mensagens
  MSG_ATEND: string = 'ATENDIMENTO A DENÚNCIAS';
  MSG_ATEND_SUCESSO: string = 'DENÚNCIA ATENDIDA COM SUCESSO!!!';
  MSG_ATEND_PRAZO: string = 'CAMPO PRAZO PRECISA RECEBER UM VALOR';
  MSG_EXCLUIR: string = 'EXCLUSÃO DE CADASTRO';
  MSG_EXCLUIDO: string = 'EXCLUÍDO COM SUCESSO!!!';
  MSG_SUCESSO: string = 'SALVO COM SUCESSO!!!';
  MSG_INSERIR: string = 'INSERIR REGISTRO NOVO';
  MSG_ALTERAR: string = 'ATUALIZAR REGISTRO';

  // Outros
  LISTA: string = ' - LISTA DE DENUNCIAS ';
  PROCED: string = ' - LISTA DE PROCEDIMENTOS EM DENÚNCIA';
  TIP: string = ' - TIPO DENUNCIA';
  AUTOINFRACAO: string = 'AUTO DE INFRAÇÃO';
  NOTIFICACAO: string = 'NOTIFICAÇÃO';
  LBL: string = 'CONFIGURAÇÕES GERAIS DO SISTEMA';
  ARTIGO: string = 'ARTIGOS COD. SANITÁRIO';
  BD: string = 'BANCO DE DADOS';
  DEN: string = 'CADASTRO DE DENUNCIAS';
  PROC: string = 'CADASTRO DE PROCEDIMENTO EM DENÚNCIAS';
  CADNOVO: string = ' -> INSERIR NOVO';
  CADALTERA: string = '-> ALTERAR REGISTRO';

implementation

end.
