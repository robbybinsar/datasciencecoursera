library(dplyr)
setwd("~/My R/datasciencecoursera/peer_graded_assignment_1_exploratory_data_analysis")

power_consumption <- read.csv2("household_power_consumption.txt") %>% filter(Date %in% c("1/2/2007","2/2/2007")) %>%
  mutate(datetime = paste(Date, Time))
power_consumption$datetime <- strptime(power_consumption$datetime, format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(power_consumption, 
     plot(datetime, Global_active_power, type = "l",
          xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
