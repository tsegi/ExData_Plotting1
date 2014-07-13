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
par(cex=0.5)
par(mfrow = c(2,2))
par(mfcol = c(2,2))
par(mar = c(4,4,2,2))
plot(data$FullDate, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(data$FullDate, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$FullDate, data$Sub_metering_1, col="black")
lines(data$FullDate, data$Sub_metering_2, col="red")
lines(data$FullDate, data$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col=c("black", "red", "blue"), xjust = 0, bty = "n", cex=0.8)
plot(data$FullDate, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data$FullDate, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
# Output
dev.copy(png, file = "plot4.png")
dev.off()
