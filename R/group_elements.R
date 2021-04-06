#' Determine the group elements
#'
#' Determine the group elements.
#'
#' @param lst A list of atomic vectors.
#' @param fun A predicate function of (at least) two vectors to be compared.
#' @param ... Additional arguments passed on to the function \code{fn}.
#'
#' @return A list of groups. Each element of the list is a group. A group is a
#'   list of vectors.
#' @export
group_elements <- function(lst, fun = any_common, ...) {
  groups <- groups(lst, fun, ...)
  group_elements <- lapply(groups, function(x) lst[x])
  return(group_elements)
}
