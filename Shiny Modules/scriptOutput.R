library(shiny)

scriptOutputUI <- function(id) {
  ns <- NS(id)
  
  tabPanel("Script Output",
           textInput(ns("data_name"), "Data variable name:", "x"),
           verbatimTextOutput(ns("script_out"), placeholder = TRUE))
}

scriptOutput <- function(input, output, session, input_formatting_actions) {
  rv <- reactiveValues(formatting_actions = list())
  
  observeEvent(input_formatting_actions(), {
    print("Updating script formatting_actions")
    rv$formatting_actions <- input_formatting_actions()
  })
  
  output$script_out <- renderText({generateFormattingScript(input$data_name, rv$formatting_actions)})
}
