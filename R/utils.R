#
# Classe Com Metodos Uteis
#
#' @title trim
#' @export
trim <- function (x) gsub("^\\s+|\\s+$", "", x)

#' @title getTabelas
#' @export
getTabelas <- function() {
  tabelas = c("pessoal", "publicidade", "receitas", "despesas", "empenho",
              "receitasdespesasextras", "convenios", "propostas")
  tabelas
}

#' @title getCategorias
#' @export
getCategorias <- function() {
  # Em paridade com a lista de Tabelas acima
  categorias <- c("Pessoal", "Publicidade", "Orcamento", "Orcamento", "Orcamento", "Orcamento",  "Convenio", "Convenio")
  categorias
}

#' @title getTodasCategorias
#' @export
getTodasCategorias <- function() {
  categorias <- c("Pessoal", "Publicidade", "Orcamento", "Convenio")
  categorias

}

#' @title getDataset
#' @export
getDataset <- function(categoria="Pessoal") {
  retorno = ""
  if (categoria == "Pessoal") {
    retorno =  c("pessoal")
  }

  if (categoria == "Publicidade") {
    retorno =  c("publicidade")
  }

  if (categoria == "Orcamento") {
    retorno =  c("despesas", "empenho","receitasdespesasextras")
  }

  if (categoria == "Convenio") {
    retorno =  c("convenios", "propostas")
  }

  retorno
}

