URI <- "exdata-data-household_power_consumption/household_power_consumption.txt"
data <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$Date1 <- as.Date(data$Date,"%d/%m/%Y")
febData <- subset(data,(Date1 == "2007-02-01" | Date1 == "2007-02-02"))
febData$datetime <- strptime(paste(febData$Date,febData$Time),"%d/%m/%Y %H:%M:%S")
png("plot4.png")
par(mfrow=c(2,2))

#plot 1
plot(febData$datetime,febData$Global_active_power,type="l",ylab="Global Active Power (kilowatts)")

#plot 2
plot(febData$datetime,febData$Voltage,type="l",ylab="Voltage")

#plot 3
plot(febData$datetime,febData$Sub_metering_1,type="l",ylim=range(febData$Sub_metering_1,febData$Sub_metering_2,febData$Sub_metering_3),ylab="Energy Sub Metering",xlab="")
lines(febData$datetime,febData$Sub_metering_2,col="orange")
lines(febData$datetime,febData$Sub_metering_3,col="blue")
legend("topright",col=c("black","orange","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=rep(1,3))

#plot 4
plot(febData$datetime,febData$Global_reactive_power,type="l",ylab="Global Reactive Power")


dev.off()
