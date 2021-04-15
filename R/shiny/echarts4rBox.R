library(shiny)
library(echarts4r)

ui <- fluidPage(
  fluidRow(
    column(3, echarts4rBoxOutput("box1"))
  )
)

server <- function(input, output) {
  output$box1 <- renderEcharts4rBox({
    echarts4rBox(
      cars, 
      speed, 
      dist, 
      text = "Cars",
      subtext = "Hi",
      type = "bar"
#       step = "middle"
    )
  })
}

shinyApp(ui, server)

# shiny::runApp("echarts4rBox.R")