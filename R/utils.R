clean_input <- function(vec){
  vec <- paste(gsub("\n", " ", vec), collapse = " ")
  vec <- gsub(";", ";%", vec)
  vec <- gsub("\'", "\"", vec)
  unlist(strsplit(vec, "%"))
}

encypher_for_knitr <- function(options){

  # Locate cypher shell
  files_in_home <- list.files(path = options$neo4j_home, recursive = TRUE)
  cypher_shell <- grep("cypher-shell(\\.bat)*$", files_in_home, value = TRUE)
  options$cypher_bin <- normalizePath(file.path(options$neo4j_home, cypher_shell))

  # Create a tempfile to write the console results
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

  # Read the outputs
  out <- readLines(t)
  # remove the tempfile
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
