##############################################################################
# CODIGO FONTE DA QUALIFICACAO DE DADOS ABERTOS DA PREFEITURA DE JOAO PESSOA #
# @Author: Rodrigo Almeida - rodrigo.almeida@gmail.com                       #
# @Contato: +55 83 996075219                                                 #
# Website: http://rodrigoalmeida.jampa.br                                    #
##############################################################################

#' @title get Codigo Receita Nomenclatura
#' @description
#' Retorna Informacoes de Codigo Receita Nomenclatura TCE da Prefeitura de Joao Pessoa
#' Disponivel em: transparencia.joaopessoa.pb.gov.br/download
#' @param path Caminho para o Arquivo
#' @param filename Nome do arquivo com Amostra. Intervalo de Confiança de 99%, Margem de erro de 5%
#' @return Dados de Codigo Receita Nomenclatura do TCE
#' @examples
#' getDadosCodigoReceitaNomenclaturaTCE(): Retorna data.frame com dados de Nomenclatura de Receita do Tribunal de Contas.
#' O Data.frame conterá uma amostra aleatória da população
#' @export
getDadosCodigoReceitaNomenclaturaTCE <- function(path = "data/orcamento/",
                                         filename = "categorias_economicas.csv") {

  caminhoArquivo = paste(path,filename, sep = "")
  codigo_receita_nomenclatura_tce <- read.csv2(file = caminhoArquivo, sep = "|", header = FALSE)
  colnames(codigo_receita_nomenclatura_tce) <- c("codigo","descricao","escriturada")
  # retorno
  codigo_receita_nomenclatura_tce

}
