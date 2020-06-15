# To run code, download data from link below to your working directory in R
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# Your working directory can be found with by running  the "getwd()" function in R

library("data.table")

#Reads entire data set from working directory
power <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# Using paste and as.POSIXct functions in order to combine "Date" and "Time" columns and filter by time of day
power[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter dates for February 1 to February 2, 2007
power <- power[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

# Create png with name and dimensions specified by the assignment
png("plot3.png", width=480, height=480)

# Create histogram for Plot 3
plot(power[, dateTime], power[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(power[, dateTime], power[, Sub_metering_2],col="red")
lines(power[, dateTime], power[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(1,1))

# Shuts off device; Plot 3 saved to working directory
dev.off()