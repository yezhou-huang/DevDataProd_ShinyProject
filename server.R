library(shiny)
library(datasets)
mpgData <- mtcars
mpgData$am <- factor(mpgData$am,levels=c(0,1)) 


# Model chosed by stepAIC from initial model mpg ~.
fit <- lm(mpg ~ wt + qsec + am, data=mpgData)
# Prediction
mpgPrediction <- function(df) predict(fit, newdata=df)[[1]]

shinyServer(
  function(input, output) {
    output$owt <- renderPrint({input$wt})
    output$oqsec <- renderPrint({input$qsec})
    output$oam <- renderPrint({input$am})
    predictedValue <- reactive({
      mpgPrediction(data.frame(wt=input$wt, qsec=input$qsec, am=input$am))
      })
    output$prediction <- renderPrint({predictedValue()})
    output$modelSummary <- renderPrint({summary(fit)})
  }
)
