#' Creates the object which summarises all formatting to be done.
#'
#' @param x The data.frame to be formatted.
#'
#' @return A list with a further list of actions for each column in x.
#' @export
#'
#' @examples
#' initializeFormattingActions(iris)
initializeFormattingActions <- function(x) {
  y <- lapply(names(x),
              function(y) {
                list(new_name = y,
                     missing_value_fill = robustAverage(x[[y]]))
              })
  names(y) <- names(x)
  y
}