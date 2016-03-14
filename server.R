# this server function gets the selected predictor and uses it to plot the
# MPG against the selected predictor. 
# the ouptput is then rendered to the output.

data(mtcars)
library("ggplot2")

shinyServer(
    function(input , output){
        df <- data.frame(mpg=mtcars$mpg
                         ,cyl=as.factor(mtcars$cyl)
                         ,hp=mtcars$hp
                         ,gear=mtcars$gear
                         )
        p1 <- ggplot(df)+geom_point(aes(x=get(input$carsParamID),y=mpg)) 
        output$newPlot<-renderPlot(p1)
    }
    )