#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        output$dataID=renderDT(data)
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
  observeEvent(input$btnId,{
     text=input$TextID
      output$textOut=renderText(text)
      output$dataID=renderDT(data %>% filter(Element==input$selectID))
      output$plotId=renderPlot(hist(data %>%
                                        filter(Element==input$selectID) %>% 
                                        pull(Value)))
 }
 )
        
    })

})
