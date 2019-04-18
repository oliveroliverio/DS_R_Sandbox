#Michael Totagrande 20170214 v1.0
#For making convenient platemaps from tidyr output.
#Runs in R version 3.3.2

#Check for installed packages 
packages <- c("dplyr", "tidyr")
                                          #, "openxlsx","RTools")
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(packages, rownames(installed.packages())))}

#Require packages.
lapply(packages, require, character.only = TRUE)


#Import data.
#*******IMPORTANT********
#File MUST be a .csv.  Format so it only has a header and data.
file <- file.choose()
filename <- substr(basename(file), 1, (nchar(basename(file))-4))

#Get directory of file
dir <- dirname(file)

#Import .csv containing file
dat <- as.data.frame(read.csv(file, header = TRUE, stringsAsFactors = F, na.strings = c("", "NA")))
  
#Separate Well column into PlateID and Well by "/"
dat <- separate(data = dat, col = Well, into = c("PlateID", "Well"), sep ="/")
  
#Separate Well column into Column and Row
dat <- dat %>% mutate(Row = substr(Well, 1, 1)) %>%
mutate(Column = substr(Well, 2, 3))
  
dat <- dat[c(1, 2, 9, 10, 3, 4, 5, 6, 7, 8)]
  
#Make data.frame of unique PlateID values
plate.unique <- unique(dat$PlateID)

i = 1
  for(plate in plate.unique){
    #Create new dataframe of appropriate size for 394 well plate + labeling columns.
    df <- data.frame(matrix(NA, nrow = 17, ncol = 27))
    
    #Designate column names
    names(df) <- c("Plate", plate.unique[i], c(1:24), "Volume")
    
    #Filter imported data to a single plateID and remove NAs
    dat1 <- filter(dat, PlateID == plate.unique[i])
    dat1 <- dat1[complete.cases(dat1),]
    
#Populate Plate column (rows), PlateID column (compound numbers), Volumes in new df.
    rows <- c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P")
    df$Plate <- c(rows, NA)
    
    #Calculate the number of rows to fill with NA values, in case the plate is less than full.
    cmpNum <- (length(df$Plate) - length(unique(dat1$Substance)))
    
    #Volume population assumes single, shared volume for all wells.
    plateSubs <- unique(dat1$Substance)
    
    df[2] <- c(plateSubs, rep(NA, cmpNum))
    df$Volume <- c(rep(unique(dat1$Amount), length(unique((dat1$Substance)))), rep(NA,cmpNum))
    
    #Populate concentrations in last row of df
    conc <- unique(dat1$Conc)
    df[nrow(df),] <- c("Concentrations", NA, conc, NA, NA, NA)
    
    #Create output file name
    savename <- paste(dir, plate, sep = "/")
    savename <- paste(savename, "csv", sep = ".")
    
    write.csv(df, file = savename, quote = FALSE, row.names = T, na = " ")
    
    i = i+1
}


################################
#Archive


#Change style on PlateID cell
#for(curr_sheet in names(wb)){
#  replaceStyle(wb, sheet = curr_sheet, rows = 1, cols = 2, gridExpand = TRUE)
#}

#Add worksheet to existing workbook (wb)
#addWorksheet(wb, i+1)
#writeData(wb, i+1, df, colNames = T, rowNames = T)
#renameWorksheet(wb, i+1, plate)
#i = i+1

#Output wb to same folder as original CSV, saved with appropriate PlateID in tab name
#saveWorkbook(wb, file = savename, overwrite = TRUE)

#Create workbook so openxlsx can output a .xlsx
#wb <- createWorkbook()
#addWorksheet(wb, "AllData")
#writeData(wb, "AllData", dat, colNames = T, rowNames = F)

#Create a style so that the PlateID value formats correctly
#style <- createStyle(numFmt = "Number")

#Fill df with concentration values
#conc <- unique(dat1$Conc)
#x <- 3
#while(x < (ncol(df)-2)){
#  df[x] <- c(rep(conc[x-2], nrow(df)-1), NA)
#  x<- x+1


