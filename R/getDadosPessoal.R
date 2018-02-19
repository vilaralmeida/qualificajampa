##############################################################################
# CODIGO FONTE DA QUALIFICACAO DE DADOS ABERTOS DA PREFEITURA DE JOAO PESSOA #
# @Author: Rodrigo Almeida - rodrigo.almeida@gmail.com                       #
# @Contato: +55 83 996075219                                                 #
# Website: http://rodrigoalmeida.jampa.br                                    #
##############################################################################

#' @title get Dados Pessoal
#' @description
#' Retorna Informacoes de Pessoal da Prefeitura de Joao Pessoa
#' Disponivel em: transparencia.joaopessoa.pb.gov.br/download
#' @param path Caminho para o Arquivo
#' @param filename Nome do arquivo com Amostra. Intervalo de Confiança de 99%, Margem de erro de 5%
#' @return Dados de Pessoal
#' @examples
#' getDadosPessoal(): Retorna data.frame com dados de Publicidade. O Data.frame conterá uma amostra aleatória da população
#' @export
getDadosPessoal <- function(path = "data/pessoal/",
                                filename = "pessoal_random.csv") {
  caminhoArquivo = paste(path,filename, sep = "")

  pessoal <- read.csv2(file = caminhoArquivo, sep = "|", header = FALSE)

  colnames(pessoal) <- c("unidade_id",
                         "unidade_desc",
                         "cargo",
                         "tipo_cargo",
                         "cpf",
                         "data",
                         "nome",
                         "unidade_orcamentaria",
                         "total_vantagem",
                         "total_liquido")
  pessoal[pessoal == "--"] <- NA
  pessoal[pessoal == "NULL"] <- NA

  # retorno pessoal
  pessoal

}
