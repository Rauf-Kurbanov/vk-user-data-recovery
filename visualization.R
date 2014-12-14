## Source if haven't been sourced yet
source('main.R')

## Plottig egonet colored by membership
l2 <- layout.fruchterman.reingold(network)
#l2 <- layout.auto(network)

plot(network, layout=l2, vertex.color=comm$membership,
     vertex.size=2, vertex.label=NA)

plot(comm, network, vertex.label=NA, vertex.size=2)
