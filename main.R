## Inital step, personalize it by yourself
rm(list = ls())
gc()
setwd('/home/rauf/Programs/DM_Labs/day_4/vk-user-data-recovery')

library(jsonlite)
library(lubridate)

## Path to inputh edonet
egonetPath <- 'vk_data/adj/egonet_755.txt'
profileInfoPath <- 'vk_data/profiles/egonet_755.json'

## Reading egonet and building id/cluster map
source('graph.R')
source('clusterMap.R')
network <- loadGraph(egonetPath)
comm <- fastgreedy.community(network)
clusterMap <- initClusterMap(comm)
firstCluster <- idListByCluster(clusterMap, 1)

## Loading user profile
source('userAge.R')
userInfo <- fromJSON(profileInfoPath, flatten=TRUE)
## Simple age retrieving
ages <- sapply(firstCluster, function(x) ageById(x))
ages <- ages[!is.na(ages)]

expectedAge <- median(ages)
expectedAge

