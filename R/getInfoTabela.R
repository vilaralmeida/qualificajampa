##############################################################################
# CODIGO FONTE DA QUALIFICACAO DE DADOS ABERTOS DA PREFEITURA DE JOAO PESSOA #
# @Author: Rodrigo Almeida - rodrigo.almeida@gmail.com                       #
# @Contato: +55 83 996075219                                                 #
# Website: http://rodrigoalmeida.jampa.br                                    #
##############################################################################

#' @title get Info Tabela
#' @description
#' Retorna Informacoes Sobre os Campos dos Dados Abertos
#' Disponivel em: transparencia.joaopessoa.pb.gov.br/download
#' @param tabela Qual Tabela terá a Informação Recuperada.
#' Opções: pessoal, publicidade, receitas, despesas, empenho, receitasdespesasextras, convenios, propostas
#' @return Informacoes sobre a tabela
#' @examples
#' getInfoTabela(): Retorna Colunas e Tipo de Cada coluna no formato data.frame
#' @export
getInfoTabela <- function(tabela = "pessoal") {
  df <- data.frame()

  if (tabela == "pessoal") {
    path <- "data/pessoal/pessoal.describe.csv"
    temp <- read.csv2(file = path, sep = "|", header = TRUE)
    # Remove Coluna Modificadores
    temp <- temp[,c(-3)]
    df <- temp
  }

  if (tabela == "publicidade") {
    path <- "data/publicidade/publicidade.describe.csv"
    temp <- read.csv2(file = path, sep = "|", header = TRUE)
    # Remove Coluna Modificadores
    temp <- temp[,c(-3)]
    df <- temp
  }

  if (tabela == "receitas") {
    path <- "data/orcamento/receita_lei131.describe.csv"
    temp <- read.csv2(file = path, sep = "|", header = TRUE)
    # Remove Coluna Modificadores
    temp <- temp[,c(-3)]
    df <- temp
  }

  if (tabela == "despesas") {
    path <- "data/orcamento/despesa_lei131.describe.csv"
    temp <- read.csv2(file = path, sep = "|", header = TRUE)
    # Remove Coluna Modificadores
    temp <- temp[,c(-3)]
    df <- temp
  }

  if (tabela == "empenho") {
    path <- "data/orcamento/itens_empenho.describe.csv"
    temp <- read.csv2(file = path, sep = "|", header = TRUE)
    # Remove Coluna Modificadores
    temp <- temp[,c(-3)]
    df <- temp
  }

  if (tabela == "receitasdespesasextras") {
    path <- "data/orcamento/guia_receita_despesa_extra.describe.csv"
    temp <- read.csv2(file = path, sep = "|", header = TRUE)
    # Remove Coluna Modificadores
    temp <- temp[,c(-3)]
    df <- temp
  }

  if (tabela == "convenios") {
    path <- "data/convenios/siconv_convenio.describe.csv"
    temp <- read.csv2(file = path, sep = "|", header = TRUE)
    # Remove Coluna Modificadores
    temp <- temp[,c(-3)]
    df <- temp
  }

  if (tabela == "propostas") {
    path <- "data/convenios/siconv_proposta.describe.csv"
    temp <- read.csv2(file = path, sep = "|", header = TRUE)
    # Remove Coluna Modificadores
    temp <- temp[,c(-3)]
    df <- temp
  }

  #retorno
  df
}
