#' Finds a reasonable value to use as the average of a vector.
#'
#' @param x A vector of arbitrary class.
#'
#' @return A single value representative of the contents of the vector.
#' @export
#'
#' @examples
#' robustAverage(c("bal", "bal", "fal", NA, NA, NA))
#' robustAverage(c(1, 2, 3, 4, 5, NA))
robustAverage <- function(x) {
  UseMethod("robustAverage")
}

robustAverage.default <- function(x) {
  mean(x, na.rm = TRUE)
}

robustAverage.factor <- function(x) {
  if (is.ordered(x)) {
    return(levels(x)[round(mean(x, na.rm = TRUE))])
  } else {
    x <- as.character(x)
    return(robustAverage(x))
  }
}

robustAverage.character <- function(x) {
  names(table(x))[1]
}
