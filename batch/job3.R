# data3 <- read.csv("https://data.ontario.ca/dataset/f4112442-bdc8-45d2-be3c-12efae72fb27/resource/c657aeb9-b829-4e16-8e3b-9c9e2aa45313/download/conposcovidloc_2022.csv", header=TRUE)
data3 <- read.csv("input/conposcovidloc_2022.csv", header=TRUE)
dataC <- rbind(data3)
write.csv(dataC, "output/conposcovidlocC.csv")