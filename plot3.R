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

png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")
# plot #3
plot(hpc2d$Sub_metering_1~hpc2d$Datetime, type="l",
     ylab="Energy sub metering", xlab="")
lines(hpc2d$Sub_metering_2~hpc2d$Datetime, type="l", col="red")
lines(hpc2d$Sub_metering_3~hpc2d$Datetime, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
