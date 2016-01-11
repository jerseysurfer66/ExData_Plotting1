dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datet <- strptime(paste(subSet$Date, subSe$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
ActivePower <- as.numeric(subSet$Global_active_power)
ReactivePower <- as.numeric(subSet$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
sub1 <- as.numeric(subSet$Sub_metering_1)
sub2 <- as.numeric(subSet$Sub_metering_2)
sub3 <- as.numeric(subSet$Sub_metering_3)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datet, ActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datet, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datet, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(datet, sub2, type="l", col="red")
lines(datet, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datet, ReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off() 
    