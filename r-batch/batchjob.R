library(openmetrics)

# Get a list of relative file paths of job jobs that should be run
jobs <- list.files(path="./batch/jobs", pattern="job.*.R", full.names = TRUE)

# Create a metric gauge to measure how long batch jobs takes
batch_duration <- gauge_metric("batch_duration_seconds", "Duration of batch job in seconds.", unit="seconds", labels = c("path"))

# Since each job is contained in a single file, calculate duration and set this value to the meter and add the relative file path as an attribute (label)
for (job in jobs) {
start <- Sys.time()
source(job)
elapsed <- unclass(difftime(Sys.time(), start, units="secs"))
batch_duration$set(elapsed, path=job)
push_to_gateway("http://localhost:9091", job="batch-job", instance="localhost")
}

# Change sleep timer depening on scrape interval, otherwise the same metric will be scraped repeatedly
Sys.sleep(5)

# Delete the metric from the pushgateway to avoid scraping the same metrics over and over
delete_from_gateway("http://localhost:9091", job = "batch-job", instance="localhost")