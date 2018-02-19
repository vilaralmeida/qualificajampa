##############################################################################
# CODIGO FONTE DA QUALIFICACAO DE DADOS ABERTOS DA PREFEITURA DE JOAO PESSOA #
# @Author: Rodrigo Almeida - rodrigo.almeida@gmail.com                       #
# @Contato: +55 83 996075219                                                 #
# Website: http://rodrigoalmeida.jampa.br                                    #
##############################################################################

#' @title Resumo Qualifica Dados Abertos JP
#' @description
#' Função para Qualificação de Dados Abertos de Joao Pessoa (Somente os campos problemáticos)
#' Todos os CVSs utilizados está disponivel em: transparencia.joaopessoa.pb.gov.br/download (10/02/2018)
#' @param data.atualizacao Data em que os dados foram obtidos. Formato dd/mm/aaaa
#' @return Dados de Qualificação da Prefeitura de Joao Pessoa
#' @examples
#' qualificaDadosAbertosJP(): Retorna data.frame com painel de Qualificação de Dados Abertos de Joao Pessoa
#' nas seguintes áreas: Pessoas, Convenios, Publicidade, Orçamentarios
#' @import xray
#' @export
resumoQualificaDadosAbertosJP <- function(anomaly_threshold = 0.8) {
  # Importante: Nome dos Objetos igual ao Nome das Tabelas

  # Recupera Dados de Publicidade.
  publicidade <- getDadosPublicidade()
  # Recupera Dados de Pessoal
  pessoal <- getDadosPessoal()
  # Recupera Dados Orçamentarios (Receitas)
  receitas <- getDadosReceitas()
  # Recupera Dados Orçamentarios (Despesas)
  despesas <- getDadosDespesas()
  # Recupera Dados Orçamentarios (Empenho)
  empenho <- getDadosItensEmpenho()
  # Recupera Dados Orçamentarios (Guia de Receitas e Despesas Extras)
  receitasdespesasextras <- getDadosGuiaReceitaDespesaExtra()
  # Recupera Dados de Convenios Firmados
  convenios <- getDadosConvenios()
  # Recupera Dados de Propostas de Convenios
  propostas <- getDadosPropostasConvenios()

  tabelas <- getTabelas()

  categorias <- getCategorias()


  df <- getTabelaDadosQualificados(obj = get(tabelas[1]),
                                   tabela = tabelas[1],
                                   categoria = categorias[1],
                                   anomaly_threshold = anomaly_threshold)

  for (i in 2:length(tabelas)) {
    temp <- getTabelaDadosQualificados(obj = get(tabelas[i]),
                                     tabela = tabelas[i],
                                     categoria = categorias[i],
                                     anomaly_threshold = anomaly_threshold)

    df <- rbind(df, temp)
  }

  # retorno
  df <- df[,c(16,17,1,4,6,8,11,13,14)]
  colnames(df) <- c("Categoria","Dataset","Atributo","Nulos","Zerados","Brancos","Distintos","Anomalias","Resumo")
  df


} # Fim da Funcao


