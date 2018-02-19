##############################################################################
# CODIGO FONTE DA QUALIFICACAO DE DADOS ABERTOS DA PREFEITURA DE JOAO PESSOA #
# @Author: Rodrigo Almeida - rodrigo.almeida@gmail.com                       #
# @Contato: +55 83 996075219                                                 #
# Website: http://rodrigoalmeida.jampa.br                                    #
##############################################################################

#' @title Dados Natureza Despesas
#' @description
#' Retorna Informacoes de Natureza das Despesas da Prefeitura de Joao Pessoa
#' Disponivel em: transparencia.joaopessoa.pb.gov.br/download
#' @param path Caminho para o Arquivo
#' @param filename Nome do arquivo com Amostra. Intervalo de Confiança de 99%, Margem de erro de 5%
#' @return Dados de Natureza das Despesas
#' @examples
#' getDadosNaturezaDespesas(): Retorna data.frame com dados de Natureza das Despesas. O Data.frame conterá uma amostra aleatória da população
#' @export
getDadosNaturezaDespesas <- function(path = "data/orcamento/",
                               filename = "grupo_natureza_despesa.csv") {
  caminhoArquivo = paste(path,filename, sep = "")
  grupo_natureza_despesa <- read.csv2(file = caminhoArquivo, sep = "|", header = FALSE)

  colnames(grupo_natureza_despesa) <- c("id", "grupo_desc")
  # retorno
  grupo_natureza_despesa

}
