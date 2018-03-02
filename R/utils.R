clean_input <- function(vec){
  vec <- paste(gsub("\n", " ", vec), collapse = " ")
  vec <- gsub(";", ";%", vec)
  vec <- gsub("\'", "\"", vec)
  unlist(strsplit(vec, "%"))
}

encypher_for_knitr <- function(options){
  t <- tempfile()

  # Sequencially send the code if multiple calls are given (for windows compatibility)

  if (is.null(options$neo4j_passwd)){
    for (i in seq_along(options$code)){
      write(
        system(
          glue("{options$cypher_bin} -a {options$neo4j_adress} --format {options$neo4j_format} {shQuote(options$code[[i]])}"),
          intern = TRUE),
        file = t,
        append = TRUE
      )
    }
  } else {
    for (i in seq_along(options$code)){
      write(
        system(
          glue("{options$cypher_bin} -a {options$neo4j_adress} -u {options$neo4j_user} -p {options$neo4j_passwd} --format {options$neo4j_format} {shQuote(options$code[[i]])}"),
          intern = TRUE),
        file = t,
        append = TRUE
      )
    }
  }
  out <- readLines(t)
  on.exit(
    unlink(t)
  )
  out
}


# Works only for Unix
# encypher_options <- function(options){
#   if (is.null(options$neo4j_passwd)){
#     out <- glue("echo '{options$code}' | {options$cypher_bin} -a {options$neo4j_adress} --format {options$neo4j_format}")
#   } else {
#     out <- glue("echo '{options$code}' | {options$cypher_bin} -a {options$neo4j_adress} -u {options$neo4j_user} -p {options$neo4j_passwd} --format {options$neo4j_format}")
#   }
#   out
# }
