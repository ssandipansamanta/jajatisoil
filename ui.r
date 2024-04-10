library(markdown)
library(shiny)
library(shinyjs)
library(shinydashboard)
library(shinyWidgets)

ui <-
shinyUI(
  navbarPage(" ",
             
             tabPanel(title = "As Prediction",
                      fluidRow(
                        column(width = 1,
                               tags$small(
                                 " "
                               )
                        ),
                        column(width = 2,
                               wellPanel(style ="height:50px",
                                 h4(id="organic_carbon", "Organic Carbon (OC%)"),
                                 tags$style(HTML("#organic_carbon{color: blue;font-size: 18px;font-style: bold;}")),
                                 sliderInput("OC", label = "", value = 0.35, min = 0.35, max = 1.25, step = 0.01), style = "padding: 5px;",
                               ),
                               wellPanel(style ="height:50px",
                                 h4(id="soil_ph", "Soil pH"),
                                 tags$style(HTML("#soil_ph{color: blue;font-size: 18px;font-style: bold;}")),
                                 sliderInput("pH", label = "",  value = 6.00, min = 6.00, max = 8.2, step = 0.01), style = "padding: 5px;",
                               ),
                               wellPanel(style ="height:50px",
                                 h4(id="available_phosphorus", "Available Phosphorus(mg/kg)"),
                                 tags$style(HTML("#available_phosphorus{color: blue;font-size: 18px;font-style: bold;}")),
                                 sliderInput("AvP", label = "", value = 3.5, min = 3.5, max = 20, step = 0.01), style = "padding: 4px;",
                               ),
                               wellPanel(style ="height:50px",
                                 h4(id="available_iron", "Available Iron(mg/kg)"),
                                 tags$style(HTML("#available_iron{color: blue;font-size: 18px;font-style: bold;}")),
                                 sliderInput("AvFe", label = "", value = 4.5, min = 4.5, max = 20, step = 0.01), style = "padding: 4px;",
                               ),
                               wellPanel(style ="height:50px",
                                 h4(id="bio_available_arsenic", "Plant available Arsenic(mg/kg)"),
                                 tags$style(HTML("#bio_available_arsenic{color: blue;font-size: 18px;font-style: bold;}")),
                                 sliderInput("BAs", label = "", value = 0.25, min = 0.25, max = 8.0, step = 0.01), style = "padding: 4px;"
                                
                               )
                        ),
                        column(width = 5,
                               wellPanel(style ="height:175px",
                                  h4(id="user_input_section", "User Inputs:"),
                                  tags$style(HTML("#user_input_section{color: blue;font-size: 18px;font-style: bold;}")),
                                  tableOutput("user_input")
                                  ),
                                wellPanel(style ="height:175px",
                                  h4(id="prediction_section", "Prediction Based on Machine Learning Model:"),
                                  tags$style(HTML("#prediction_section{color: blue;font-size: 18px;font-style: bold;}")),
                                  uiOutput("soil_condition")
                                  ),
                                wellPanel(style ="height:175px",
                                           h4(id="model_fitting", "Recommendation:"),
                                           tags$style(HTML("#model_fitting{color: blue;font-size: 18px;font-style: bold;}"))
                                           # tableOutput("user_input")
                                ),
                                wellPanel(style ="height:175px",
                                   h4(id="data_set", "Training Data Set"),
                                   tags$style(HTML("#data_set{color: blue;font-size: 18px;font-style: bold;}"))
                                   # uiOutput("soil_condition")
                                ),
                                wellPanel(style ="height:175px",
                                   h4(id="feature_importance", "Feature Importance"),
                                   tags$style(HTML("#feature_importance{color: blue;font-size: 18px;font-style: bold;}"))
                                   # uiOutput("soil_condition")
                                )
                        ),
                        fluidRow(
                            column(width = 3,
                                 wellPanel(style ="height:950px",
                                           h4(id="help", "At a glance:"),
                                           tags$style(HTML("#help{color: blue;font-size: 18px;font-style: bold;}")),
                                           includeHTML("synopsis.html")
                                 )  
                               )
                               
                        )
                                 
                        
                      
                   )
             ),
             # tabPanel("Synopsis",
             #          fluidRow(
             #            column(1,
             #                   tags$small(
             #                     " "
             #                   )
             #            ),
             #            column(10,
             #                   wellPanel(
             #                     h4(id="synopsis", "Overview"),
             #                     tags$style(HTML("#synopsis{color: blue;font-size: 20px;font-style: bold;text-align:center}")),
             #                     includeHTML("synopsis.html")
             #                   )
             #            )
             #          )
             # ),
             tabPanel("Future Work",
                      fluidRow(
                        column(1,
                               tags$small(
                                 " "
                               )
                        ),
                        column(10,
                               wellPanel(
                                 h4(id="synopsis", "Roadmap"),
                                 tags$style(HTML("#synopsis{color: blue;font-size: 20px;font-style: bold;text-align:center}")),
                                 includeHTML("future_work.html")
                               )
                        )
                      )
             ),
             tabPanel("Reference",
                      fluidRow(
                        column(1,
                               tags$small(
                                 " "
                               )
                        ),
                        column(10,
                               wellPanel(
                                 h4(id="reference", "Reference"),
                                 tags$style(HTML("#reference{color: blue;font-size: 20px;font-style: bold;text-align:center}")),
                                 includeHTML("reference.html")
                               )
                        )
                      )
             ),
             # tabPanel("Reference",tags$iframe(style="height:800px; width:100%; scrolling=yes", src="JEQ.pdf")),
             tabPanel("Contact",
                      fluidRow(
                        column(2,tags$small(" ")),
                        column(8,wellPanel(includeHTML("about_us.html"))),
                        column(2,tags$small(" ")))
             ),
             tabPanel("Licence",
                      fluidRow(
                        column(1,tags$small(" ")),
                        column(10,wellPanel(h4(id="licence", "LICENCE"),tags$style(HTML("#licence{color: blue;font-size: 20px;font-style: bold;text-align:center}")),includeHTML("licence.html")))
                      )
             )
  )
)
