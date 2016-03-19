# this ui.R creates an input selector to choose one of the cars 
# predictors from the mtcars package
# the page also include a submit button input to allow controlling the submission 
# of the selection.
# the main panel of this ui page displays the output plot from the server 
# based on the input made.

require(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Miles Per Gallon(MPG) Predictors"),
    sidebarPanel(
        helpText("Note: select from the options below one or more parameters",
                 "to use. The selected parameters will be plotted against the",
                 "MPG. Each of the parameters is displayed using a different color"),
        checkboxGroupInput("params","Parameters",choices=
                         c("disp Displacement (cu.in.)"="disp",
                           "hp   Horse Power"="hp",
                           "drat Rear axle ratio"="drat",
                           "wt   Weight (lb/1000)"="wt",
                           "qsec 1/4 mile time"="qsec",
                           "vs   V/S"="vs",
                           "am   Transmission (0 = automatic, 1 = manual)"="am",
                           "carb Number of carburetors"="carb",
                           "gear Number of forward gears"="gear")),
        submitButton("Update Graph")
    ),
    mainPanel(
        htmlOutput('newPlot')
    )
))