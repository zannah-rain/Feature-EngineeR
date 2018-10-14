library(shiny)

dataOutputUI <- function(id) {
  ns <- NS(id)
  
  tabPanel("Data Output",
           actionButton(ns("save_button"), "Save Data TODO"),
           tableOutput(ns("processed_data_example_box")))
}

dataOutput <- function(input, output, session) {
  
}
