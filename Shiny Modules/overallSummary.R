library(shiny)

overallSummaryUI <- function(id) {
  ns <- NS(id)
  
  tabPanel("Summary View",
           checkboxGroupInput(ns("summary_checkboxes"), 
                              "Response(s): TODO",
                              c("DEF", "DEF")),
           tableOutput(ns("table_metadataTODO")),
           tableOutput(ns("health_summaryTODO")))
}

overallSummary <- function(input, output, session) {
  
}
