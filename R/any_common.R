#' Any element in common?
#'
#' Checks if two vectors have an element in common.
#'
#' @param x A vector.
#' @param y Another vector.
#' @param rm_na A logical indicating whether to remove \code{NA} elements before
#'   checking for common elements between the two vectors.
#'
#' @return A logical scalar. \code{TRUE} indicates that \code{x} and \code{y}
#'   have at least one element in common, and \code{FALSE} otherwise.
#'
#' @export
any_common <- function(x, y, rm_na = TRUE) {
  if (rm_na) {
    x <- x[!is.na(x)]
    y <- y[!is.na(y)]
  }
  length(intersect(x, y)) > 0
}
