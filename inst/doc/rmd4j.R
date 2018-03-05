## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----gh-installation, eval = FALSE---------------------------------------
#  # install.packages("remotes")
#  remotes::install_github("ThinkR-open/rmd4j")

## ---- eval = FALSE-------------------------------------------------------
#  rmd4j::set_neo4j_engine(cypher_bin = "/Users/colin/soft/graphs/n4j/bin/cypher-shell")

## ---- eval = FALSE-------------------------------------------------------
#  rmd4j::set_neo4j_engine(cypher_bin = "/Users/colin/soft/graphs/n4j/bin/cypher-shell",
#                          neo4j_user = "colin",
#                          neo4j_passwd = "pouetpouet",
#                          neo4j_adress = "bolt://localhost:7687")

