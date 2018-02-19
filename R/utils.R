#
# Classe Com Metodos Uteis
#

trim <- function (x) gsub("^\\s+|\\s+$", "", x)

#'%!in%' <- function(x,y) !('%in%'(x,y))

getTabelas <- function() {
  tabelas = c("pessoal", "publicidade", "receitas", "despesas", "empenho", 
              "receitasdespesasextras", "convenios", "propostas")
  tabelas
}

getCategorias <- function() {
  # Em paridade com a lista de Tabelas acima
  categorias <- c("Pessoal", "Publicidade", "Orcamento", "Orcamento", "Orcamento", "Orcamento",  "Convenio", "Convenio")
  categorias
}

getTodasCategorias <- function() {
  categorias <- c("Pessoal", "Publicidade", "Orcamento", "Convenio")
  categorias
  
}

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

