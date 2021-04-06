#' Complete vectors by association of common elements
#'
#' This function completes vectors by adding elements from other vectors that
#' share at least one element in common. Note that is process is iterative,
#' where testing for common elements is redone as new elements are added.
#'
#' This function takes a list \code{lst} of vectors. These vectors are compared
#' against each other and those pairs with common elements get are appended the
#' elements from the corresponding pair.
#'
#' @param lst A list of vectors to be compared.
#' @param flatten If \code{flatten} is \code{TRUE}, the returned list will have
#'   the same depth as the input list \code{lst}. If \code{FALSE}, the returned
#'   list retains contains one nesting level reflecting the grouping of vectors
#'   with common elements.
#'
#' @return A list whose vectors have been expanded to include elements from
#'   other vectors.
#'
#' @export
complete_by_common <- function(lst, flatten = TRUE) {

  lst_names <- names(lst)
  if(is.null(lst_names) || any(lst_names == ''))
    stop('`lst` must be a fully named list.')

  grouped_lst <- group_elements(lst)
  expanded_lst <- purrr::map(grouped_lst, expand)

  if(flatten) {
    # remove one nesting level due to grouping
    expanded_lst <- purrr::flatten(expanded_lst)
    # reordering of `expanded_lst` elements to
    # reflect the same order as in `lst`
    expanded_lst <- expanded_lst[lst_names]
  }

  return(expanded_lst)
}
