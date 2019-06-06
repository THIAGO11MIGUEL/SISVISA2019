unit Classes.Utils.Consts;

interface

const

 //Tabelas
 TAB_DEN : string = 'DENUNCIAS';
 TAB_DEN_DET : string = 'DENUNCIAS_DETALHE';
 TAB_DEN_AT : string = 'DENUNCIAS_ATEND';
 TAB_DEN_PROCED : string = 'DENUNCIAS_PROCED';
 TAB_DEN_TIP : string = 'TIPODENUNCIA';
 TAB_VWDEN : string = 'VW_DENUNCIAS';

 //Campos Individuais
 TAB_DEN_F1 : string = 'COD_DENUNCIA';
 TAB_DEN_F2 : string = 'ENDERECO';
 TAB_DET_F1 : string = 'COD_DETALHE';
 TAB_DET_F2 : STRING = 'COD_DENUNCIA';
 TAB_DET_F3 : string = 'COD_TIPDENUNCIA';
 TAB_DET_F4 : string = 'DATA';
 TAB_DET_F5 : string = 'OBS';
 TAB_AT_F1 : string = 'COD_ATEND';
 TAB_AT_F2 : string = 'COD_DETALHE';
 TAB_AT_F3 : string = 'DATA';
 TAB_AT_F4 : string = 'PRAZO';
 TAB_AT_F5 : string = 'DATA_RET';
 TAB_AT_F6 : string = 'NUM_INFRACAO';
 TAB_AT_F7 : string = 'COD_PROCED';
 TAB_AT_F8 : string = 'OBS';
 TAB_PROC_F1 : string = 'COD_PROCED';
 TAB_PROC_F2 : string = 'DESCRICAO';
 TAB_TIP_F1 : string = 'COD_TIPDENUNCIA';
 TAB_TIP_F2 : string = 'DESCRICAO';
 VW_DEN_F1 : string = 'CODIGO_DETALHE';
 VW_DEN_F2 : string = 'CODIGO_DENUNCIA';
 VW_DEN_F3 : string = 'ENDERECO';
 VW_DEN_F4 : string = 'CODIGO_TIPODENUNCIA';
 VW_DEN_F5 : string = 'TIPDENUNCIA';
 VW_DEN_F6 : string = 'DATA_LANC';
 VW_DEN_F7 : string = 'OBS';


 //Fields
 FD_TAB_DEN : string = '(endereco)';
 FD_TAB_DET : string = '(cod_denuncia, cod_tipdenuncia, data, obs)';
 FD_TAB_AT : string = '(cod_detalhe, data, prazo, data_ret, num_infracao, cod_proced, obs)';
 FD_TAB_PROC : string = '(descricao)';
 FD_VWDEN : string = 'codigo_detalhe, endereco, tipdenuncia, datalanc';

 //Mensagens
  MSG_ATEND : string = 'ATENDIMENTO A DENÚNCIAS';
  MSG_ATEND_SUCESSO : string = 'DENÚNCIA ATENDIDA COM SUCESSO!!!';
  MSG_ATEND_PRAZO : string = 'CAMPO PRAZO PRECISA RECEBER UM VALOR';

 //Outros
   LISTA : string = ' - LISTA DE DENUNCIAS ';
   PROCED : string = ' - LISTA DE PROCEDIMENTOS EM DENÚNCIA';
   TIP: string = ' - TIPO DENUNCIA';
   AUTOINFRACAO : string = 'AUTO DE INFRAÇÃO';
   NOTIFICACAO : string='NOTIFICAÇÃO';

  implementation

end.
