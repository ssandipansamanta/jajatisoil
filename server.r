library(shiny)
library("caret")
server <- function(input, output) {
  
  output$user_input <- renderTable({
    data.frame(
      OC = input$OC,
      pH=input$pH,
      AvP=input$AvP,
      AvFe = input$AvFe,
      BAs = input$BAs
    )
  })  
  
  
  
  output$soil_condition <- renderText({
    new_data <- data.frame(
      OC = input$OC,
      pH=input$pH,
      AvP=input$AvP,
      AvFe = input$AvFe,
      BAs = input$BAs
    )
    RF <- readRDS('model.RData')
    model_prediction <- predict(RF, newdata = new_data, type = "raw")
    if (model_prediction == "<MTC") {
      soil_condition = HTML('<p> <ol> Rice grain Arsenic Content: <span style="color:green" > <b> LESS </b> </span> than 350 μg/kg as per Codex recommendation </ol> </p>')
    } else if (model_prediction == ">MTC") {
      soil_condition = HTML('<p> <ol> Rice grain Arsenic Content: <span style="color:red" > <b> MORE </b> </span>than 350 μg/kg as per Codex recommendation </ol> </p>')
    } else {
      soil_condition = 0
    }
  })
}
