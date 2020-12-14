# Reads the data only for dates 2007-02-01 and 2007-02-02.
data <- read.table("./household_power_consumption.txt", sep = ";", header = FALSE, skip = 66637, nrows = 2880, colClasses = "character")
names <- read.table("./household_power_consumption.txt", sep = ";", header = FALSE, nrows = 1, colClasses = "character")
colnames(data) <- names

# Re-classifies the variables so they can be computed in plots.
data$Global_active_power <- as.numeric(data$Global_active_power)

# Sets parameters and makes the plot.
par(mar = c(4, 4, 2, 2))
hist(data$Global_active_power, col = "red", main = "Global Active Power",xlab = "Global Active Power (Kilowatts)", ylab = "Frequency")

# Creates PNG file.
dev.copy(png, file = "plot1.png")
dev.off()
