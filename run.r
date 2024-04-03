library(shiny)

port <- Sys.getenv('PORT')
# port <- 6706
shiny::runApp(
  appDir = getwd(),
  host = '0.0.0.0',
  port = as.numeric(port)
)
