library(shiny)

overallSummaryUI <- function(id) {
  ns <- NS(id)
  
  tabPanel("Summary View",
           checkboxGroupInput("summary_checkboxes", 
                              "Response(s): TODO",
                              c("DEF", "DEF")),
           tableOutput("table_metadataTODO"),
           tableOutput("health_summaryTODO"))
}

overallSummary <- function(input, output, session) {
  
}
