## Degree distribution
degree <- degree(network)
hist(degree)

## Betweenness distibution
betweenness <- betweenness(network)
hist(betweenness)

## Clustering coeffcient
clust_coeff <- transitivity(network, type=c("global"))

## Graph Modularity
modularity <- max(comm$modularity)

## Page rank
page_rank <- page.rank(network)$vector
hist(page_rank)

## Closeness distribution
closeness <- closeness(network)
hist(closeness)

## 
comm$membershipsip
