######
####
#### Exploratory Data Analysis - Week 1 Project
#### 
#### Chris Drumgoole / November 2016
#### https://github.com/cdrum/ExData_Plotting1
####
#### plot2.R - Construct second plot, a line of Global Active Power over time
####
######

## Import the data acquisition and processing script
## This is required for data to be prepared for the plotting!
source("get_data.R")

##
## Libraries
##
library(data.table)
#library(reshape2)
library(dplyr)

##
## Costants
##
RESETDATA <- FALSE # Set to TRUE if you want to re-download and unzip data

##
## Get Data 
##

data.set <- get_data(RESETDATA) # call function to get data processed. See get_data.R for details

##
## Plot!
##

# Open PNG device with standard settings
# Saving file "plot1.png" in working folder
png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(data.set$Date, data.set$Global_active_power , type="l", xlab = "", ylab = "Global Active Power (kilowats)") # type "l" for line, y label and NO x label. Note: no title either.

# Close device
dev.off()