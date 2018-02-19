##############################################################################
# CODIGO FONTE DA QUALIFICACAO DE DADOS ABERTOS DA PREFEITURA DE JOAO PESSOA #
# @Author: Rodrigo Almeida - rodrigo.almeida@gmail.com                       #
# @Contato: +55 83 996075219                                                 #
# Website: http://rodrigoalmeida.jampa.br                                    #
##############################################################################

#' @description 
#' Retorna Informacoes de Receitas e Despesas Extras da Prefeitura de Joao Pessoa
#' Disponivel em: transparencia.joaopessoa.pb.gov.br/download
#' @param path Caminho para o Arquivo
#' @param filename Nome do arquivo com Amostra. Intervalo de Confiança de 99%, Margem de erro de 5%
#' @return Dados de Receitas e Despesas Extras
#' @examples
#' getDadosGuiaReceitaDespesaExtra(): Retorna data.frame com dados de Receitas e Despesas Extras. O Data.frame conterá uma amostra aleatória da população
getDadosGuiaReceitaDespesaExtra <- function(path = "data/orcamento/",
                                     filename = "guia_receita_despesa_extra_random.csv") {
  
  caminhoArquivo = paste(path,filename, sep = "")
  
  guia_receita_despesa_extra <- read.csv2(file = caminhoArquivo, sep = "|", header = FALSE)
  
  colnames(guia_receita_despesa_extra) <- c("nume_guia",
                                            "ano_refe",
                                            "nume_empe",
                                            "ano_empe",
                                            "codi_redc",
                                            "codi_redr",
                                            "codi_forn",
                                            "data_guia",
                                            "valo_guia",
                                            "valo_pago",
                                            "valo_anul",
                                            "hist_guia",
                                            "data_ulal",
                                            "matr_usua",
                                            "tipo_guia",
                                            "tipo_guia_gera",
                                            "valo_emit_cheq",
                                            "codi_situ",
                                            "codi_redc_prev",
                                            "desc_tipo",
                                            "desc_tipo_gera",
                                            "sald_guia",
                                            "sald_ante",
                                            "nume_proc",
                                            "marc_dia",
                                            "marc_reco",
                                            "nume_parc",
                                            "codi_mes",
                                            "desc_situ",
                                            "anex_proc",
                                            "codi_forc",
                                            "codi_tipo_cons",
                                            "codi_tipo_depo",
                                            "ano_proc",
                                            "ano_codi_mes",
                                            "cont_publ",
                                            "flag_lote",
                                            "codi_barr",
                                            "valo_nomi_codi_barr",
                                            "valo_desc_codi_barr",
                                            "valo_mora_codi_barr",
                                            "tipo_fatu",
                                            "data_venc_codi_barr",
                                            "nume_guia_ante",
                                            "desc_conta",
                                            "desc_rece",
                                            "codi_rece",
                                            "fonte",
                                            "data_pgto",
                                            "conta_pgto",
                                            "entidade",
                                            "nome_forn",
                                            "clas_fisc",
                                            "cnpj_cpf",
                                            "endereco",
                                            "cidade",
                                            "estado")
  
  guia_receita_despesa_extra[guia_receita_despesa_extra == "\\N"] <- NA
  
  #retorno
  guia_receita_despesa_extra
  
  }