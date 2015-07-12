#Reading the dataset and saving "Date" column as date value, 
# subsetting dates 01.02.2007 and 02.02.2007 for our plot. 
data  <- read.table("./Data//household_power_consumption.txt", sep =";", na.strings = "?", header = T, nrows = 100000)
data$Date  <- strptime(data$Date, format = "%d/%m/%Y")
dataWork  <- data[data$Date == strptime("2007-02-01", "%Y-%m-%d") | data$Date == strptime("2007-02-02", "%Y-%m-%d"),]
dataWork$Time  <- strptime(paste(dataWork$Date, dataWork$Time), "%Y-%m-%d %H:%M:%S", tz = "UTC")

#Creating a table for plots and then adding each plot one by one.
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
par(mfrow = c(2, 2))
with(dataWork, {
    plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", col = "black")
    plot(Time, Voltage, xlab = "datetime", type = "l" ,ylab = "Voltage", col = "black")
    {
        plot(Time, y = Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
        lines(Time, y = Sub_metering_2, type = "l", col = "red")
        lines(Time, Sub_metering_3, type = "l", col = "blue")
        legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1),
               lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    }
    plot(Time, Global_reactive_power, type = "l", xlab = "datetime", col = "black")
})
dev.off()
