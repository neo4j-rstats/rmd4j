#' neo4j chunk
#'
#' Add a neo4j chunk
#'
#' @return a neo4j chunk
#'
#' @rdname neo4j
#' @export
#' @importFrom rstudioapi getSourceEditorContext insertText
#'
chunk4j <- function(){
  a <- rstudioapi::getSourceEditorContext()
  rstudioapi::insertText(location = a$selection[[1]]$range, text = "\n```{neo4j}\n\n```\n")
}
