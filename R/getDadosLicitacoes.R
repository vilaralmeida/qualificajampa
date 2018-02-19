##############################################################################
# CODIGO FONTE DA QUALIFICACAO DE DADOS ABERTOS DA PREFEITURA DE JOAO PESSOA #
# @Author: Rodrigo Almeida - rodrigo.almeida@gmail.com                       #
# @Contato: +55 83 996075219                                                 #
# Website: http://rodrigoalmeida.jampa.br                                    #
##############################################################################

#' @title get Dados Licitacoes
#' @description
#' Retorna Informacoes de Publicidade da Prefeitura de Joao Pessoa
#' Disponivel em: transparencia.joaopessoa.pb.gov.br/download
#' @param path Caminho para o Arquivo
#' @param filename Nome do arquivo com Amostra. Intervalo de Confiança de 99%, Margem de erro de 5%
#' @return Dados de Licitacoes
#' @examples
#' getDadosLicitacoes(): Retorna data.frame com dados de Licitacoes. O Data.frame conterá uma amostra aleatória da população
#' @export
getDadosLicitacoes <- function(path = "data/licitacoes/",
                                filename = "licitacoes_random.csv") {
  caminhoArquivo = paste(path,filename, sep = "")

  licitacoes <- read.csv2(file = caminhoArquivo, sep = "|", header = FALSE)
  colnames(licitacoes) <- c("ID",
                            "data_postagem",
                            "titu",
                            "obj",
                            "nume_lici",
                            "data_lici",
                            "seto_inte",
                            "modalidade",
                            "comissao",
                            "docu")

  licitacoes[licitacoes == "\\N"] <- NA
  # retorna licitacoes
  licitacoes
}
