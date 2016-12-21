data <- read.csv("./household_power_consumption.txt", sep = ";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subset <- data[(data$Date <= "2007-02-02" & data$Date >= "2007-02-01"),]
subset$Global_active_power <- as.numeric(levels(subset$Global_active_power)[subset$Global_active_power])
hist(subset$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()