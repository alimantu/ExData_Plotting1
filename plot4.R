#Reading the dataset and saving "Date" column as date value, 
# subsetting dates 01.02.2007 and 02.02.2007 for our plot. 
data  <- read.table("./Data//household_power_consumption.txt", sep =";", na.strings = "?", header = T, nrows = 100000)
data$Date  <- strptime(data$Date, format = "%d/%m/%Y")
dataWork  <- data[data$Date == strptime("2007-02-01", "%Y-%m-%d") | data$Date == strptime("2007-02-02", "%Y-%m-%d"),]
dataWork$Time  <- strptime(paste(dataWork$Date, dataWork$Time), "%Y-%m-%d %H:%M:%S", tz = "UTC")