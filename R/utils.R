clean_input <- function(vec){
  paste(gsub("\n", " ", vec), collapse = " ")
}

encypher_options <- function(options){
  if (is.null(options$neo4j_passwd)){
    out <- glue("echo '{options$code}' | {options$cypher_bin} -a {options$neo4j_adress} --format {options$neo4j_format}")
  } else {
    out <- glue("echo '{options$code}' | {options$cypher_bin} -a {options$neo4j_adress} -u {options$neo4j_user} -p {options$neo4j_passwd} --format {options$neo4j_format}")
  }
  out
}


encypher_for_knitr <- function(options){
  system( encypher_options(options), intern = TRUE)
}



