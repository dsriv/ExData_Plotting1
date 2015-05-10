#Read using read.table
ep <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?");

#Create a new Date+Time Column, column 10
ep$DateTime <- strptime(paste(ep$Date, ep$Time), format = "%d/%m/%Y %H:%M:%S")

#Fix Date Formatting
ep$Date <- as.Date(ep$Date, "%d/%m/%Y")

#Select a subset of the data frame, only use specified dates
ep_sub <- ep[ep$Date %in% as.Date(c('01/02/2007', '02/02/2007'), "%d/%m/%Y"), ]


#Generate plot
png(file = "plot2.png", width=480,height=480)
plot(ep_sub[,10], ep_sub[,3], xlab="", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()