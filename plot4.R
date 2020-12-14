# Reads the data only for dates 2007-02-01 and 2007-02-02.
data <- read.table("./household_power_consumption.txt", sep = ";", header = FALSE, skip = 66637, nrows = 2880, colClasses = "character")
names <- read.table("./household_power_consumption.txt", sep = ";", header = FALSE, nrows = 1, colClasses = "character")
colnames(data) <- names

# Re-classifies the variables so they can be computed in plots.
data$Global_active_power <- as.numeric(data$Global_active_power)
dates <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Voltage <- as.numeric(data$Voltage)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)

# Sets parameters and makes the plot.
par(mfrow = c(2,2), cex = 0.5)
plot(dates, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(dates, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dates, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(dates, data$Sub_metering_2, col = "red")
lines(dates, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = names[7:9], y.intersp = 1, bty = "n")
plot(dates, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Creates PNG file.
dev.copy(png, file = "plot4.png")
dev.off()
