library(shiny)

# Define UI for application that rolls a character for D&D
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Roll a Character"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      radioButtons("dice", "Number of Dice:",
                   selected = 4,
                   c("3d6" = 3,
                     "4d6" = 4,
                     "5d6" = 5)),
      actionButton('button','Roll?')
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3('Character Stats'),
      verbatimTextOutput("stat1"),
      verbatimTextOutput("stat2"),
      verbatimTextOutput("stat3"),
      verbatimTextOutput("stat4"),
      verbatimTextOutput("stat5"),
      verbatimTextOutput("stat6")
    )
  )
))