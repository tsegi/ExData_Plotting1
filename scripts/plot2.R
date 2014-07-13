# Read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c(rep("character", 2), rep("numeric", 7)))
# Keep data for 2007-02-01 and 2007-02-02 only
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
# Convert to correct data types
data$FullDate <- paste(data$Date, data$Time, sep = " ")
data$FullDate <- strptime(data$FullDate, "%d/%m/%Y %H:%M:%S")
data$Date <- NULL
data$Time <- NULL
# Set locale to make sure the x-axis labels are in English
Sys.setlocale("LC_TIME", "English")
# Plot
par(cex=0.8)
par(mfrow = c(1,1))
par(mfcol = c(1,1))
par(mar = c(4,4,2,2))
plot(data$FullDate, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
# Output
dev.copy(png, file = "plot2.png")
dev.off()
