library(quantmod)


shinyServer(function(input, output) {
  
  
  output$plot <- renderPlot({
    data <- getSymbols(input$symb, src = "yahoo", 
                       from = input$dates[1],
                       to = input$dates[2],
                       auto.assign = FALSE)
    adjusted <- paste(input$symb, ".Adjusted",sep="")
    data <- data[, adjusted, drop=F]

    chartSeries(data, name=input$symb)
    
  })
  output$table <- renderTable({
    data <- getSymbols(input$symb, src = "yahoo", 
                       from = input$dates[1],
                       to = input$dates[2],
                       auto.assign = FALSE)
    adjusted <- paste(input$symb,".Adjusted",sep="")
    data <- data[, adjusted, drop=F]
        
    data.frame(x=monthlyReturn(data))
  })
  
  
})
