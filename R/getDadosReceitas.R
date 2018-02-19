##############################################################################
# CODIGO FONTE DA QUALIFICACAO DE DADOS ABERTOS DA PREFEITURA DE JOAO PESSOA #
# @Author: Rodrigo Almeida - rodrigo.almeida@gmail.com                       #
# @Contato: +55 83 996075219                                                 #
# Website: http://rodrigoalmeida.jampa.br                                    #
##############################################################################

#' @description 
#' Retorna Informacoes de Receitas da Prefeitura de Joao Pessoa
#' Disponivel em: transparencia.joaopessoa.pb.gov.br/download
#' @param path Caminho para o Arquivo
#' @param filename Nome do arquivo com Amostra. Intervalo de Confiança de 99%, Margem de erro de 5%
#' @return Dados de Receitas
#' @examples
#' getDadosReceitas(): Retorna data.frame com dados de Receitas. O Data.frame conterá uma amostra aleatória da população
getDadosReceitas <- function(path = "data/orcamento/",
                                 filename = c("receita_lei131_2009_random.csv",
                                              "receita_lei131_2010_random.csv",
                                              "receita_lei131_2011_random.csv",
                                              "receita_lei131_2012_random.csv",
                                              "receita_lei131_2013_random.csv",
                                              "receita_lei131_2014_random.csv",
                                              "receita_lei131_2015_random.csv",
                                              "receita_lei131_2016_random.csv",
                                              "receita_lei131_2017_random.csv",
                                              "receita_lei131_2018_random.csv")) {
  receitas <- data.frame()
  for(i in 1:length(filename)) {
    caminhoArquivo = paste(path,filename[i], sep = "")
    temp <- read.csv2(file = caminhoArquivo, sep = "|", header = FALSE)
    receitas <- rbind(receitas, temp)
  }
  
  colnames(receitas) <- c("ano_refe",
                                     "mes_refe",
                                     "codi_enti",
                                     "nome_enti",
                                     "codi_rece",
                                     "desc_rece",
                                     "desc_forc",
                                     "valo_arre",
                                     "data_ulal",
                                     "matr_usua",
                                     "desc_tpmo")
  
  receitas[receitas == "\\N"] <- NA
  
  #retorno
  receitas
  
}