library(shiny)
library(bs4Dash)

vbox1 <- bs4ValueBox(
  value = 150,
  subtitle = "New orders",
  status = "primary",
  icon = "shopping-cart",
  href = "#"
)

vbox2 <- bs4ValueBox(
  elevation = 4,
  value = "53%",
  subtitle = "New orders",
  status = "danger",
  icon = "cogs"
)

vbox3 <- bs4ValueBox(
  value = "44",
  subtitle = "User Registrations",
  status = "warning",
  icon = "sliders"
)

vbox4 <- bs4ValueBox(
  value = "53%",
  subtitle = "Bounce rate",
  status = "success",
  icon = "database"
)

box1 <- bs4Box(
  height = "400px",
  title = "Box 1"
)

box2 <- bs4Box(
  height = "400px",
  title = "Box 2"
)


tab1 <- bs4TabItem(
  tabName = "item1",
  h4("Value Boxes"), 
  fluidRow(vbox1, vbox2, vbox3, vbox4),
  fluidRow(box1, box2)
)

tab2 <- bs4TabItem(
  tabName = "item2",
  h4("Value Boxes"), 
  fluidRow(vbox1, vbox2)
)

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
      "ภาพรวม",
      tabName = "item1"
#       icon = "sliders"
    ),
    bs4SidebarMenuItem(
      "การผลิต",
      tabName = "item2"
#       icon = "id-card"
    ),
    bs4SidebarMenuItem(
      "ราคา",
      tabName = "price"
#       icon = "id-card"
    ),
    bs4SidebarMenuItem(
      "การค้า",
      tabName = "trade"
#       icon = "id-card"
    )
  )
)

controlbar = bs4DashControlbar()

footer = bs4DashFooter()

body = bs4DashBody(
  bs4TabItems(tab1, tab2)
)

# ui
ui <- bs4DashPage(
  title = "แดชบอร์ดสินค้าเกษตร",
  old_school = FALSE,
  sidebar_min = TRUE,
  sidebar_collapsed = FALSE,
  controlbar_collapsed = TRUE,
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