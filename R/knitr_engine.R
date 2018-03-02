#' Set the Neo4J knitr engine
#'
#' Set up a neo4J knitr engine in an RMarkdown.
#'
#' @param cypher_bin the path to your cypher-shell bin
#' @param neo4j_user your Neo4J username
#' @param neo4j_passwd your Neo4J username
#' @param neo4j_format the format of the output (either auto, verbose, or plain, default is "verbose")
#' @param neo4j_adress the url of the cluster, default is "bolt://localhost:7687"
#'
#' @importFrom knitr opts_chunk knit_engines engine_output
#' @importFrom glue glue
#' @importFrom attempt stop_if_not
#'
#' @return a Neo4J knitr engine
#' @export
#'
#' @examples
#' \dontrun{
#' rmd4j::set_neo4J_engine("/Users/colin/neo/bin/cypher-shell", "Colin", "plop")
#' }

set_neo4j_engine <- function(cypher_bin,
                             neo4j_user = NULL,
                             neo4j_passwd = NULL,
                             neo4j_format = c("verbose","auto","plain"),
                             neo4j_adress = "bolt://localhost:7687"){
  neo4j_format <- match.arg(neo4j_format)
  stop_if_not(cypher_bin, file.exists, "Unable to get the cypher bin (file.exists returned FALSE)")

  opts_chunk$set(cypher_bin = cypher_bin,
                 neo4j_user = neo4j_user,
                 neo4j_passwd = neo4j_passwd,
                 neo4j_format = neo4j_format,
                 neo4j_adress = neo4j_adress)

  knit_engines$set(neo4j = function(options) {
    if (options$eval) {
      options$code <- clean_input(options$code)
      out <- encypher_for_knitr(options)
      #out <- options$code
    }
    engine_output(options, options$code, out)
  })
}
