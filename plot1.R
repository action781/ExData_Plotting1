#Import data
filename = "household_power_consumption.txt"
classes <- c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
table <- read.table(filename, sep = ";", header = TRUE, colClasses = classes, na.strings = "?")
head(table)  #dates are coming in d/m/yyyy form and times are in hh:mm:ss

#I want the dates of feb 1 and feb 2
library(dplyr)
subset <- filter(table, Date == "1/2/2007" | Date == "2/2/2007")

#Create histogram
hist(subset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#Print to a .png
dev.copy(png, file = "plot1.png")
dev.off()