#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

sourceFolder <- function(folder) {
  file_sources <- list.files(path = folder, pattern = "*.R$", full.names = TRUE)
  sapply(file_sources, source, .GlobalEnv)
}

sourceFolder("Functions")
sourceFolder("Shiny Modules")

# Define UI for application that draws a histogram
ui <- navbarPage(
  title = "Feature EngineeR",
  setupUI("setup_id"),
  overallSummaryUI("overall_summary_id"),
  columnViewUI("column_view_id"),
  scriptOutputUI("script_output_id"),
  dataOutputUI("data_output_id"),
  readableOutputUI("readable_formatting_output_id"),
  dataReportUI("data_report_id")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  rv <- reactiveValues(raw_data = iris,
                       output_data = iris)
  
  rv$raw_data <- callModule(setup, "setup_id")
  rv$formatting_actions <- callModule(columnView, "column_view_id", raw_data = rv$raw_data)
  callModule(scriptOutput, "script_output_id", input_formatting_actions = rv$formatting_actions)
  callModule(dataOutput, "data_output_id")
  
  observeEvent(rv$raw_data(), {
    print("updating formatting_actions")
    rv$initial_formatting_actions <- initializeFormattingActions(rv$raw_data())
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

