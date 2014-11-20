library(shiny)

shinyUI(fluidPage(
  titlePanel("Stock Price Chart and Return"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Input a valid stock symbol and date range to examine the price (adjusted for splits and dividends) trend and monthly return."),
      helpText("Information source is from yahoo finance."),
      
      textInput("symb", "Symbol", "AAPL"),
      
      dateRangeInput("dates", 
                     "Date range",
                     start = "2013-01-01", 
                     end = as.character(Sys.Date())),
      
      
      br(),
      br()
      
      
      
      
      ),
    
    mainPanel(tabsetPanel(type = "tabs", 
                          tabPanel("Plot", plotOutput("plot")),  
                          tabPanel("Monthly Return Table", tableOutput("table"))
    )
  )
)))