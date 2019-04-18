#ANNOTATED ONLY
# how to subset data to  get rid of unnanotated genes.
annotated <- subset(t2, grepl("[^---]", t2$Gene.Symbol))

# get only the columns with expression values to calculate PCA
forPCA_annotated <- cbind(annotated[,2:13])
# cbind the gene symbol as the first colum of "forPCA_annotated"
forPCA_annotated2 <- cbind(annotated[,"Gene.Symbol"], forPCA_annotated)

# truncate the colnames
colnames(forPCA_annotated) <- c(str_extract(colnames(forPCA_annotated), ".+{5}?")

# rename column 1
colnames(forPCA_annotated2)[1] <- "Gene.Symbol"

# Plot the color correlation matrices
library(gclus)
library(calibrate)
my.abs <- abs(cor(forPCA_annotated[,-1]))
my.colors <- dmat.color(my.abs)
my.ordered <- order.single(cor(forPCA_annotated[,-1]))
cpairs(forPCA_annotated[,-1], my.ordered, panel.colors=my.colors, gap=0.5)

# Calc PCA
pca1 <- princomp(forPCA_annotated[,-1], scores=T, cor=T)

# view biplot w/ labels
biplot(pca1, xlabs=forPCA_annotated[,1])

# Attach scores for components 1,2, and 3 to original annotated table, or forPCA_annotated
scoresAttached <- cbind(forPCA_annotated, pca1$scores[,1:3])
View(scoresAttached)
