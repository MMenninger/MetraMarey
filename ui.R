library(shiny)
library(ggplot2)
#setwd("~/TransitData/GTFS/MetraMarey")
marey <- read.csv("MetraMarey.csv", header=T, stringsAsFactors=FALSE)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Metra"),
    plotOutput("plot") ,
    hr(), 
    
    fluidRow(
      column(5, 
             selectInput("line", "Line:", 
                         choices=unique(marey$route_id), 
                         selected = "NCS"), 
             helpText("Select a Metra line. Width reflects number of AM passengers.Note there are a few errors around midnight. Also, I am open to help to improve my axis lables.")),
      step=500, round=0   #Not sure what these number do, but wont run without them    
      )
    )
    
      )
     