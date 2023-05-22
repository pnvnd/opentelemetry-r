library(openmetrics)

batch_duration <- gauge_metric("batch_duration_seconds", "Duration of batch job in seconds.", unit="seconds", labels = c("path"))

start <- Sys.time()
source("job1.R")
elapsed <- unclass(difftime(Sys.time(), start, units="secs"))
batch_duration$set(elapsed, path="job1.R")
push_to_gateway("http://localhost:9091", job="batch-job", instance="windows")

start <- Sys.time()
source("job2.R")
elapsed <- unclass(difftime(Sys.time(), start, units="secs"))
batch_duration$set(elapsed, path="job2.R")
push_to_gateway("http://localhost:9091", job="batch-job", instance="windows")

start <- Sys.time()
source("job3.R")
elapsed <- unclass(difftime(Sys.time(), start, units="secs"))
batch_duration$set(elapsed, path="job3.R")
push_to_gateway("http://localhost:9091", job="batch-job", instance="windows")

Sys.sleep(5)
delete_from_gateway("http://localhost:9091", job = "batch-job", instance="windows")