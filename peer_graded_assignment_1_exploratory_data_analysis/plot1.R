library(dplyr)
setwd("~/My R/datasciencecoursera/peer_graded_assignment_1_exploratory_data_analysis")

power_consumption <- read.csv2("household_power_consumption.txt") %>% filter(Date %in% c("1/2/2007","2/2/2007"))
power_consumption$Date <- as.Date(power_consumption$Date, format = "%d/%m/%Y")

png(filename = "plot1.png", width = 480, height = 480, units = "px")
with(power_consumption, hist(as.numeric(Global_active_power), xlab = "Global Active Power (kilowatts)", 
                             main = "Global Active Power", col = "red"))
dev.off()
