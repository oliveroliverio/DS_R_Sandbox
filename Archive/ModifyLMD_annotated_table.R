# Modifying the LMD annotated table in R.

# Dropping columns
df <- subset(df, select = -c(a,c) )

#Go to directory containing excel sheet
setwd("directory containing the excel sheet")
#Read in the table
t2 <- read.delim("tableName.txt", header=T, sep="\t", quote="\"")

#subset only the rows that are miRNAs
that <- t2[grepl("microRNA", t2$Gene.Description),]
#or
that <- subset(t2, grepl("microRNA", t2$Gene.Description))
View(that)

#Selecting only columns that contain gene expression info (columns 2-13).  "that" is the miRNA table
miRNA_PCA <- cbind(that[,2:13])

#Copying dataframes to play with the new one
miRNA_PCA2 <- miRNA_PCA
ls()

#Renaming long column names with only a select word
#dload the the stringr package
source("http://bioconductor.org/biocLite.R")
biocLite("stringr")
library(stringr)
str_extract(colnames(miRNA_PCA), ".+{5}?")
#[1] "cCTB1" "cCTB2" "cCTB3" "cCTB4" "iCTB1" "iCTB2"

# Here's the actual renaming part
colnames(miRNA_PCA2) <- c(str_extract(colnames(miRNA_PCA), ".+{5}?"))

# Proceed to PCA of this data.
# how to add the gene symbol column as the first column of miRNA_PCA2
# Adding a new column with stuff
table2$blahblah <- pca$scores[,5]
#blahblah is the new column, and this is the stuff.

#Grab filenames from a list.files() command
filenames <- subset(list.files(), grepl("*.CEL", list.files()))
