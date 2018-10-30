as.rmarkdown <- function(x) {
  UseMethod("as.rmarkdown")
}

as.rmarkdown.data.frame <- function(x) {
  scr <- paste(names(x), collapse = " | ")
  scr <- paste0(scr, "\n", paste(rep("-----", ncol(x)), collapse = " | "))
  
  for (i in 1:nrow(x)) {
    scr <- paste0(scr, "\n", paste0(apply(x[i, ], 1, identity), collapse = " | "))
  }
  
  scr
}