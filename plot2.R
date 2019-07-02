data_file <- household_power_consumption
# library(dplyr)
data_file_1 <- filter(data_file, Date %in% c("1/2/2007","2/2/2007"))

datetime <- strptime(paste(data_file_1$Date, data_file_1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data_file_1$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
