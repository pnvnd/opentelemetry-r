library(openmetrics)
library(plumber)

register_default_metrics()
srv <- plumber::plumb("plumber.R")
srv <- register_plumber_metrics(srv)
srv$run(host="0.0.0.0", port=c(8000))