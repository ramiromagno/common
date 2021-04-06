#' Determine groups
#'
#' Determine groups by matching vectors using the predicate function \code{fun}.
#'
#' @param lst A list of atomic vectors.
#' @param fun A predicate function of (at least) two vectors to be compared.
#' @param ... Additional arguments passed on to the function \code{fn}.
#'
#' @return A list of groups. Each element of the list is a vector of indices.
#'
#' @export
groups <- function(lst, fun = any_common, ...) {
  m <- adjacency_matrix(lst, fun, ...)
  groups_from_adjacency_matrix(m)
}

#' Determine groups from an adjacency matrix
#'
#' Determine groups from an adjacency matrix.
#'
#' @param m An adjacency matrix of \code{logical} type.
#'
#' @return A list of groups. Each element of the list is a vector of indices.
#'
#' @export
groups_from_adjacency_matrix <- function(m) {
  m %>%
    igraph::graph_from_adjacency_matrix() %>%
    igraph::components() %>%
    igraph::groups()
}
