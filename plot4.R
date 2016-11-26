######
####
#### Exploratory Data Analysis - Week 1 Project
#### 
#### Chris Drumgoole / November 2016
#### https://github.com/cdrum/ExData_Plotting1
####
#### plot4.R - Construct 4th plot, 4 different plots in a 2x2 grid
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
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# Make a 2 by 2 grid
par(mfrow = c(2,2))

# First plot at 1,1 coordinate:
plot(data.set$Date, data.set$Global_active_power , type = "l", xlab = "", ylab = "Global Active Power") # type "l" for line, y label and NO x label. Note: no title either.

# Second plot at 1,2 coordinate
plot(data.set$Date, data.set$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Third plot at 2,1 coordinate
with(data.set, {
    # Initial line, 1st sub meter. Black. Also setting the x and y labels as well
    plot(Date, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering") 
    
    # Add the next two lines, 2nd and 3rd meters on top of exisitng plot
    lines(Date, Sub_metering_2, col= "red")
    lines(Date, Sub_metering_3, col = "blue")
    
    # Construct legend
    legend("topright", lty = c(1,1), bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    # added bty so we don't have any border
})

# Forth plot at 2,2 coordinate
plot(data.set$Date, data.set$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Close device
dev.off()