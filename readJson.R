library(jsonlite)
library(lubridate)
source('userAge.R')

path <- 'vk_data/profiles/egonet_755.json'
userInfo <- fromJSON(path, flatten=TRUE)
#age_calc(time, units="years")


ages <- sapply(firstCluster, function(x) ageById(x))
ages <- ages[!is.na(ages)]

expectedAge <- median(ages)
