#' Expand vectors that have been grouped together
#'
#' @param lst A list whose elements are lists of grouped vectors. Each group of
#'   vectors are expanded to include the elements of all the other vectors in
#'   the same group.
#'
#' @return A list whose elements are lists of grouped vectors that have been
#'   expanded in a groupwise fashion.
#'
#' @export
expand <- function(lst) {
  expanded_set <- unique(unlist(lst))
  purrr::map(lst, ~ expanded_set)
}
