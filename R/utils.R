clean_input <- function(vec){
  paste(gsub("\n", " ", vec), collapse = " ")
}

encypher_for_knitr <- function(options){
  if (is.null(options$neo4j_passwd)){
    out <- system( glue("echo '{options$code}' | {options$cypher_bin} -a {options$neo4j_adress} --format {options$neo4j_format}"),
                   intern = TRUE)
  } else {
    out <- system( glue("echo '{options$code}' | {options$cypher_bin} -a {options$neo4j_adress} -u {options$neo4j_user} -p {options$neo4j_passwd} --format {options$neo4j_format}"),
                   intern = TRUE)
  }
  out
}


