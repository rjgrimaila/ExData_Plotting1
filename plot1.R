# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# Name each of the plot files as plot1.png, plot2.png, etc.
# Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, 
# i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading 
# the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file.
#
#
setwd("~/Documents/dev_R/ExData_Plotting1")
# read in the file
hpc <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                na.strings = "?", nrows=2075259)
# now let's convert dates
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
hpc$datetime <- paste(as.Date(hpc$Date), hpc$Time)
# and save space by subsetting ...
hpc2d <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
hpc2d$Datetime <- as.POSIXct(hpc2d$datetime)
#View(hpc2d)
rm(hpc)
#head(hpc2d)

# create the plot
# X = global_active_power
# Y = frequency
# xlab = "Global Active Power (kilowatts)"
# ylab = "Frequency" # label not needed
# title = "Global Active Power"
#
# plot #1
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")

hist(hpc2d$Global_active_power, main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col="red", ylim=c(0,1200))

dev.off()
