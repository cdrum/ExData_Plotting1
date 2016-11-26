######
####
#### Exploratory Data Analysis - Week 1 Project
#### 
#### Chris Drumgoole / November 2016
#### https://github.com/cdrum/ExData_Plotting1
####
#### plot3.R - Construct 3rd plot, 3 lines for sub meters 1-3 over time
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
png(filename = "plot3.png", width = 480, height = 480, units = "px")

with(data.set, {
    # Initial line, 1st sub meter. Black. Also setting the x and y labels as well
    plot(Date, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering") 
    
    # Add the next two lines, 2nd and 3rd meters on top of exisitng plot
    lines(Date, Sub_metering_2, col= "red")
    lines(Date, Sub_metering_3, col = "blue")
    
    # Construct legend
    legend("topright", lty = c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

# Close device
dev.off()