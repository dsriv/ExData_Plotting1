#Read the Data
ep <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?");

#Date + Time formatting
ep$DateTime <- strptime(paste(ep$Date, ep$Time), format = "%d/%m/%Y %H:%M:%S")
ep$Date <- as.Date(ep$Date, "%d/%m/%Y")
ep_sub <- ep[ep$Date %in% as.Date(c('01/02/2007', '02/02/2007'), "%d/%m/%Y"), ]


#Start Plotting
png(file = "plot4.png", width=480,height=480)


#Column Wise Plot Arrangement
par(mfcol = c(2,2))


#Top Left
plot(ep_sub[,10], ep_sub[,3], type = "l", xlab = "", ylab="Global Active Power")


#Bottom Left
plot(ep_sub[,10], ep_sub[,7], type = "l", xlab = "", ylab="Energy sub metering")
points(ep_sub[,10], ep_sub[,8], col = "red", type = "l")
points(ep_sub[,10], ep_sub[,9], col = "blue", type = "l")
legend('topright', legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty =1)


#Top Right
plot(ep_sub[,10], ep_sub[,5], type = "l", xlab = "datetime", ylab="Voltage")


#Bottom Right
plot(ep_sub[,10], ep_sub[,4], type = "l", xlab = "datetime", ylab="Global_reactive_power")

dev.off()