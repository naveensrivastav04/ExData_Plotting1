
data_file <- household_power_consumption##
# library(dplyr)
data_file_1 <- filter(data_file, Date %in% c("1/2/2007","2/2/2007"))



datetime <- strptime(paste(data_file_1$Date, data_file_1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(data_file_1$Global_active_power)
globalReactivePower <- as.numeric(data_file_1$Global_reactive_power)


voltage <- as.numeric(data_file_1$Voltage)
sub_meter_1 <- as.numeric(data_file_1$Sub_metering_1)
sub_meter_2 <- as.numeric(data_file_1$Sub_metering_2)
sub_meter_3 <- as.numeric(data_file_1$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub_meter_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_meter_2, type="l", col="red")
lines(datetime, sub_meter_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
