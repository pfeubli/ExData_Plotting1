data <- read.csv("./household_power_consumption.txt", sep = ";")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
subset$date_time <- strptime(paste(subset$Date, subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
subset$Sub_metering_1 <- as.numeric(levels(subset$Sub_metering_1)[subset$Sub_metering_1])
subset$Sub_metering_2 <- as.numeric(levels(subset$Sub_metering_2)[subset$Sub_metering_2])

png("plot3.png", width=480, height=480, units = "px")
plot(subset$date_time, subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subset$date_time, subset$Sub_metering_2, type = "l", col = "red")
lines(subset$date_time, subset$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
dev.off()