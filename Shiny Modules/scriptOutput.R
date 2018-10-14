library(shiny)

scriptOutputUI <- function(id) {
  ns <- NS(id)
  
  tabPanel("Script Output",
           textInput(ns("data_name"), "Data variable name:", "x"),
           verbatimTextOutput(ns("script_out"), placeholder = TRUE))
}

scriptOutput <- function(input, output, session, formatting_actions) {
  output$script_out <- renderText(generateFormattingScript(input$data_name, formatting_actions))
}
