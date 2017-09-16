# Plot 2
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

data1$Global <- as.numeric(data1$Global_active_power)
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
with(data1, plot(datetime, as.numeric(data1$Global_active_power),
                 type="l",
                 ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()

