# Basic job to download CSV data from the web and save in some directory
# data2 <- read.csv("batch/input/conposcovidloc_2021.csv", header=TRUE)
data2 <- read.csv("https://data.ontario.ca/dataset/f4112442-bdc8-45d2-be3c-12efae72fb27/resource/822d637d-3416-4ad8-b09b-a748ae1370e0/download/conposcovidloc_2021.csv", header=TRUE)
dataB <- rbind(data2)
write.csv(dataB, "batch/output/conposcovidlocB.csv")