######
####
#### Exploratory Data Analysis - Week 1 Project
#### 
#### Chris Drumgoole / November 2016
#### https://github.com/cdrum/ExData_Plotting1
####
#### plot1.R - Construct first plot, a red histogram of Frequency over time
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
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# Create general plot a simple histogram
hist(data.set$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowats)", col= "red")

# Close device
dev.off()