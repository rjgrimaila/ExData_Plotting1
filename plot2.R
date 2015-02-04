# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# Name each of the plot files as plot1.png, plot2.png, etc.
# Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, 
# i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading 
# the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file.
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
# X = Thu/Fri/Sat
# Y = global_active_power
# xlab = Thu, Fri, Sat
# ylab = "Global Active Power (kilowatts)"
# title = ""
###
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")
# plot #2
plot(hpc2d$Global_active_power~hpc2d$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
