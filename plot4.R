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

##Plot4
par(mfrow=c(2,2), mar=c(4,4,2,1))

with(HPC, {
        plot(Datetime, Global_active_power, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Datetime, Voltage, type="l",
             ylab="Voltage", xlab="datetime")
        plot(Datetime, Sub_metering_1, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Datetime, Sub_metering_2, col="red")
        lines(Datetime, Sub_metering_3, col="blue")
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Datetime, Global_reactive_power, type="l", 
             ylab="Global_reactive_power", xlab="datetime")
})

##saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()



