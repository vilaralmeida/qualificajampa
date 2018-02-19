##############################################################################
# CODIGO FONTE DA QUALIFICACAO DE DADOS ABERTOS DA PREFEITURA DE JOAO PESSOA #
# @Author: Rodrigo Almeida - rodrigo.almeida@gmail.com                       #
# @Contato: +55 83 996075219                                                 #
# Website: http://rodrigoalmeida.jampa.br                                    #
##############################################################################

#' @description 
#' Função para Qualificação de Dados Abertos de Joao Pessoa (Somente os campos problemáticos)
#' Todos os CVSs utilizados está disponivel em: transparencia.joaopessoa.pb.gov.br/download (10/02/2018)
#' @param data.atualizacao Data em que os dados foram obtidos. Formato dd/mm/aaaa
#' @return Dados de Qualificação da Prefeitura de Joao Pessoa
#' @examples
#' qualificaDadosAbertosJP(): Retorna data.frame com painel de Qualificação de Dados Abertos de Joao Pessoa
#' nas seguintes áreas: Pessoas, Convenios (Propostas e Convenios Firmados), Publicidade, 
#' Orçamentarios (Despesas, Receitas, Empenho, Guia de Receitas e Despesas Extras) 
#' @import xray
#' @source getDadosConvenios
#' @source getDadosDespesas
#' @source getDadosGuiaReceitaDespesaExtra
#' @source getDadosItensEmpenho
#' @source getDadosPessoal
#' @source getDadosPropostasConvenios
#' @source getDadosPublicidade
#' @source getDadosReceitas
#' @source getTabelaDadosQualificados
#' @source utils

source('./R/getDadosPublicidade.R', local = TRUE) 
source('./R/getDadosPessoal.R', local = TRUE)
source('./R/getDadosReceitas.R', local = TRUE)
source('./R/getDadosDespesas.R', local = TRUE)
source('./R/getDadosItensEmpenho.R', local = TRUE)
source('./R/getDadosGuiaReceitaDespesaExtra.R', local = TRUE)
source('./R/getDadosConvenios.R', local = TRUE)
source('./R/getDadosPropostasConvenios.R', local = TRUE)
source('./R/getTabelaDadosQualificados.R', local = TRUE)
source('./R/utils.R', local = TRUE)

# Remove Warningns
options( warn = -1 )

qualificaDadosAbertosJP <- function(anomaly_threshold = 0.8) {
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
  df
  
  
} # Fim da Funcao


