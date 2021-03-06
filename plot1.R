# plot 1

dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


# data1$Global <- as.numeric(data1$Global_active_power)
png("plot1.png", width=480, height=480)
hist(as.numeric(data1$Global_active_power),col="red",main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
