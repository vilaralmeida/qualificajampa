##############################################################################
# CODIGO FONTE DA QUALIFICACAO DE DADOS ABERTOS DA PREFEITURA DE JOAO PESSOA #
# @Author: Rodrigo Almeida - rodrigo.almeida@gmail.com                       #
# @Contato: +55 83 996075219                                                 #
# Website: http://rodrigoalmeida.jampa.br                                    #
##############################################################################

#' @description 
#' Retorna Informacoes de Convenios da Prefeitura de Joao Pessoa
#' Disponivel em: transparencia.joaopessoa.pb.gov.br/download
#' @param path Caminho para o Arquivo
#' @param filename Nome do arquivo com Amostra. Intervalo de Confiança de 99%, Margem de erro de 5%
#' @return Dados de Convenios do Sistema de Convenios (Siconv)
#' @examples
#' getDadosConvenios(): Retorna data.frame com dados de Convênios. O Data.frame conterá uma amostra aleatória da população
getDadosConvenios <- function(path = "data/convenios/",
                           filename = "siconv_convenio.csv") {
  
  caminhoArquivo = paste(path,filename, sep = "")
  
  siconv_convenio <- read.csv2(file = caminhoArquivo, sep = "|", header = FALSE)
  colnames(siconv_convenio) <- c("nr_convenio",
                                 "id_proposta",
                                 "dia",
                                 "mes",
                                 "ano",
                                 "dia_assin_conv",
                                 "sit_convenio",
                                 "subsituacao_conv",
                                 "situacao_publicacao",
                                 "instrumento_ativo",
                                 "ind_opera_obtv",
                                 "nr_processo",
                                 "ug_emitente",
                                 "dia_publ_conv",
                                 "dia_inic_vigenc_conv",
                                 "dia_fim_vigenc_conv",
                                 "dias_prest_contas",
                                 "dia_limite_prest_contas",
                                 "situacao_contratacao",
                                 "qtde_convenios",
                                 "qtd_ta",
                                 "qtd_prorroga",
                                 "vl_global_conv",
                                 "vl_repasse_conv",
                                 "vl_contrapartida_conv",
                                 "vl_empenhado_conv",
                                 "vl_desembolsado_conv",
                                 "vl_saldo_reman_tesouro",
                                 "vl_saldo_reman_convenente",
                                 "vl_rendimento_aplicacao",
                                 "vl_ingresso_contrapartida")  
  
  siconv_convenio[siconv_convenio == "0.00"] <- 0
  
  # retorno
  siconv_convenio
  
}