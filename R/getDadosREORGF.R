##############################################################################
# CODIGO FONTE DA QUALIFICACAO DE DADOS ABERTOS DA PREFEITURA DE JOAO PESSOA #
# @Author: Rodrigo Almeida - rodrigo.almeida@gmail.com                       #
# @Contato: +55 83 996075219                                                 #
# Website: http://rodrigoalmeida.jampa.br                                    #
##############################################################################

#' @title get Dados REORGF
#' @description
#' Retorna Informacoes de REO e RGF da Prefeitura de Joao Pessoa
#' Disponivel em: transparencia.joaopessoa.pb.gov.br/download
#' @param path Caminho para o Arquivo
#' @param filename Nome do arquivo com Amostra. Intervalo de Confiança de 99%, Margem de erro de 5%
#' @return Dados de Relatório Resumido de Execução Orçamentária e Relatório de Gestão Fiscal
#' @examples
#' getDadosREORGF(): Retorna data.frame com dados de Relatórios REO e RGF. O Data.frame conterá uma amostra aleatória da população
#' @export
getDadosREORGF <- function(path = "data/orcamento/",
                                     filename = "reo_rgf_lei131_random.csv") {

  caminhoArquivo = paste(path,filename, sep = "")

  reo_rgf_lei131 <- read.csv2(file = caminhoArquivo, sep = "|", header = FALSE)
  colnames(reo_rgf_lei131) <- c("codi_rela",
                                "codi_linh",
                                "tipo_linh",
                                "ano_refe",
                                "peri_gera",
                                "desc_linh",
                                "valo_1",
                                "valo_2",
                                "valo_3",
                                "valo_4",
                                "valo_5",
                                "valo_6",
                                "valo_7",
                                "valo_8",
                                "valo_9",
                                "valo_10",
                                "valo_11",
                                "valo_12",
                                "valo_13",
                                "valo_14",
                                "data")
  # retorno
  reo_rgf_lei131
}
