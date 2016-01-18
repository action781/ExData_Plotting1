#Import data
filename = "household_power_consumption.txt"
classes <- c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
table <- read.table(filename, sep = ";", header = TRUE, colClasses = classes, na.strings = "?")
head(table)  #dates are coming in d/m/yyyy form and times are in hh:mm:ss

#I want the dates of feb 1 and feb 2 and date/times in POSIXlt
library(dplyr)
subset <- filter(table, Date == "1/2/2007" | Date == "2/2/2007")
subset$Time <- paste(as.Date(subset$Date, format = "%d/%m/%Y"), subset$Time, sep = " ")
subset$Time <- as.POSIXlt.date(subset$Time, format = "%Y-%m-%d %H:%M:%s")

#Create plot
plot(subset$Time, subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subset$Time, subset$Sub_metering_2, type = "l", col = "red")
lines(subset$Time, subset$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1.5, col = c("black", "red", "blue"))

#Pring to a .png
dev.copy(png, file = "plot3.png")
dev.off()