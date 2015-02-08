##full dataset
HPCfull <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                      stringsAsFactors = F)
HPCfull$Date <- as.Date(HPCfull$Date, format="%d/%m/%Y")

##subsetting the data
HPC <- subset(HPCfull, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##converting a character column into a numeric one
HPC$Global_active_power <- as.numeric(HPC$Global_active_power)
HPC$Sub_metering_1 <- as.numeric(HPC$Sub_metering_1)
HPC$Sub_metering_2 <- as.numeric(HPC$Sub_metering_2)
HPC$Voltage <- as.numeric(HPC$Voltage)
HPC$Global_reactive_power <- as.numeric(HPC$Global_reactive_power)

##converting dates
datetime <- paste(as.Date(HPC$Date), HPC$Time)
HPC$Datetime <- as.POSIXct(datetime)

##Plot 1
hist(HPC$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frenquency", col="Red")

##saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


