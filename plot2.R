# Read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors = FALSE)
str(data)

# Getting and cleaning data
data$DateTime <- strptime( paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S" )
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
str(data)

# We will only be using data from the dates 2007-02-01 and 2007-02-02
data2 <- subset(data, Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")) )
summary(data2)

# Plot the data and save the plot
png(filename = "plot2.png", width = 565, height = 356)
with(data2, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
dev.cur()
