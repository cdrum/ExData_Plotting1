######
####
#### Exploratory Data Analysis - Week 1 Project
#### 
#### Chris Drumgoole / November 2016
#### https://github.com/cdrum/ExData_Plotting1
####
#### get_data.R - This file is a utility file that reads data in and returns the 
#### data set for processing in the calling scripts
####
######

##
## Libraries
##
library(data.table)
#library(reshape2)
library(dplyr)

get_data <- function(download.data = FALSE) {
    ##
    ## Download Data Set
    ## Download dataset in zip file, unzip and store in ./data folder
    ##
    
    if(!file.exists("./data")){dir.create("./data")}
    
    if(RESETDATA) { # Only execute the following if we want to reset out data
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl,destfile="./data/household_power_consumption.zip",method="curl")
        unzip("./data/household_power_consumption.zip", exdir="./data", overwrite = TRUE, junkpaths = TRUE) # I use junkpaths as I want all files to be in data
    }
    
    ##
    ## Read data
    ##
    
    # Result Values - Using fread from data.table here since it's a lot of data and read.table would be quite slow
    power.data.full <- fread("./data/household_power_consumption.txt", na.strings = "?") # NA Strings are '?'
    
    ## Extract only the Date/Time range we want
    power.data.filtered <- power.data.full[Date == "1/2/2007" | Date == "2/2/2007"]
    
    ## Convert Date into a Date/Time Variable for our processing later - we can then ignore Time
    power.data.filtered$Date <- as.POSIXct(strptime(paste(as.Date(power.data.filtered$Date, "%d/%m/%Y"), power.data.filtered$Time), format="%Y-%m-%d %H:%M:%S"))
    
    ## Return!
    power.data.filtered
}

