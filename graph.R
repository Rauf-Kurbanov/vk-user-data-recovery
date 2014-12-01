rm(list = ls())
gc()

library(igraph)
setwd('/home/rauf/Programs/DM_Labs/day_4')

path <- "vk_data/adj/egonet_755.txt"

a <- read.table(path, sep=' ', dec = ' ', header = T)
a.network <- graph.data.frame(a, directed = F)
a.network <- simplify(a.network)

cl <- fastgreedy.community(a.network)
goldenStep <- which.max(cl$modularity)

ctm <- community.to.membership(a.network, cl$merges, goldenStep, membership=TRUE, csize=TRUE)

byClusters <- as.data.frame(cbind(cl$membership, cl$names))
names(byClusters) <- c("membership", "userId")
tt <-split(x = byClusters, f = membership)

firstCluster <- tt$'1'$userId
firstCluster <- as.character(firstCluster)
###

clusterMap <- sapply(tt, function(x) as.character(x[, 2]))

