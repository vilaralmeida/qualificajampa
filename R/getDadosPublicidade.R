##############################################################################
# CODIGO FONTE DA QUALIFICACAO DE DADOS ABERTOS DA PREFEITURA DE JOAO PESSOA #
# @Author: Rodrigo Almeida - rodrigo.almeida@gmail.com                       #
# @Contato: +55 83 996075219                                                 #
# Website: http://rodrigoalmeida.jampa.br                                    #
##############################################################################

#' @title get Dados Publicidade
#' @description
#' Retorna Informacoes de Publicidade da Prefeitura de Joao Pessoa
#' Disponivel em: transparencia.joaopessoa.pb.gov.br/download
#' @param path Caminho para o Arquivo
#' @param filename Nome do arquivo com Amostra. Intervalo de Confiança de 99%, Margem de erro de 5%
#' @return Dados de Publicidade
#' @examples
#' getDadosPublicidade(): Retorna data.frame com dados de Publicidade. O Data.frame conterá uma amostra aleatória da população
#' @export
getDadosPublicidade <- function(path = "data/publicidade/",
                                filename = "publicidade_random.csv") {

  caminhoArquivo = paste(path,filename, sep = "")
  publicidade <- read.csv2(file = caminhoArquivo, sep = "|", header = FALSE)
  #publicidade <- publicidade[,c(1:13)]
  colnames(publicidade) <- c("id",
                             "agencia",
                             "campanha",
                             "fornecedor",
                             "nf_fornecedor",
                             "nf_agencia",
                             "contrato",
                             "vigencia",
                             "empenho",
                             "valor_bruto",
                             "data_pag",
                             "tipo_servico",
                             "veiculo",
                             "sistema")
  # retorna publicidade
  publicidade
}
