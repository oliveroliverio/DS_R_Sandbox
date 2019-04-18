setwd("c:\\Users\\olivero\\Desktop\\ColumbusAnalysis")
table <- read.table(file = "20150806 U2OS LAMP2 - 20150810 U2OS LAMP2_1.txt", header=T, sep="\t")
View(table)
names(table)

# subset the table to columns 1-8 (16% PFA)
PFA_16 <- subset(table, table$Col == 1:8)

# subset the table to columns 9-17 (37% PFA)
PFA_37 <- subset(table, table$Col == 9:16)

# subset the table to columns 18-24 (Mirsky's)
PFA_Mirskys <- subset(table, table$Col == 17:24)


# function that calculates the signal to background ratio
#   Note: column 6 - corrected spot intensity
#       : column 8 - spot to region intensity
s2b <- function(x) {
    mean <- mean(x[,6])
    sd <- sd(x[,6])
    s2b_ratio <- sd/mean
    return(s2b_ratio) 
}

# invoke s2b function
PFA_16_s2b <- s2b(PFA_16)
PFA_37_s2b <- s2b(PFA_37)
PFA_Mirskys <- s2b(PFA_Mirskys)

# display results to console
PFA_16_s2b 
PFA_37_s2b 
PFA_Mirskys 



# For inputing in Excel.  Try to figure out Knitr options.   
mean(PFA_16[,6])
mean(PFA_37[,6])
mean(PFA_Mirskys[,6])
sd(PFA_16[,6])
sd(PFA_37[,6])
sd(PFA_Mirskys[,6])

mean(PFA_16[,8])
mean(PFA_37[,8])
mean(PFA_Mirskys[,8])
sd(PFA_16[,8])
sd(PFA_37[,8])
sd(PFA_Mirskys[,8])

