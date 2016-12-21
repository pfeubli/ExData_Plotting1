data <- read.csv("./household_power_consumption.txt", sep = ";")

data$Date <- as.Date(data$Date, "%d/%m/%Y")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
subset$date_time <- strptime(paste(subset$Date, subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
subset$Global_active_power <- as.numeric(levels(subset$Global_active_power)[subset$Global_active_power])

plot(subset$date_time, subset$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()