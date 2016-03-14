# this ui.R creates an input selector to choose one of the cars 
# predictors from the mtcars package
# the page also include a submit button input to allow controlling the submission 
# of the selection.
# the main panel of this ui page displays the output plot from the server 
# based on the input made.

library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Cars MPG Predictors"),
    sidebarPanel(
         selectInput("carsParamID","Select Cars Param:",
                      c(
                        "Horse Power" = "hp",
                        "Cylinders" = "cyl",
                        "Gears" = "gear")),
         submitButton("Update Graph")
        ),
    mainPanel(
        plotOutput('newPlot')
        )
    ))