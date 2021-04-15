library(shiny)
library(leaflet)
library(mapthai)
library(tidyverse)

set.seed(112)
tha1 <- tha1 %>%
  mutate(x = rnorm(77))

ui <- fluidPage(
  fluidRow(
    column(8, leafletOutput("map_tha1", width = "100%", height = "800px")),
    column(4, 
      tags$h2('Object Events:'),
      tags$h4('click:'),
      tableOutput('click'),
      tags$h4('mouseover:'),
      tableOutput('mouseover'),
      tags$hr(),
      tags$h2('Map Events:'),
      tags$h4('click:'),
      tableOutput('mapclick'),
      tags$h4('bound:'),
      tableOutput('mapbounds'), 
      tags$h4('center:'),
      tableOutput('mapcenter'),
      tags$h4('zoom:'),
      textOutput('mapzoom'),
    )
  )
)


server <- function(input, output, session) {
  
  pal <- colorNumeric("YlOrRd", domain = tha1$x)
  
  output$map_tha1 <- renderLeaflet({
    leaflet(tha1) %>%
      setView(lng = 100, lat = 13, zoom = 6) %>%
      addProviderTiles(providers$CartoDB.Voyager) %>%
      addPolygons(
        layerId = tha1$adm1_en,
        fillColor = ~pal(tha1$x),
        weight = 1,
        opacity = 1,
        color = "white",
        dashArray = "0",
        fillOpacity = 0.7,
        highlight = highlightOptions(
          weight = 4,
          color = "black",
          dashArray = "",
          fillOpacity = 0.7,
          bringToFront = TRUE
        )
      )
  })

  # Show the input values of the callbacks
  output$click     <- renderTable(data.frame(input$map_tha1_shape_click))
  output$mouseover <- renderTable(data.frame(input$map_tha1_shape_mouseover))
  output$mapclick  <- renderTable(data.frame(input$map_tha1_click))
  output$mapbounds <- renderTable(data.frame(input$map_tha1_bounds))
  output$mapcenter <- renderTable(data.frame(input$map_tha1_center))
  output$mapzoom   <- renderText(paste(input$map_tha1_zoom))
}
                                   
shinyApp(ui, server)                               
# shiny::runApp("leaflet.R", display.mode = "auto")