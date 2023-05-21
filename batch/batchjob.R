library(openmetrics)

delete_from_gateway("http://localhost:9091", job = "batch-job")
batch_duration <- gauge_metric("batch_duration_seconds", "Duration of batch job", unit="seconds")
start <- Sys.time()

# data1 <- read.csv("https://data.ontario.ca/dataset/f4112442-bdc8-45d2-be3c-12efae72fb27/resource/5cad2b06-e131-44e7-ad46-757ac67e041d/download/conposcovidloc_2020.csv", header=TRUE)
# data2 <- read.csv("https://data.ontario.ca/dataset/f4112442-bdc8-45d2-be3c-12efae72fb27/resource/822d637d-3416-4ad8-b09b-a748ae1370e0/download/conposcovidloc_2021.csv", header=TRUE, row.names=NULL)
# data3 <- read.csv("https://data.ontario.ca/dataset/f4112442-bdc8-45d2-be3c-12efae72fb27/resource/c657aeb9-b829-4e16-8e3b-9c9e2aa45313/download/conposcovidloc_2022.csv", header=TRUE, row.names=NULL)

data1 <- read.csv("C:/Users/Peter/Desktop/test/conposcovidloc_2020.csv", header=TRUE)
# data2 <- read.csv("C:/Users/Peter/Desktop/test/conposcovidloc_2021.csv", header=TRUE, row.names=NULL)
# data3 <- read.csv("C:/Users/Peter/Desktop/test/conposcovidloc_2022.csv", header=TRUE, row.names=NULL)

dataA <- rbind(data1)
write.csv(dataA, "conposcovidloc.csv")

batch_duration$set(unclass(difftime(Sys.time(), start, units = "secs")))
push_to_gateway("http://localhost:9091", job = "batch-job", instance="instance")
