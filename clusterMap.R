initClusterMap <- function(communities) {
  byClusters <- as.data.frame(cbind(communities$membership, communities$names))
  names(byClusters) <- c("membership", "userId")
  clusterMap <- table(byClusters)
}

clusterById <- function(clMap, id) {
  inWhichClusters <- which(clMap[, id] == 1)
  as.numeric(names(inWhichClusters))
}

idListByCluster <- function(clMap, clust) {
  names(which(clMap[clust, ] == 1))
}