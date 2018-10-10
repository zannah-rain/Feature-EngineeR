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
   tabPanel("Summary View",
            checkboxGroupInput("summary_checkboxes", 
                               "Response(s): TODO",
                               c("DEF", "DEF")),
            tableOutput("table_metadataTODO"),
            tableOutput("health_summaryTODO")),
   tabPanel("Column View",
            # Sidebar with a slider input for number of bins 
            sidebarLayout(
              sidebarPanel(
                selectInput("column_selector",
                            "Column to view: TODO",
                            c("DEF", "DEF"))
              ),
              
              # Show a plot of the generated distribution
              mainPanel(
                plotOutput("distPlot"),
                textInput("missing_fill_box", "Fill NAs with: TODO"),
                textInput("rename_column_box", "Rename column: TODO")
              )
            )),
  tabPanel("Script Output",
           verbatimTextOutput("script_out")),
  tabPanel("Data Output",
           actionButton("save_button", "Save Data TODO"),
           tableOutput("Processed data example"))
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  rv <- reactiveValues(raw_data = iris,
                       formatting_actions = initializeFormattingActions(iris),
                       output_data = iris)
  
  callModule(setup, "setup_id")
  
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

