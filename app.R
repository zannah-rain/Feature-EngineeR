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
  tabPanel("Data Output",
           actionButton("save_button", "Save Data TODO"),
           tableOutput("Processed data example"))
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  rv <- reactiveValues(raw_data = iris,
                       formatting_actions = initializeFormattingActions(iris),
                       output_data = iris)
  
  rv$raw_data <- callModule(setup, "setup_id")
  callModule(columnView, "column_view_id", rv$raw_data)
  
  observeEvent(rv$raw_data, {
    print("rv$raw_data changed")
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

