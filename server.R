#
# This is the server logic of a Shiny web application.
#

library(shiny)

# Define server logic required to draw a plot
shinyServer(function(input, output) {

    output$ndPlot <- renderPlot({
        # Create a sequence of numbers between -10 and 10 incrementing by 0.1.
        x <- seq(-10, 10, by = .1)
        
        # Set the mean and standard deviation.
        y <- dnorm(x, mean = input$mean, sd = input$sd)
        # draw a plot with the specified line color and width
        plot(x, y, type = "l", col= input$col, lwd = input$lwd, xlim = c(-10,10), ylim = c(0, .4), ylab = "Density", xlab = "Values")
        
        # Draw a plot for the standard normal distribution.
        if(input$displayND){
            y0 <-  dnorm(x, mean = 0, sd = 1)
            lines(x, y0, lwd=1, col="gray", type = "l", lty = 2, xlim = c(-10,10))
        }

    })

})
