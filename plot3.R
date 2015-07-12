#Reading the dataset and saving "Date" column as date value, 
# subsetting dates 01.02.2007 and 02.02.2007 for our plot. 
data  <- read.table("./Data//household_power_consumption.txt", sep =";", na.strings = "?", header = T, nrows = 100000)
data$Date  <- strptime(data$Date, format = "%d/%m/%Y")
dataWork  <- data[data$Date == strptime("2007-02-01", "%Y-%m-%d") | data$Date == strptime("2007-02-02", "%Y-%m-%d"),]
dataWork$Time  <- strptime(paste(dataWork$Date, dataWork$Time), "%Y-%m-%d %H:%M:%S", tz = "UTC")

#Step by step we create our plot and then save it to the png file
with(dataWork, plot(Time, y = Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(dataWork, lines(Time, y = Sub_metering_2, type = "l", col = "red"))
with(dataWork, lines(Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1),
       lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
