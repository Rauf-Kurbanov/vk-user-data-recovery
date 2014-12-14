## Inital step, personalize it by yourself
rm(list = ls())
gc()
setwd('/home/rauf/Programs/DM_Labs/day_4/vk-user-data-recovery')

library(jsonlite)
library(lubridate)

## For getting data you shoul use vkapi.py script
## from vk_loader repository: https://github.com/almns/vk_loader.git

## Input ID
id <- '16583869'

## Path to inputh egonet
## Set your own paths
egonetPath <- paste('/home/rauf/Programs/DM_Labs/day_4/vk_loader/src/egonet_', 
                     id, '.csv', sep = '')
profileInfoPath <- paste('/home/rauf/Programs/DM_Labs/day_4/vk_loader/src/profiles_',
                         id, '.json', sep = '')

## Reading egonet and building id/cluster map
source('graph.R')
source('clusterMap.R')
network <- loadGraph(egonetPath)
###
me <- which.max(degree(network))
network <- subgraph(graph=network, v =(1:length(V(network)))[-me])

###
comm <- multilevel.community(network)
#comm <- optimal.community(network)
#comm <- spinglass.community(network)

clusterMap <- initClusterMap(comm)
firstCluster <- idListByCluster(clusterMap, 1)

## Loading user profile
source('userAge.R')
userInfo <- fromJSON(profileInfoPath, flatten=TRUE)
## Simple age retrieving
ages <- sapply(firstCluster, ageById)
ages <- ages[!is.na(ages)]

expectedAge <- median(ages)
expectedAge

