library(dplyr)
setwd("~/My R/datasciencecoursera/peer_graded_assignment_1_exploratory_data_analysis")

power_consumption <- read.csv2("household_power_consumption.txt") %>% 
  filter(Date %in% c("1/2/2007","2/2/2007")) %>% mutate(datetime = paste(Date, Time))
power_consumption$datetime <- strptime(power_consumption$datetime, format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(power_consumption, 
     {
       plot(datetime, Global_active_power, type = "l",
                 xlab = "", ylab = "Global Active Power (kilowatts)")
       plot(datetime, Voltage, type = "l")
       plot(datetime, Sub_metering_1, type = "l",
            xlab = "", ylab = "Energy sub metering")
       lines(datetime, Sub_metering_2, col = "red")
       lines(datetime, Sub_metering_3, col = "blue")
       legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
              col = c("black","red","blue"),bty = "n", lty = 1, lwd = 2)
       plot(datetime, Global_reactive_power, type = "l")
     })
dev.off()
