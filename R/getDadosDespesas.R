##############################################################################
# CODIGO FONTE DA QUALIFICACAO DE DADOS ABERTOS DA PREFEITURA DE JOAO PESSOA #
# @Author: Rodrigo Almeida - rodrigo.almeida@gmail.com                       #
# @Contato: +55 83 996075219                                                 #
# Website: http://rodrigoalmeida.jampa.br                                    #
##############################################################################

#' @title get Dados Despesas
#' @description
#' Retorna Informacoes de Despesas da Prefeitura de Joao Pessoa
#' Disponivel em: transparencia.joaopessoa.pb.gov.br/download
#' @param path Caminho para o Arquivo
#' @param filename Nome do arquivo com Amostra. Intervalo de Confiança de 99%, Margem de erro de 5%
#' @return Dados de Despesas. Agrega os anos 2009 a 2018
#' @examples
#' getDadosDespesas(): Retorna data.frame com dados de Despesas. O Data.frame conterá uma amostra aleatória da população
#' @export
getDadosDespesas <- function(path = "data/orcamento/",
                                         filename = c("despesa_lei131_2009_random.csv",
                                                      "despesa_lei131_2010_random.csv",
                                                      "despesa_lei131_2011_random.csv",
                                                      "despesa_lei131_2012_random.csv",
                                                      "despesa_lei131_2013_random.csv",
                                                      "despesa_lei131_2014_random.csv",
                                                      "despesa_lei131_2015_random.csv",
                                                      "despesa_lei131_2016_random.csv",
                                                      "despesa_lei131_2017_random.csv",
                                                      "despesa_lei131_2018_random.csv")) {

  despesas <- data.frame()
  for(i in 1:length(filename)) {
    caminhoArquivo = paste(path,filename[i], sep = "")
    temp <- read.csv2(file = caminhoArquivo, sep = "|", header = FALSE)
    despesas <- rbind(despesas, temp)
  }

  colnames(despesas) <- c("ano_refe",
                                     "mes_refe",
                                     "codi_enti",
                                     "nome_enti",
                                     "desc_forc",
                                     "nume_empe",
                                     "ano_empe",
                                     "data_empe",
                                     "desc_tpem",
                                     "nome_forn",
                                     "codi_elem",
                                     "desc_desp",
                                     "desc_orga",
                                     "desc_tpde",
                                     "nume_proc",
                                     "desc_tpli",
                                     "nume_lici",
                                     "nume_proc_lici",
                                     "valo_empe",
                                     "data_movi",
                                     "desc_tpmo",
                                     "nume_parc",
                                     "valo_movi",
                                     "data_ulal",
                                     "matr_usua",
                                     "desc_func",
                                     "desc_subf",
                                     "desc_prog",
                                     "cnpj_cpf",
                                     "desc_proj",
                                     "codi_orga",
                                     "codi_unor",
                                     "desc_unor",
                                     "codi_func",
                                     "codi_subf",
                                     "codi_prog",
                                     "codi_acao",
                                     "desc_acao",
                                     "tota_cred",
                                     "valo_orca",
                                     "sald_ante",
                                     "codi_sube",
                                     "desc_sube",
                                     "insc_esta",
                                     "insc_muni",
                                     "nume_pis",
                                     "ncon_indi",
                                     "codi_forc",
                                     "ug",
                                     "tipo_documento",
                                     "numero_documento",
                                     "conta_pagadora",
                                     "historico_pagamento",
                                     "nume_contr")

  despesas[despesas == "\\N"] <- NA

  #retorno
  despesas

}

