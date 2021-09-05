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


# create histogram with Global_active_power
with(powerconsum, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power"))

# create png 
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()