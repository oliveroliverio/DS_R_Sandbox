ascendingOrder_Comp1 <- scoresAttached[order(scoresAttached$Comp.1),]

# Sort descending based on component 1
descendingOrder_Comp1 <- scoresAttached[order(-scoresAttached$Comp.1),]

# Re-sort by index
d <- read.table(text=readClipboard(), header=TRUE)   
d$index <- as.numeric(row.names(d))
d[order(d$index), ]
