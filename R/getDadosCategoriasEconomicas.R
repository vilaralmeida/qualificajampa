##############################################################################
# CODIGO FONTE DA QUALIFICACAO DE DADOS ABERTOS DA PREFEITURA DE JOAO PESSOA #
# @Author: Rodrigo Almeida - rodrigo.almeida@gmail.com                       #
# @Contato: +55 83 996075219                                                 #
# Website: http://rodrigoalmeida.jampa.br                                    #
##############################################################################

#' @description 
#' Retorna Informacoes de Categorias Economicas da Prefeitura de Joao Pessoa
#' Disponivel em: transparencia.joaopessoa.pb.gov.br/download
#' @param path Caminho para o Arquivo
#' @param filename Nome do arquivo com Amostra. Intervalo de Confiança de 99%, Margem de erro de 5%
#' @return Dados de Categorias Economicas
#' @examples
#' getDadosCategoriasEconomicas(): Retorna data.frame com dados de Categorias Economicas. O Data.frame conterá uma amostra aleatória da população
getDadosCategoriasEconomicas <- function(path = "data/orcamento/",
                            filename = "categorias_economicas.csv") {
  
  caminhoArquivo = paste(path,filename, sep = "")
  categorias_economicas <- read.csv2(file = caminhoArquivo, sep = "|", header = FALSE)
  colnames(categorias_economicas) <- c("id","categoria_desc")
  
  #retorno
  categorias_economicas
}