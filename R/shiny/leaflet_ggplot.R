library(shiny)
library(sf)
library(leaflet)
library(mapthai)
library(tidyverse)

set.seed(112)
tha1 <- tha1 %>%
  mutate(val = rnorm(77) + 3)

tha1_df <- tha1 %>%
  mutate(is_highlight = "no") %>%
  st_drop_geometry()


plot_bar_highlight <- function(data, highlight = NULL) {

  data <- data %>%
    mutate(is_highlight = ifelse(adm1_en == highlight, "yes", "no"))

  ggplot(data, aes(x = reorder(adm1_en, val), y = val, fill = is_highlight)) +
    geom_col() + 
    scale_fill_manual( values = c("yes" = "tomato", "no" = "gray") ) +
    coord_flip() + 
    labs(x = "", y = "") +
    theme(legend.position = "none")
}



ui <- fluidPage(
  fluidRow(
    column(8, 
      tags$h3("Map:"),
      leafletOutput("map_tha1", width = "100%", height = "800px")),
    column(4, 
      tags$h3("Bar Plot:"),
      plotOutput("bar_tha1", width = "100%", height = "800px")
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
        fillColor = ~pal(tha1$val),
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
  
  output$bar_tha1 <- renderPlot({
    if(is.null(input$map_tha1_shape_click$id)) {
      adm1_select <- "TH34"
    } else {
      adm1_select <- input$map_tha1_shape_click$id
    }    
    plot_bar_highlight(tha1_df, adm1_select)
  })

  # Show the input values of the callbacks
#   output$click     <- renderTable(data.frame(input$map_tha1_shape_click))
#   output$mouseover <- renderTable(data.frame(input$map_tha1_shape_mouseover))
#   output$mapclick  <- renderTable(data.frame(input$map_tha1_click))
#   output$mapbounds <- renderTable(data.frame(input$map_tha1_bounds))
#   output$mapcenter <- renderTable(data.frame(input$map_tha1_center))
#   output$mapzoom   <- renderText(paste(input$map_tha1_zoom))
}

shinyApp(ui, server)

# shiny::runApp("leaflet_ggplot.R", display.mode = "auto")
