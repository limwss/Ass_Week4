Week4 Assignment Presentation
========================================================
author: Lim WS
date: 6 December 2017
autosize: true

Introduction
========================================================
The course project has 2 parts:

1) Creating a web application using Shiny

2) Creating a presentation using either Slidify or RStudio Presenter.

Note:This presentation is created using RStudio Presenter.


Description
========================================================

The Shiny App calculates the credit card interest of card amount spent, rate and date range input by user. 

- Amount is the card amount spent.
- Rate - annual interest rate in percentage with a range from 9 to 15% can be selected by user via slider.
- Date range - specifies the period within which the interest is to be computed.
- Basis - specifies the number of days to be considered in an year.

The working App can be accessed at https://limwss.shinyapps.io/WS_Dev_Prod_Ass4/

UI Code
========================================================


```r
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
```

<!--html_preserve--><div class="container-fluid">
<h2>Credit Card Interest Calculator</h2>
<div class="row">
<div class="col-sm-4">
<form class="well">
<div class="form-group shiny-input-container">
<label for="Amount">
<h3>Card Amount Spent</h3>
</label>
<input id="Amount" type="number" class="form-control" value="100"/>
</div>
<div id="dt" class="shiny-date-range-input form-group shiny-input-container">
<label class="control-label" for="dt">
<h3>Date range</h3>
</label>
<div class="input-daterange input-group">
<input class="input-sm form-control" type="text" data-date-language="en" data-date-week-start="0" data-date-format="yyyy-mm-dd" data-date-start-view="month"/>
<span class="input-group-addon"> to </span>
<input class="input-sm form-control" type="text" data-date-language="en" data-date-week-start="0" data-date-format="yyyy-mm-dd" data-date-start-view="month"/>
</div>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" for="rate">
<h3>Interest Rate(9 to 15 %)</h3>
</label>
<input class="js-range-slider" id="rate" data-min="9" data-max="15" data-from="0" data-step="1" data-grid="true" data-grid-num="6" data-grid-snap="false" data-prettify-separator="," data-prettify-enabled="true" data-keyboard="true" data-keyboard-step="16.6666666666667" data-data-type="number"/>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" for="basis">
<h3>Day Count Convention</h3>
</label>
<div>
<select id="basis"><option value="360">30/360</option>
<option value="365">30/365</option></select>
<script type="application/json" data-for="basis" data-nonempty="">{}</script>
</div>
</div>
<div>
<button type="submit" class="btn btn-primary">Submit</button>
</div>
</form>
</div>
<div class="col-sm-8">
<h3>Interest Calculated:</h3>
<h3>
<div id="interest" class="shiny-text-output"></div>
</h3>
</div>
</div>
</div><!--/html_preserve-->

Server Code
========================================================


```r
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
```
