library(shiny)

setupUI <- function(id) {
  ns <- NS(id)
  
  tabPanel("Setup",
           checkboxInput(ns("stringsAsFactors_checkbox"), "stringsAsFactors", FALSE),
           textInput(ns("data_source_file"), "Data path:"),
           fileInput(ns("data_source_upload"), "Upload data:"),
           actionButton(ns("source_submit_button"), "Load"))
}

setup <- function(input, output, session) {
  rv <- reactiveValues("current_data" = iris)
  
  # Try each possible input source when the button is pressed
  observeEvent(input$source_submit_button, {
    maybe_new_data <- try(read.csv(input$data_source_file, stringsAsFactors = input$stringsAsFactors_checkbox), silent = TRUE)
    if (is.error(maybe_new_data)) {
      maybe_new_data <- try(read.csv(input$data_source_upload$datapath[1], stringsAsFactors = input$stringsAsFactors_checkbox), silent = TRUE)
    }
    
    if (!is.error(maybe_new_data)) {
      rv$current_data <- maybe_new_data
    }
  })
  
  reactive({rv$current_data})
}
