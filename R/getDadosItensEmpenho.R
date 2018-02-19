##############################################################################
# CODIGO FONTE DA QUALIFICACAO DE DADOS ABERTOS DA PREFEITURA DE JOAO PESSOA #
# @Author: Rodrigo Almeida - rodrigo.almeida@gmail.com                       #
# @Contato: +55 83 996075219                                                 #
# Website: http://rodrigoalmeida.jampa.br                                    #
##############################################################################

#' @title get Dados Itens Empenho
#' @description
#' Retorna Informacoes de Itens Empenho da Prefeitura de Joao Pessoa
#' Disponivel em: transparencia.joaopessoa.pb.gov.br/download
#' @param path Caminho para o Arquivo
#' @param filename Nome do arquivo com Amostra. Intervalo de Confiança de 99%, Margem de erro de 5%
#' @return Dados Itens Empenho
#' @examples
#' getDadosItensEmpenho(): Retorna data.frame com dados de Itens Empenho. O Data.frame conterá uma amostra aleatória da população
#' @export
getDadosItensEmpenho <- function(path = "data/orcamento/",
                            filename = c("itens_empenho_2009_random.csv",
                                         "itens_empenho_2010_random.csv",
                                         "itens_empenho_2011_random.csv",
                                         "itens_empenho_2012_random.csv",
                                         "itens_empenho_2013_random.csv",
                                         "itens_empenho_2014_random.csv",
                                         "itens_empenho_2015_random.csv",
                                         "itens_empenho_2016_random.csv",
                                         "itens_empenho_2017_random.csv",
                                         "itens_empenho_2018_random.csv")) {
  itens_empenho <- data.frame()
  for(i in 1:length(filename)) {
    caminhoArquivo = paste(path,filename[i], sep = "")
    temp <- read.csv2(file = caminhoArquivo, sep = "|", header = FALSE)
    itens_empenho <- rbind(itens_empenho, temp)
  }

  colnames(itens_empenho) <- c("nume_empe",
                                    "ano_refe",
                                    "codi_item",
                                    "desc_itee",
                                    "valo_unit",
                                    "qtde_itee",
                                    "desc_unid",
                                    "data_ulal",
                                    "matr_usua",
                                    "valo_tota",
                                    "data_empe")

  itens_empenho[itens_empenho == "\\N"] <- NA

  #retorno
  itens_empenho

}
