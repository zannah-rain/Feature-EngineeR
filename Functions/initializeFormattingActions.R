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
  lapply(names(x),
    function(y) {
      list(initial_name = y,
           new_name = y,
           missing_value_fill = robustAverage(x[[y]]),
           center = TRUE,
           scale = TRUE)
    })
}