library(shiny)
library(shinydashboard)
library(leaflet)

dashboardPage(
  skin = c("yellow") ,
  dashboardHeader(title = "Philadelphia Indego Bike", titleWidth = 300),
  dashboardSidebar(
    sidebarMenu(
      menuItem("About", tabName = "about", icon = icon("bicycle")),
      menuItem("Interactive Map", tabName = "map", icon = icon("hand-pointer-o")),
      menuItem("When did it start?", tabName = "when", icon = icon("calendar-plus-o")),
      menuItem("Where does it go?", tabName = "where", icon = icon("map-o")),
      menuItem("How far does it cover?", tabName = "far", icon = icon("map")),
      menuItem("What does its Twitter say?", tabName = "twitter", icon = icon("twitter")),
      menuItem("On a particular date?", tabName = "graphs1", icon = icon("calendar")),
      menuItem("Take a closer look", tabName = "look", icon = icon("plus")),
      menuItem("At each station?", tabName = "graphs2", icon = icon("location-arrow")),
      menuItem("Source Code", href = "https://github.com/Echohoho/final-project", icon = icon("window-maximize"))
    )
    ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "map",
              fluidRow(
                column(width = 8,
                       box(width = NULL,
                           leafletOutput("indego_map", height = 500))
                ),
                column(width = 3,
                       box(width = NULL,
                           dateRangeInput("date1", "Select dates to visualize.",
                                          start = "2017-01-01", end = "2017-03-31",
                                          min = min(indego$indegodate), max = max(indego$indegodate))
                       ),
                       box(width = NULL,
                           h3("Total Trips"),
                           h4(textOutput("total_trips"))),
                       box(width = NULL,
                           h3("Most Popular Station"),
                           h4(textOutput("most_popular_station")))
                )
              )
      ),
      tabItem(tabName = "graphs1",
              fluidRow(
                column(width = 12,
                       box(width = NULL,
                           plotOutput("daily_plot")))
              ),
              fluidRow(
                column(width = 3,
                       box(width = NULL,
                           dateRangeInput("date2", "Select dates to visualize.",
                                          start = "2017-01-01", end = "2017-03-31",
                                          min = min(indego$indegodate), max = max(indego$indegodate))
                       )
                )
              )),
      tabItem(tabName = "graphs2",
              fluidRow(
                column(width = 12,
                       box(width = NULL,
                           plotOutput("stat_plot_start"))),
                column(width = 12,
                       box(width = NULL,
                           plotOutput("stat_plot_end")))
              )
            ),
      
      tabItem(tabName = "about",
              fluidRow(
                column(width = 6,
                       box(width = NULL,
                           includeMarkdown("about.md")
                       ))
              )
      ),
      tabItem(tabName = "when",
              fluidRow(
                column(width = 12,
                       box(width = NULL,
                           includeMarkdown("when.md")
                       ))
              )
      ),
      tabItem(tabName = "where",
              fluidRow(
                column(width = 12,
                       box(width = NULL,
                           includeMarkdown("where.md")
                       ))
              )
      ),
      tabItem(tabName = "twitter",
              fluidRow(
                column(width = 12,
                       box(width = NULL,
                           includeMarkdown("twitter.md")
                       ))
              )
      ),
              tabItem(tabName = "look",
                      fluidRow(
                        column(width = 12,
                               box(width = NULL,
                                   includeMarkdown("look.md")
                               ))
                      )
      ),
      tabItem(tabName = "far",
              fluidRow(
                column(width = 12,
                       box(width = NULL,
                           includeMarkdown("far.md")
                       ))
              )
      )
    )
  )
)