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
plot(data$Global_active_power ~ data$timedate, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "") # Create plot on screen device
dev.copy(png, file = "plot2.png", width = 480, height = 480)  ## Copy plot to a PNG file
dev.off() ## I didn't forget to close!
