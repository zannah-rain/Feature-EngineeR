library(shiny)

setupUI <- function(id) {
  ns <- NS(id)
  
  tabPanel("Setup",
           checkboxInput("stringsAsFactors_checkbox", "stringsAsFactors TODO", FALSE),
           textInput("data_source_file", "Data path: TODO"),
           fileInput("data_source_upload", "Upload data: TODO"),
           actionButton("source_submit_button", "Load"))
}

setup <- function(input, output, session) {
  
}
