library(shiny)

columnViewUI <- function(id) {
  ns <- NS(id)
  
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
           ))
}

columnView <- function(input, output, session) {
  
}
