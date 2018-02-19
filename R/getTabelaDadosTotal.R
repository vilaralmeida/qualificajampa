##############################################################################
# CODIGO FONTE DA QUALIFICACAO DE DADOS ABERTOS DA PREFEITURA DE JOAO PESSOA #
# @Author: Rodrigo Almeida - rodrigo.almeida@gmail.com                       #
# @Contato: +55 83 996075219                                                 #
# Website: http://rodrigoalmeida.jampa.br                                    #
##############################################################################

#' @title get Tabelas Dados Total
#' @description
#' Retorna Informacoes de Qualificacao para Tabela (Sumario de Todos os Dados)
#' Disponivel em: transparencia.joaopessoa.pb.gov.br/download
#' @param obj Objeto contendo dados (Amostra) da Tabela para Avaliação.
#' @param tabela Qual Tabela terá a Informação Recuperada.
#' @param anomaly_threshold Threshold de Anomalias
#' Opções: pessoal, publicidade, receitas, despesas, empenho, receitasdespesasextras, convenios, propostas
#' @param categoria (Publicidade, Pessoal, Convenio, Orcamento)
#' @return Informacoes de Qualificacao da Tabela passada como parametro
#' @examples
#' getTabelaDadosTotal(): Retorna Qualificacao Completa dos Dados da Tabela (Sumario de Todos os Dados)
#' @import xray
#' @import dplyr

#' @export
getTabelaDadosTotal <- function(obj = NA,
                                       tabela = "",
                                       categoria = "",
                                       anomaly_threshold = 0.8) {

  if (is.na(obj) | tabela == "" | categoria == "") {
    stop("Parametros Incompletos")
  }

  df <- data.frame()

  anomalias <- as.data.frame(xray::anomalies(obj, anomaly_threshold = anomaly_threshold)[1])
  colnames(anomalias) <- c("Coluna",
                           "Quantidade_Linhas",
                           "Quantidade_Nulas",
                           "Percentual_Nulas",
                           "Quantidade_Zero",
                           "Percentual_Zero",
                           "Quantidade_Brancas",
                           "Percentual_Brancas",
                           "Quantidade_Valor_Infinito",
                           "Percentual_Valor_Infinito",
                           "Quantidade_Campos_Distintos",
                           "Tipo_Objeto",
                           "Percentual_Anomalias")

  dadosTabela <- getInfoTabela(tabela = tabela)
  dadosTabela <- data.frame(lapply(dadosTabela,trim))
  dadosTabela <- data.frame(lapply(dadosTabela, as.character), stringsAsFactors=FALSE)

  if (nrow(anomalias) > 0) {
    col <- as.character(anomalias$Coluna)

    # Dataframe com Informacoes a serem incorporadas
    dfIncorporado <- data.frame()

    for(i in 1:(length(col))) {
      dadosResumidosTabela <- dadosTabela %>% filter(Coluna == col[i])
      # print("####")
      # print("Tabela: ")
      # print(tabela)
      # print("Coluna da Tabela Anomalias: ")
      # print(col[i])
      # print("Coluna da Tabela dadosTabela: ")
      # print(dadosResumidosTabela$Coluna)
      # print("Valor Tipo: ")
      # print(dadosResumidosTabela$Tipo)
      # print("####")
      temp <- c(dadosResumidosTabela$Tipo, categoria, tabela)
      dfIncorporado <- rbind(dfIncorporado, temp)
    }

    colnames(dfIncorporado) <- c("Tipo_Dado",
                                 "Categoria",
                                 "Tabela")

    df <- cbind(anomalias, dfIncorporado)
  }

  # Retorno
  df

} # Fim da funcao
