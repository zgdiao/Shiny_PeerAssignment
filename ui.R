#
# This application generates a normal distribution curve on demand.
# The user is able to set the mean and standard deviation of the normal distribution.
# Furthermore, the color and width of the curve is configurable.
# A standard normal distribution curve is displayed by default.
#

library(shiny)

# Define UI for application that draws a plot
shinyUI(fluidPage(

    # Application title
    titlePanel("Week 4 Assignment: My Shiny Application"),

    # Sidebar for generating a normal distribution curve
    sidebarLayout(
        sidebarPanel(
            h2("Generate a Normal Distribution Curve"),
            sliderInput("mean",
                        "Set the Mean:",
                        min = -10,
                        max = 10,
                        value = 0),
            sliderInput("sd",
                        "Set the Standard Deviation:",
                        min = 0,
                        max = 5,
                        value = 1),
            h2("Configure the Curve"),
            selectInput(
                "col", 
                h3("Choose the Color"), 
                choices = list("dark green" = "darkgreen",
                               "dark magenta" = "darkmagenta",
                               "dark orange" = "darkorange",
                               "dark orchid" = "darkorchid",
                               "dark red" = "darkred"
                               ), selected = "darkgreen"
            ),
            numericInput(
                "lwd",
                h3("Set the Width"),
                value = 2,
                step = 1,
                min = 1,
                max = 5
            ),
            h3("Display a Standard Normal Distribution Courve?"),
            checkboxInput(
                "displayND",
                "yes",
                value = TRUE
            )
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("ndPlot")
        )
    )
))
