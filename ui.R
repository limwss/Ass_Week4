#
#

library(shiny)

# Define UI for application that calculates interest of credit card amount spent
#

shinyUI(fluidPage(
  titlePanel("Credit Card Interest Calculator"),
  sidebarLayout(
    sidebarPanel(
      numericInput("Amount",label = h3("Card Amount Spent"), value=100),
      dateRangeInput("dt", label = h3("Date range")),  
      sliderInput("rate", label = h3("Interest Rate(9 to 15 %)"), min = 9, 
                  max = 15, value = 0, step=1),
      selectInput("basis", label = h3("Day Count Convention"), 
                  choices = list("30/360" = 360, "30/365" = 365), 
                  selected = 1),
      submitButton("Submit")
      
    ),
    mainPanel(
      h3("Interest Calculated:"),
      h3(textOutput("interest"))
    )
  )
))



