data_file <- household_power_consumption##
# library(dplyr)
data_file_1 <- filter(data_file, Date %in% c("1/2/2007","2/2/2007"))

#str(data_file_1)

globalactivepower <- as.numeric(data_file_1$Global_active_power)

png("plot1.png",width = 480,height = 480)

hist(globalactivepower,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
