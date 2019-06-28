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
  TAB_VWHIST: string = 'VW_HISTORICO_DENUNCIA';
  TAB_CAMINHO: string = 'CAMINHOBD';
  TAB_ARTIGO: string = 'ARTIGOS';
  TAB_UNIDADE: string = 'UNIDADES';
  TAB_TIPRECEITA: string = 'TIPO_RECEITUARIO';
  TAB_RECEITA: string = 'CONTROLE_RECEITUARIOS';
  TAB_BAIXA: string = 'BAIXA_RECEITUARIO';
  TAB_VWRECEITA: string = 'VW_RECEITAS';

  // Campos Individuais
  // TABELA DENUNCIAS
  TAB_DEN_F1: string = 'COD_DENUNCIA';
  TAB_DEN_F2: string = 'ENDERECO';
  // -------------------------------------------------
  // TABELA DENUNCIAS_DETALHE
  TAB_DET_F1: string = 'COD_DETALHE';
  TAB_DET_F2: STRING = 'COD_DENUNCIA';
  TAB_DET_F3: string = 'COD_TIPDENUNCIA';
  TAB_DET_F4: string = 'DATA';
  TAB_DET_F5: string = 'OBS';
  // -------------------------------------------------
  // TABELA DENUNCIAS_ATEND
  TAB_AT_F1: string = 'COD_ATEND';
  TAB_AT_F2: string = 'COD_DETALHE';
  TAB_AT_F3: string = 'DATA';
  TAB_AT_F4: string = 'PRAZO';
  TAB_AT_F5: string = 'DATA_RET';
  TAB_AT_F6: string = 'NUM_INFRACAO';
  TAB_AT_F7: string = 'COD_PROCED';
  TAB_AT_F8: string = 'OBS';
  // -------------------------------------------------
  // TABELA DENUNCIAS_PROCED
  TAB_PROC_F1: string = 'COD_PROCED';
  TAB_PROC_F2: string = 'DESCRICAO';
  // -------------------------------------------------
  // TABELA TIPODENUNCIA
  TAB_TIP_F1: string = 'COD_TIPDENUNCIA';
  TAB_TIP_F2: string = 'DESCRICAO';
  // -------------------------------------------------
  // VIEW VW_DENUNCIAS
  VW_DEN_F1: string = 'CODIGO_DETALHE';
  VW_DEN_F2: string = 'CODIGO_DENUNCIA';
  VW_DEN_F3: string = 'ENDERECO';
  VW_DEN_F4: string = 'CODIGO_TIPODENUNCIA';
  VW_DEN_F5: string = 'TIPDENUNCIA';
  VW_DEN_F6: string = 'DATALANC';
  VW_DEN_F7: string = 'OBS';
  // -------------------------------------------------
  // VIEW VW_HISTORICO_DENUNCIA
  VW_HIST_F1: string = 'CODIGO_ATENDIMENTO';
  VW_HIST_F2: string = 'CODIGO_TIPODENUNCIA';
  VW_HIST_F3: string = 'TIPDENUNCIA';
  VW_HIST_F4: string = 'ENDERECO';
  VW_HIST_F5: string = 'DATA_ATEND';
  VW_HIST_F6: string = 'PRAZO';
  VW_HIST_F7: string = 'DATA_RETORNO';
  VW_HIST_F8: string = 'PROCEDIMENTO';
  // -------------------------------------------------
  VW_REC_F6: string = 'COD_RECEITA';
  VW_REC_F7: string = 'DATA_LANC';
  VW_REC_F9: string = 'NUM_BLOCO';
  VW_REC_F10: string = 'NUM_INICIAL';
  VW_REC_F11: string = 'NUM_FINAL';
  // -------------------------------------------------
  // TABELA CAMINHOBD
  TAB_CAM_F1: string = 'COD_CAMINHOBD';
  TAB_CAM_F2: string = 'DESCRICAO';
  TAB_CAM_F3: string = 'CAMINHO_BD';
  // -------------------------------------------------
  // TABELA ARTIGOS
  TAB_ART_F1: string = 'COD_ARTIGO';
  TAB_ART_F2: string = 'NUM_ARTIGO';
  TAB_ART_F3: string = 'PARAGRAFO';
  TAB_ART_F4: string = 'INCISO';
  TAB_ART_F5: string = 'DESCRICAO';
  // -------------------------------------------------
  // TABELA TIPO RECEITAS
  TAB_TPREC_F1: string = 'ID_TIPO_RECEITA';
  TAB_TPREC_F2: string = 'TIPO_RECEITA';
  // -------------------------------------------------
  // TABELA UNIDADES
  TAB_UNI_F1: string = 'ID_UNIDADE_SAUDE';
  TAB_UNI_F2: string = 'UNIDADE_SAUDE';
  TAB_UNI_F3: string = 'ENDERECO';
  TAB_UNI_F4: string = 'BAIRRO';
  TAB_UNI_F5: string = 'TELEFONE';
  TAB_UNI_F6: string = 'MEDICO_RESPONSAVEL';
  // -------------------------------------------------
  TAB_REC_F1: string = 'ID_C_RECEITUARIO';

  // Fields
  FD_TAB_DEN: string = '(endereco)';
  FD_TAB_DET: string = '(cod_denuncia, cod_tipdenuncia, data, obs)';
  FD_TAB_AT: string =
    '(cod_detalhe, data, prazo, data_ret, num_infracao, cod_proced, obs)';
  FD_TAB_PROC: string = '(descricao)';
  FD_TAB_TIP: string = '(descricao)';
  FD_VWDEN: string = 'codigo_detalhe, endereco, tipdenuncia, datalanc';
  FD_TAB_CAMINHO: string = '(descricao, caminho_bd)';
  FD_TAB_ART: string = '(num_artigo, paragrafo, inciso, descricao)';
  FD_TAB_CTRLREC
    : string =
    '(id_unidade, medico, id_tipo, qtd_blocos, num_bloco, num_inicial, num_final, data, status, responsavel)';
  FD_TAB_BAIXAREC: string = '(id_controle, data, num_bloco, num_inicial, num_final, resp_devolucao)';

  // Mensagens
  MSG_ATEND: string = 'ATENDIMENTO A DENÚNCIAS';
  MSG_ATEND_SUCESSO: string = 'DENÚNCIA ATENDIDA COM SUCESSO!!!';
  MSG_ATEND_PRAZO: string = 'CAMPO PRAZO PRECISA RECEBER UM VALOR';
  MSG_EXCLUIR: string = 'EXCLUSÃO DE CADASTRO';
  MSG_EXCLUIDO: string = 'EXCLUÍDO COM SUCESSO!!!';
  MSG_SUCESSO: string = 'SALVO COM SUCESSO!!!';
  MSG_INSERIR: string = 'INSERIR REGISTRO NOVO';
  MSG_ALTERAR: string = 'ATUALIZAR REGISTRO';
  MSG_BAIXADO: string = 'RECEITAS BAIXADAS COM SUCESSO';

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
  REC: string = 'LANÇAMENTO DE RECEITAS';
  IMPRIME_REC: string = ' - RECEITAS';
  IMPRIME_DEN: string = ' - DENÚNCIAS';
  TIPDEN: string = 'TIPOS DE DENÚNCIAS';
  TIPREC: string = 'TIPOS DE RECEITAS';
  CADNOVO: string = ' -> INSERIR NOVO';
  CADALTERA: string = '-> ALTERAR REGISTRO';
  ST_ABERTO: string = 'EM ABERTO';
  ST_BAIXADO: string = 'BAIXADO';
  BAIXA: string = 'BAIXA DE RECEITUÁRIO';
  IMPRIMIR: string = 'IMPRESSÃO DE DADOS';

implementation

end.
