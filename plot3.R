# read text file, separate ; 
powerconsum <- read.csv("household_power_consumption.txt", sep = ";")

# convert to date/time class
powerconsum$Date <- as.Date(powerconsum$Date, format = "%d/%m/%Y")
powerconsum$DateTime <- strptime(paste(powerconsum$Date, powerconsum$Time), 
                                 format = "%Y-%m-%d %H:%M:%S")

# select data from 2007-2-1 to 2007-2-2
powerconsum <- powerconsum[powerconsum$Date >= "2007-2-1" & powerconsum$Date <= "2007-2-2",]


# change class for columns 3-8 from character to numeric 
powerconsum[, 3] <- as.numeric(powerconsum[,3])
powerconsum[, 4] <- as.numeric(powerconsum[,4])
powerconsum[, 5] <- as.numeric(powerconsum[,5])
powerconsum[, 6] <- as.numeric(powerconsum[,6])
powerconsum[, 7] <- as.numeric(powerconsum[,7])
powerconsum[, 8] <- as.numeric(powerconsum[,8])

# create plot (type l for lines) for each sub_metering with x axis as days, y axis Energy sub metering
with(powerconsum, plot(powerconsum$DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")) 
with(powerconsum, lines(powerconsum$DateTime, Sub_metering_2, col = "red"))
with(powerconsum, lines(powerconsum$DateTime, Sub_metering_3, col = "blue"))

#add legend to top right
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# create png 
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()