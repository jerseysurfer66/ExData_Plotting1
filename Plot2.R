##Load data (Make Sure you're working directory contains the dataset)
dataFile <- "household_power_consumption.txt"
dat <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]
##Construct Plot2
dattime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
ActivePower <- as.numeric(subData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dattime, ActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() 