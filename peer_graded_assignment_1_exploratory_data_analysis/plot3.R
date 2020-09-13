library(dplyr)
setwd("~/My R/datasciencecoursera/peer_graded_assignment_1_exploratory_data_analysis")

power_consumption <- read.csv2("household_power_consumption.txt") %>% 
  filter(Date %in% c("1/2/2007","2/2/2007")) %>% mutate(datetime = paste(Date, Time))
power_consumption$datetime <- strptime(power_consumption$datetime, format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(power_consumption,
      {
       plot(datetime, Sub_metering_1, type = "l",
          xlab = "", ylab = "Energy sub metering")
       lines(datetime, Sub_metering_2, col = "red")
       lines(datetime, Sub_metering_3, col = "blue")
      })
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1, lwd = 2)

dev.off()
