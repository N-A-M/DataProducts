# this server function gets the selected predictor and uses it to plot the
# MPG against the selected predictor. 
# the ouptput is then rendered to the output.

data(mtcars)
require(shiny)
require("googleVis")

shinyServer(
    function(input , output){
        df <- data.frame(mpg=mtcars$mpg
                         ,disp=mtcars$disp
                         ,hp=mtcars$hp
                         ,drat=mtcars$drat
                         ,wt=mtcars$wt
                         ,qsec=mtcars$qsec
                         ,vs=mtcars$vs
                         ,am=mtcars$am
                         ,carb=mtcars$carb
                         ,gear=mtcars$gear
        )
        sdf<-reactive({
            d<-df[,c("mpg",input$params),drop=FALSE]
            return( as.data.frame(d))
        })
        output$newPlot <- renderGvis({
            validate(need(input$params,'Check at least one parameter.'))
            gvisScatterChart(
                sdf(), 
                options=list(
                    width=800
                    ,height=550 
                    ,trendlines="{0: { type: 'exponential'}}"))
        }) 
        
    }
)