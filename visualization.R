## Source if haven't been sourced yet
source('main.R')

## Plottig egonet colored by membership
l2 <- layout.auto(network)
plot(network, layout=l2, vertex.color=comm$membership,
     vertex.size=2, vertex.label=NA)
