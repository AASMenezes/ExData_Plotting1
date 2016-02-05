setwd("C:/... my path ....")

# data frame with 2,075,260 rows and 9 columns, all of which are numeric data.
# memory required = 2075260 × 9 × 8 bytes/numeric
2075260 * 9 * 8 # bytes/numeric
# = 149418720 / 2^20 bytes/MB
2075260 * 9 * 8 / 2 ^ 20 # MB
# = 142.4968 # MB
# = 0.142 # GB

# Open data
data = read.csv("C:/... my path ..../household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

# Subsetting
data = data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

# Dates and times
Sys.setlocale(category = "LC_ALL", locale = "C") # Put in English
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
timedate = paste(data$Date, data$Time)
data$timedate = as.POSIXct(timedate)

# Plotting
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
plot(data$timedate, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(data$timedate, data$Voltage, type = "l", ylab = "Voltage (volt)", xlab = "datetime")
plot(data$timedate, data$Sub_metering_1, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(data$timedate, data$Sub_metering_2, col = "red")
lines(data$timedate, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1,1), bty = "n", lwd = 2.5, cex = 0.6, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$timedate, data$Global_reactive_power, type = "l", ylab = "Global Rective Power (kilowatts)", xlab = "datetime") # Create my plot on screen device
dev.copy(png, file = "plot4.png", height = 480, width = 480)# Copy my plot to a PNG file
dev.off()# I didn't forget to close!
