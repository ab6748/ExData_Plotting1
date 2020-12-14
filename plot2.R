# Reads the data only for dates 2007-02-01 and 2007-02-02.
data <- read.table("./household_power_consumption.txt", sep = ";", header = FALSE, skip = 66637, nrows = 2880, colClasses = "character")
names <- read.table("./household_power_consumption.txt", sep = ";", header = FALSE, nrows = 1, colClasses = "character")
colnames(data) <- names

# Re-classifies the variables so they can be computed in plots.
data$Global_active_power <- as.numeric(data$Global_active_power)
dates <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Sets parameters and makes the plot.
plot(dates, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")

# Creates PNG file.
dev.copy(png, file = "plot2.png")
dev.off()
