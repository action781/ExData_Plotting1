#Import Data 
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
plot(subset$Time, subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Pring to a .png
dev.copy(png, file = "plot2.png")
dev.off()
