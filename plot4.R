# plot 4

dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


data1$Global <- as.numeric(data1$Global_active_power)
data1$Sub_metering_1 <- as.numeric(data1$Sub_metering_1)
data1$Sub_metering_2 <- as.numeric(data1$Sub_metering_2)
data1$Sub_metering_3 <- as.numeric(data1$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

with(data1, plot(datetime, data1$Global_active_power,
                 type="l",
                 ylab="Global Active Power", xlab=""))


data1$Voltage <- as.numeric(data1$Voltage)
with(data1, plot(datetime, data1$Voltage,
                 type="l",
                 ylab="Volage", xlab="datetime"))

plot(datetime, data1$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, data1$Sub_metering_2, type="l", col="red")
lines(datetime, data1$Sub_metering_3, type="l", col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       ,col=c("black", "red", "blue"))

data1$Global_reactive_power <- as.numeric(data1$Global_reactive_power)
with(data1, plot(datetime, data1$Global_reactive_power,
                 type="l",
                 ylab="Global Reactive Power", xlab="datetime"))

dev.off()
