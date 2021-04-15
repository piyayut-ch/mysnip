library(shiny)
library(bs4Dash)


navbar = bs4DashNavbar()
sidebar = bs4DashSidebar(
  skin = "dark",
  status = "primary",
  title = "NABC",
  brandColor = "navy",
  url = "https://www.nabc.go.th",
  src = "https://adminlte.io/themes/AdminLTE/dist/img/user2-160x160.jpg",
  elevation = 3,
  opacity = 0.8,
  bs4SidebarUserPanel(
    img = "https://image.flaticon.com/icons/svg/1149/1149168.svg",
    text = "Welcome Onboard!"
  ),
  bs4SidebarMenu(
    bs4SidebarHeader("Header 1"),
    bs4SidebarMenuItem(
      "Item 1",
      tabName = "item1",
      icon = "sliders"
    ),
    bs4SidebarMenuItem(
      "Item 2",
      tabName = "item2",
      icon = "id-card"
    )
  )
)

controlbar = bs4DashControlbar()

footer = bs4DashFooter()

body = bs4DashBody()

# ui
ui <- bs4DashPage(
  title = "แดชบอร์ดสินค้าเกษตร",
  old_school = FALSE,
  sidebar_min = TRUE,
  sidebar_collapsed = FALSE,
  controlbar_collapsed = FALSE,
  controlbar_overlay = TRUE,
  navbar = navbar,
  sidebar = sidebar,
  body = body,
  controlbar = controlbar,
  footer = footer
)


# server-side
server <- function(input, output, session){
}


# combine
shinyApp(ui, server)
# shiny::runApp()