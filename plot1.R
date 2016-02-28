# Read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors = FALSE)
str(data)

# Getting and cleaning data
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# We will only be using data from the dates 2007-02-01 and 2007-02-02
library(dplyr)
data2 <- tbl_dt(data) %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")
str(data2)

# Plot the data and save the plot
png(filename = "plot1.png", width = 565, height = 356)
hist(data2$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
dev.cur()
