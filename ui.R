library(shiny)

shinyUI( 
  pageWithSidebar(
    # Application title 
    headerPanel("MPG (Miles/(US) Gallon) Prediction"),
    sidebarPanel(
      numericInput('wt', 'Weight lb/1000 [1.0,6.0]', 3.3, min = 1.0, max = 6.0), 
      numericInput("qsec", "1/4 mile time [10.0, 25.0]", 17.7, min= 10.0, max=25.0),
      selectInput("am", "Transmission  (Automatic=0, Manual=1)",
                         c("Automatic" = "0", "Manual" = "1"),
                         selected="0"),
      submitButton('Submit')
    ), 
    mainPanel(
      h3 ('Results of prediction'),
      h4 ('You entered'),
      verbatimTextOutput("owt"),
      h4 ('You entered'),
      verbatimTextOutput("oqsec"),
      h4 ('You entered'),
      verbatimTextOutput("oam"),
      h4 ('Which resulted in a prediction of mpg as'),
      verbatimTextOutput("prediction"),
      h3 ('README'),
      p ('1. Weight (lb/1000) must be a real number within [1.0, 6.0].'),
      p ('2. 1/4 mile time must be a real number in the range of [10.0, 25.0].'),
      p ('3. The prediction is based on a linear model `mpg ~ wt + qsec + am`,'),
      p ('which is selected by applying stepAIC on initial model `mpg ~.` .'),
      p ('4. The summary of the fitted linear model is:'),
      verbatimTextOutput("modelSummary")
    ) 
  )
)