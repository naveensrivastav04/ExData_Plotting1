data_file <- household_power_consumption##
# library(dplyr)
data_file_1 <- filter(data_file, Date %in% c("1/2/2007","2/2/2007"))

#str(data_file_1)
datetime <- strptime(paste(data_file_1$Date, data_file_1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

sub_meter_1 <- as.numeric(data_file_1$Sub_metering_1)
sub_meter_2 <- as.numeric(data_file_1$Sub_metering_2)
sub_meter_3 <- as.numeric(data_file_1$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, sub_meter_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_meter_2, type="l", col="red")
lines(datetime, sub_meter_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
