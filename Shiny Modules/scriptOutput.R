library(shiny)

scriptOutputUI <- function(id) {
  ns <- NS(id)
  
  tabPanel("Script Output",
           verbatimTextOutput("script_out"))
}

scriptOutput <- function(input, output, session) {
  
}
