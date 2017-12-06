# this is server functions which calculates the credit card interest for amount spent
# user is allowed to specify interest 


library(shiny)
shinyServer(function(input,output) {
  output$interest <- reactive({
    d<-difftime(input$dt[2], input$dt[1], units = "days")
    y<-d/as.numeric(input$basis)
    round(input$Amount * y * input$rate/100,2)
    }) 
})


