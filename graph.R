library(igraph)

loadGraph <- function(path) {
  a <- read.table(path, sep=' ', dec = ' ', header = T)
  a.network <- graph.data.frame(a, directed = F)
  a.network <- simplify(a.network)  
}

#goldenStep <- which.max(comm$modularity)
#ctm <- community.to.membership(a.network, comm$merges, goldenStep, membership=TRUE, csize=TRUE)

