library(shiny)

setupUI <- function(id) {
  ns <- NS(id)
  
  tabPanel("Setup",
           checkboxInput(ns("stringsAsFactors_checkbox"), "stringsAsFactors TODO", FALSE),
           textInput(ns("data_source_file"), "Data path: TODO"),
           fileInput(ns("data_source_upload"), "Upload data: TODO"),
           actionButton(ns("source_submit_button"), "Load"))
}

setup <- function(input, output, session) {
  
}
