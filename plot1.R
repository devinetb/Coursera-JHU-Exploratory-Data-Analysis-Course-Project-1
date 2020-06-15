# To run code, download data from link below to your working directory in R
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# Your working directory can be found with by running  the "getwd()" function in R

library("data.table")

# Reads entire data set from working directory
power <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# Using as.Date function in order to filter "Date" column by day
power[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter dates for February 1 to February 2, 2007
power <- power[(Date >= "2007-02-01") & (Date < "2007-02-03")]

# Create png with name and dimensions specified by the assignment
png("plot1.png", width=480, height=480)

# Create histogram for Plot 1
hist(power[, Global_active_power], main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Shuts off device; Plot 1 saved to working directory
dev.off()