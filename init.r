my_packages = c("shiny", "caret", "shinydashboard", "shinyjs")

install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p, repos = "https://cloud.r-project.org")
  }
}

invisible(sapply(my_packages, install_if_missing))
