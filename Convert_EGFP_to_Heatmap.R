---title: "Parse Columbus EGFP Expressionv into Platemaps"#For making convenient platemaps from columbus data#Runs in R version 3.3.2 output
#Check for installed packages
packages <- c("dplyr", "tidyr", "platetools", "ggplot2", "viridis")


#, "openxlsx","RTools")if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
install.packages(setdiff(packages, rownames(installed.packages())))

#Require packages.
lapply(packages, require, character.only = TRUE)

#Import data.#*******IMPORTANT********#Go to directory containing files downloaded from Columbus
setwd("C:\\Users\\olivero\\Desktop\\Hans")

#Load each file into the file.names vector that you can process one by one
file.names <- dir(path = ".", pattern =".txt")

#Generate a heat map for each filefor(i in 1:length(file.names)){  ## Read each file as a dataframe and store into "dat"
dat <- as.data.frame(read.table(file.names[i],
     header = TRUE,
     sep = "\t",
     stringsAsFactors = F,
     na.strings = c("", "NA")))
raw_map(data = dat$Nuclei...Intensity.Cytoplasm.EGFP.Mean...Median.per.Well,
        well = dat$WellName,
        plate = 96) +
     #scale_size(range = c(1,10)) +
     ggtitle(file.names[i]) +
     theme_dark() +
     scale_fill_viridis() +
     geom_text(aes(label = dat$Nuclei...Intensity.Cytoplasm.EGFP.Mean...Median.per.Well))



#Import .csv containing file
