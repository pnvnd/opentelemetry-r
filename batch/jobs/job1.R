# Basic job to download CSV data from the web and save in some directory
# data1 <- read.csv("batch/input/conposcovidloc_2020.csv", header=TRUE)
data1 <- read.csv("https://data.ontario.ca/dataset/f4112442-bdc8-45d2-be3c-12efae72fb27/resource/5cad2b06-e131-44e7-ad46-757ac67e041d/download/conposcovidloc_2020.csv", header=TRUE)
dataA <- rbind(data1)
write.csv(dataA, "batch/output/conposcovidlocA.csv")