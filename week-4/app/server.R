#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(randomForest)
library(caret)

load("model.rda")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  pred <- reactive({
    t(predict(fit, data.frame(ABV=c(input$abv),IBU=c(input$ibu),Color=c(input$color)), type="prob"))
  })
  
  output$prediction <- renderText({
    pred <- pred()
    names(pred[order(-pred),])[1]
  })
  
  output$distPlot <- renderPlot({
    pred <- pred()
    barplot(pred[order(-pred),][1:3], col="#428bca", border = NA, ylab = "Probability")
  })
})
