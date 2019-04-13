install.packages("rgl")
install.packages("RColorBrewer")
require("rgl")
require("RColorBrewer")
plot3d(scoresAttached$Comp.1, scoresAttached$Comp.2, scoresAttached$Comp.3, xlab = "comp1", ylab = "comp2", zlab = "comp3", col = brewer.pal(3, "Dark2"), size=8)

#Cleaned up 3d PCA plot
#First omit the NAs
naOmited <- na.omit(negScore_PCA1)

# Plot3d
plot3d(naOmited$Comp.1, naOmited$Comp.2, naOmited$Comp.3, xlab="comp1", ylab="comp2", zlab="comp3", col=brewer.pal(3,"Dark2"), size=8)

# add the labels
with(naOmited, text3d(naOmited$Comp.1, naOmited$Comp.2, naOmited$Comp.3, naOmited$Gene))
