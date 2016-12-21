data <- read.csv("./household_power_consumption.txt", sep = ";")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
subset$date_time <- strptime(paste(subset$Date, subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
subset$Global_active_power <- as.numeric(levels(subset$Global_active_power)[subset$Global_active_power])
subset$Sub_metering_1 <- as.numeric(levels(subset$Sub_metering_1)[subset$Sub_metering_1])
subset$Sub_metering_2 <- as.numeric(levels(subset$Sub_metering_2)[subset$Sub_metering_2])
subset$Voltage <- as.numeric(levels(subset$Voltage)[subset$Voltage])
subset$Global_reactive_power <- as.numeric(levels(subset$Global_reactive_power)[subset$Global_reactive_power])

png("plot4.png", width=480, height=480, units = "px")
par(mfrow = c(2,2))

plot(subset$date_time, subset$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)", cex=0.2 )

plot(subset$date_time, subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(subset$date_time, subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subset$date_time, subset$Sub_metering_2, type = "l", col = "red")
lines(subset$date_time, subset$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, 
       col=c("black", "red", "blue"), bty="n")

plot(subset$date_time, subset$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")
dev.off()