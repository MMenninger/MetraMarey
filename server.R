library(shiny)
library(ggplot2)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Fill in the spot we created for a plot
  output$plot <- renderPlot({
    
    # Format Data
    marey <- read.csv("MetraMarey.csv", header=T)
    marey$arrival_time <-  as.POSIXlt(marey$arrival_time)

    route <- input$line
    service <- "S1"
    
    prep.data <- subset(marey, route_id==route & service_id==service)
    chart.data <-prep.data[order(prep.data$arrival_time),]
    
    # Render a lineplot
    ggplot(chart.data, aes(x = arrival_time, y = mile_post)) + 
      geom_path(aes(size = load, colour = direction, group= run), lineend="round") +
      ggtitle(route) +
      geom_text(aes(label = load),size = 2) +
      theme(axis.text.x=element_text(angle=-90))
  })
})
