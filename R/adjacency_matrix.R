#' Compute the adjacency matrix
#'
#' Compute the adjacency matrix of a list of vectors.
#'
#' @param lst A list of atomic vectors.
#' @param fun A predicate function of (at least) two vectors to be compared.
#' @param ... Additional arguments passed on to the function \code{fn}.
#'
#' @return An adjacency matrix of boolean values.
#'
#' @export
adjacency_matrix <- function(lst, fun = any_common, ...) {
  sapply(lst, function(x) sapply(lst, function(y) fun(x, y, ...)))
}
