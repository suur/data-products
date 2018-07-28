#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("BrewTree"),
  
  h3("Predicting beer style from ABV, bitterness and color"),
  
  p("Use the sliders on the left to find your perfect match."),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("abv", "Alcohol by Volume", min = 0, max = 12, value = 6, step = 0.1, post = "%"),
       sliderInput("ibu", "Bitterness", min = 0, max = 150, value = 60, post=" IBU"),
       sliderInput("color", "Color", min = 0, max = 50, value = 20, post=" SRM"),
       h4("Beer color scale"),
       img(src="srm.jpeg", style="width:100%")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      h4("We predict you'd like:", span(textOutput("prediction"), style="display:inline-block;color:#428bca"))
    )
  )
))
