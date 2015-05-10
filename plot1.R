#Read file, store into Data Frame ep
ep <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?");

#Fix Date formatting
ep$Date <- as.Date(ep$Date, "%d/%m/%Y")

#Subset, only pick required dates
ep_sub <- ep[ep$Date %in% as.Date(c('01/02/2007', '02/02/2007'), "%d/%m/%Y"), ]


#Plot Histogram
png(file = "plot1.png", width=480,height=480)
hist(ep_sub[,3], xlab="Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main="Global Active Power")
dev.off()
