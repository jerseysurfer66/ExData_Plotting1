dataFile <- "household_power_consumption.txt"
dat <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]

datet <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
ActivePower <- as.numeric(subData$Global_active_power)
subMeter1 <- as.numeric(subData$Sub_metering_1)
subMeter2 <- as.numeric(subData$Sub_metering_2)
subMeter3 <- as.numeric(subData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datet, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datet, subMeter2, type="l", col="red")
lines(datet, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()