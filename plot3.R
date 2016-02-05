setwd("C:/... my path ..../")

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
with(data, {
    plot(Sub_metering_1 ~ timedate, type = "l",
    ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(Sub_metering_2 ~ timedate,col = "red")
    lines(Sub_metering_3 ~ timedate,col = "blue")
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, cex = 0.8,
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) # Create my plot on screen device
dev.copy(png, file = "plot3.png", height = 480, width = 480) ## Copy plot to a PNG file
dev.off() # I didn't forget to close!

