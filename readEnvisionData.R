
# change working directory
setwd("C:/Users/olivero/Desktop/R_Test/")

## File handling
# Input all files into a variable and turn each into a varible that will be individual tables
temp <- list.files(pattern = "*.csv")


# This function will take in an array of file names, parse data, and make a summary
# table displayinbg
read_and_parse_CSV_file <- function(x) {
     # foreach file in temp, do the following code (input this into a function), output
     # a heatmap for each table, followed by calculated means,stdevs, and Z-factors
     
     # read each CSV file, skip the 1st 4 rows, and take only 16 (raw data)
     for (i in 1:length(x)) {
          assign(x[i], read.csv(x[i], header=F, sep="\t", skip=4, nrow=16))
     }
     temp2 <- ls(pattern = "20160115*")
     for (a in 1:length(temp2)) {
          # convert each data frame into numeric matrix to perform mean and stdev
          temp2[a] <- data.matrix(temp2[a])
          View(temp2[a])
          stop()
          cat(mean(temp2[a]))
          #     temp2[a] <- temp2[a] *10000
          #     dmsoMean[a] < mean(temp2[a][1:16,1:23])
          #     cat("DMSO mean is: ", dmsoMean[a])
          
     }
}

read_and_parse_CSV_file(temp)


#put back in bottom of R script

# #table <- read.csv(file="20160115_Plate_1_DMSO1.csv", header=F, sep="\t", skip=4, nrow=16)
#
# # convert a data frame to numeric matrix to perform mean and stdev calucations
# table <- data.matrix(table)
#
# # multiply each value by 10,000
# #table <- table*10000
#
# # calculate mean of the all cells except those on column 24 (negative control, DMSO)
# DMSO_mean <- mean(table[1:16,1:23])
#
# # calculate mean of column 24 (positive control)
# posCtrl_mean <- mean(table[1:16,24])
#
# # calculate Stdev of the all cells except those on column 24 (negative control, DMSO)
# DMSO_sd <- sd(table[1:16,1:23])
#
# # calculate Stdev of column 24 (positive control)
# posCtrl_sd <- sd(table[1:16,24])
#
# # calculate Z' of table
# Z_factor <- 1 - 3*(posCtrl_sd + DMSO_sd)/abs(posCtrl_mean - DMSO_mean)
#
# cat("Positive control mean is: ", posCtrl_mean)
# cat("Pos control sd is: ", posCtrl_sd)
# cat("DMSO mean is: ", DMSO_mean)
# cat("DMSO sd is : ", DMSO_sd)
# cat("Z-factor is: ", Z_factor)





