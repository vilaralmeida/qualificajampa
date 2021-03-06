% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getDadosREORGF.R
\name{getDadosREORGF}
\alias{getDadosREORGF}
\title{get Dados REORGF}
\usage{
getDadosREORGF(path = "data/orcamento/",
  filename = "reo_rgf_lei131_random.csv")
}
\arguments{
\item{path}{Caminho para o Arquivo}

\item{filename}{Nome do arquivo com Amostra. Intervalo de Confiança de 99%, Margem de erro de 5%}
}
\value{
Dados de Relatório Resumido de Execução Orçamentária e Relatório de Gestão Fiscal
}
\description{
Retorna Informacoes de REO e RGF da Prefeitura de Joao Pessoa
Disponivel em: transparencia.joaopessoa.pb.gov.br/download
}
\examples{
getDadosREORGF(): Retorna data.frame com dados de Relatórios REO e RGF. O Data.frame conterá uma amostra aleatória da população
}
