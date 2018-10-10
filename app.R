#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- navbarPage(
   title = "Feature EngineeR",
   tabPanel("Setup",
            checkboxInput("stringsAsFactors_checkbox", "stringsAsFactors TODO", FALSE),
            textInput("data_source_file", "Data path: TODO"),
            fileInput("data_source_upload", "Upload data: TODO"),
            actionButton("source_submit_button", "Load")),
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
                textInput("rename_column_box", "Rename column:")
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
                       output_data = iris)
  
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

