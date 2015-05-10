#Read data
ep <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?");


#Date & Time formatting. Adding a new column DateTime
ep$DateTime <- strptime(paste(ep$Date, ep$Time), format = "%d/%m/%Y %H:%M:%S")
ep$Date <- as.Date(ep$Date, "%d/%m/%Y")
ep_sub <- ep[ep$Date %in% as.Date(c('01/02/2007', '02/02/2007'), "%d/%m/%Y"), ]


#Plot
png(file = "plot3.png", width=480,height=480)

plot(ep_sub[,10], ep_sub[,7], type = "l", xlab = "", ylab="Energy sub metering")
points(ep_sub[,10], ep_sub[,8], col = "red", type = "l")
points(ep_sub[,10], ep_sub[,9], col = "blue", type = "l")
legend('topright', legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty =1)

dev.off()

