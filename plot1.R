#Reading the dataset and saving "Date" column as date value, 
# subsetting dates 01.02.2007 and 02.02.2007 for our plot. 
data  <- read.table("./Data//household_power_consumption.txt", sep =";", na.strings = "?", header = T, nrows = 100000)
data$Date  <- strptime(data$Date, format = "%d/%m/%Y")
dataWork  <- data[data$Date == strptime("2007-02-01", "%Y-%m-%d") | data$Date == strptime("2007-02-02", "%Y-%m-%d"),]

#Creating the plot and saving it as plot1.png file, closing the graphics device.
with(dataWork, hist(x = Global_active_power, freq = T, col = "red",
                    main = "Global Active Power", xlab = "Global Active Power(kilowatts)"))
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
