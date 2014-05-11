URI <- "exdata-data-household_power_consumption/household_power_consumption.txt"
data <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$Date1 <- as.Date(data$Date,"%d/%m/%Y")
febData <- subset(data,(Date1 == "2007-02-01" | Date1 == "2007-02-02"))
febData$datetime <- strptime(paste(febData$Date,febData$Time),"%d/%m/%Y %H:%M:%S")
png("plot1.png")
hist(febData$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
