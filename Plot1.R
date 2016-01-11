## Load and subset the data to use only consumption from two days 
envio <- "./household_power_consumption.txt"
dat <- read.table(envio, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec =".")
subdat <- dat[dat$Date %in% c("1/2/2007", "2/2/2007") ,]

##Part1 - create plot showing Global Active Power
GAP <- as.numeric(subdat$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(GAP, col="red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()


