library(shiny)

columnViewUI <- function(id) {
  ns <- NS(id)
  
  tabPanel("Column View",
           # Sidebar with a slider input for number of bins
           sidebarLayout(
             sidebarPanel(
               selectInput(ns("column_selector"),
                           "Column to view: TODO",
                           c("DEF", "DEF"))
           ),

           # Show a plot of the generated distribution
           mainPanel(
             plotOutput(ns("distPlot")),
             textInput(ns("missing_fill_box"), "Fill NAs with: TODO"),
             textInput(ns("rename_column_box"), "Rename column: TODO")
           ))
  )
}

columnView <- function(input, output, session) {
  # output$distPlot <- renderPlot({
  #   # generate bins based on input$bins from ui.R
  #   x    <- faithful[, 2] 
  #   bins <- seq(min(x), max(x), length.out = 31)
  #   
  #   # draw the histogram with the specified number of bins
  #   hist(x, breaks = bins, col = 'darkgray', border = 'white')
  # })
  
  return(NULL)
}
