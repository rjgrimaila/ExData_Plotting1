#
# Exploratory Data Analysis, exdata-011, course project #1
#
# how much memory to read in a 133Mb file? rough calculation from http://simplystatistics.org/2011/10/07/r-workshop-reading-in-large-data-frames/
# # rows * # columns * 8 bytes / 2^20
# 2,075,259 rows * 9 columns * 8 bits / 2^20 or (2075259 * 9 * 8) / 2^20 = 142.4967 Mb
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
#
# plot #1
hist(hpc2d$Global_active_power, main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     col="red", ylim=c(0,1200))
# plot #2
plot(hpc2d$Global_active_power~hpc2d$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
# plot #3
plot(hpc2d$Sub_metering_1~hpc2d$Datetime, type="l",
     ylab="Energy sub metering", xlab="")
lines(hpc2d$Sub_metering_2~hpc2d$Datetime, type="l", col="red")
lines(hpc2d$Sub_metering_3~hpc2d$Datetime, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# plot #4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(hpc2d$Global_active_power~hpc2d$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

plot(hpc2d$Voltage~hpc2d$Datetime, type="l", 
     ylab="Voltage (volt)", xlab="datetime")

plot(hpc2d$Sub_metering_1~hpc2d$Datetime, type="l",
     ylab="Energy sub metering", xlab="")
lines(hpc2d$Sub_metering_2~hpc2d$Datetime, type="l", col="red")
lines(hpc2d$Sub_metering_3~hpc2d$Datetime, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(hpc2d$Global_reactive_power~hpc2d$Datetime, type="l", 
     ylab="Global Rective Power (kilowatts)",xlab="datetime")


#dev.off()


