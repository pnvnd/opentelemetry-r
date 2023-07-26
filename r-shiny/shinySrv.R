library(openmetrics)
library(shiny)
options(shiny.port = 8000)

register_default_metrics()
app <- shiny::shinyApp(ui = ui, server = server)
app <- register_shiny_metrics(app)
app

