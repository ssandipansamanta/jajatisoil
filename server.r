library(shiny)
library("caret")
server <- function(input, output) {  
  RF <- readRDS('model.RData')
  # Perform prediction based on user inputs
  output$prediction <- renderPrint({
    req(input$predictBtn)
    new_data <- data.frame(
      OC = input$OC,
      pH=input$pH,
      AvP=input$AvP,
      AvFe = input$AvFe,
      BAs = input$BAs
    )
    print(new_data)
    prediction <- predict(RF, newdata = new_data, type = "raw")
    if (prediction == ">MTC") {
      "Rice grain Arsenic Content: MORE than 350 μg/kg as per Codex recommendation"
    } else if (prediction == "<MTC") {
      "Rice grain Arsenic Content: LESS than 350 μg/kg as per Codex recommendation"
    } else {
      "Grain Arsenic Content: Unknown"
    }
  })
}
