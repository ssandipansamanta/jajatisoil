library(shiny)
library("shinydashboard")

ui <- dashboardPage(
  dashboardHeader(title = "Arsenic Prediction in Rice Grain"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Prediction for rice grain Arsenic", tabName = "predictionTab")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "predictionTab",
        fluidRow(
          box(
            title = "Input Soil Parameters",
            helpText("Enter the values for each variable:"),
            sliderInput("OC", "OC % (Organic Carbon, Walkley and Black method):", 
                        value = 0.35, min = 0.35, max = 1.25, step = 0.01),
            sliderInput("pH","Soil pH:", value = 6.00, min = 6.00, max = 8.2, step = 0.01),
            sliderInput("AvP","AvP mg/kg (Available Phosphorus, Olsen method):", 
                        value = 3.5, min = 3.5, max = 20, step = 0.01),
            sliderInput("AvFe", "AvFe mg/kg (Available Iron, DTPA extractable):", 
                        value = 4.5, min = 4.5, max = 20, step = 0.01),
            sliderInput("BAs", "BAs mg/kg (Biovailable Arsenic):", 
                        value = 0.25, min = 0.25, max = 8.0, step = 0.01),
            actionButton("predictBtn", "Predict", icon("play"))
          )
        ),
        fluidRow(
          box(
            title = "Prediction:",
            verbatimTextOutput("prediction")
          )
        )
      )
    )
  )
)
