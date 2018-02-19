##############################################################################
# CODIGO FONTE DA QUALIFICACAO DE DADOS ABERTOS DA PREFEITURA DE JOAO PESSOA #
# @Author: Rodrigo Almeida - rodrigo.almeida@gmail.com                       #
# @Contato: +55 83 996075219                                                 #
# Website: http://rodrigoalmeida.jampa.br                                    #
##############################################################################

#' @description 
#' Retorna Informacoes de Propostas de Convenios da Prefeitura de Joao Pessoa
#' Disponivel em: transparencia.joaopessoa.pb.gov.br/download
#' @param path Caminho para o Arquivo
#' @param filename Nome do arquivo com Amostra. Intervalo de Confiança de 99%, Margem de erro de 5%
#' @return Dados de Propostas de Convenios do Sistema de Convenios (Siconv)
#' @examples
#' getDadosPropostasConvenios(): Retorna data.frame com dados de Propostas de Convênios. O Data.frame conterá uma amostra aleatória da população
getDadosPropostasConvenios <- function(path = "data/convenios/",
                              filename = "siconv_proposta.csv") {
  
  caminhoArquivo = paste(path,filename, sep = "")
  
  siconv_proposta <- read.csv2(file = caminhoArquivo, sep = "|", header = FALSE)
  colnames(siconv_proposta) <- c("id_proposta",
                                 "uf_proponente",
                                 "munic_proponente",
                                 "cod_munic_ibge",
                                 "cod_orgao_sup",
                                 "desc_orgao_sup",
                                 "natureza_juridica",
                                 "nr_proposta",
                                 "dia_prop",
                                 "mes_prop",
                                 "ano_prop",
                                 "dia_proposta",
                                 "cod_orgao",
                                 "desc_orgao",
                                 "modalidade",
                                 "identif_proponente",
                                 "nm_proponente",
                                 "cep_proponente",
                                 "endereco_proponente",
                                 "bairro_proponente",
                                 "nm_banco",
                                 "situacao_conta",
                                 "situacao_projeto_basico",
                                 "sit_proposta",
                                 "dia_inic_vigencia_proposta",
                                 "dia_fim_vigencia_proposta",
                                 "objeto_proposta",
                                 "vl_global_prop",
                                 "vl_repasse_prop",
                                 "vl_contrapartida_prop")
  
  # retorno
  siconv_proposta
  
  }