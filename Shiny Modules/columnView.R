library(shiny)

columnViewUI <- function(id) {
  ns <- NS(id)
  
  tabPanel("Column View",
           # Sidebar with a slider input for number of bins
           sidebarLayout(
             sidebarPanel(
               selectInput(ns("column_selector"),
                           "Column to view: TODO",
                           c("DEF" = 1, "DEF2" = 2))
           ),

           # Show a plot of the generated distribution
           mainPanel(
             plotOutput(ns("distPlot")),
             textInput(ns("missing_fill_box"), "Fill NAs with: TODO"),
             textInput(ns("rename_column_box"), "Rename column: TODO")
           ))
  )
}

columnView <- function(input, output, session, raw_data) {
  formatting_actions <- reactiveVal()
  
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- raw_data()[, as.numeric(input$column_selector)]
    bins <- seq(min(x), max(x), length.out = 31)

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
  
  observeEvent(raw_data(), {
    print("Columns updating")
    
    choiceList <- function(names) {
      x <- as.list(1:length(names))
      names(x) <- names
      x
    }
    
    updateSelectInput(session, "column_selector", choices = choiceList(names(raw_data())))
    
    formatting_actions(initializeFormattingActions(raw_data()))
  })
  
  observeEvent(input$column_selector, {
    print(input$column_selector)
  })
  
  observeEvent(input$rename_column_box, {
    formatting_actions_temp <- formatting_actions()
    formatting_actions_temp[[as.numeric(input$column_selector)]]$new_name <- isolate(input$rename_column_box)
    formatting_actions(formatting_actions_temp)
  }, ignoreInit = TRUE)
  
  formatting_actions
}
