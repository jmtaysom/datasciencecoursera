library(shiny)

roll.stats <- function(n) {
  stats = list()
  for(i in 1:6){
    stat <- sum(sort(sample(1:6,n, replace = TRUE),decreasing = TRUE)[1:3])
    stats = c(stats, stat)
  }
  return(stats)
}

# Define server logic required to roll a set of dice and return character stats
shinyServer(
  function(input, output) {
#     output$stat1 <- renderPrint({sum(sort(sample(1:6,input$dice, replace = TRUE),decreasing = TRUE)[1:3])})
#     output$stat2 <- renderPrint({sum(sort(sample(1:6,input$dice, replace = TRUE),decreasing = TRUE)[1:3])})
#     output$stat3 <- renderPrint({sum(sort(sample(1:6,input$dice, replace = TRUE),decreasing = TRUE)[1:3])})
#     output$stat4 <- renderPrint({sum(sort(sample(1:6,input$dice, replace = TRUE),decreasing = TRUE)[1:3])})
#     output$stat5 <- renderPrint({sum(sort(sample(1:6,input$dice, replace = TRUE),decreasing = TRUE)[1:3])})
#     output$stat6 <- renderPrint({sum(sort(sample(1:6,input$dice, replace = TRUE),decreasing = TRUE)[1:3])})
    char_stats <- reactive ({
      if(input$button == 0)
      {  
        return()
      }  
      isolate({   
        n <- input$dice
        roll.stats(n)
        
      })
      
    })
    output$stat1 <- renderPrint({as.numeric(char_stats()[1])})
    output$stat2 <- renderPrint({as.numeric(char_stats()[2])})
    output$stat3 <- renderPrint({as.numeric(char_stats()[3])})
    output$stat4 <- renderPrint({as.numeric(char_stats()[4])})
    output$stat5 <- renderPrint({as.numeric(char_stats()[5])})
    output$stat6 <- renderPrint({as.numeric(char_stats()[6])})
  
})

