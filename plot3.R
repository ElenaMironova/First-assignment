## Loading the data (it was downloaded manually)
data <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"),sep=";",header=T, dec=".",na.strings = "?")
data<-transform(data, Date=as.Date(Date,format="%d/%m/%Y")) ## Setting dates format
ndata <- subset(data, Date == '2007-02-01' | Date == '2007-02-02') ##Subsetting data for 2 days
ndata$dateTime <- strptime(paste(ndata$Date,ndata$Time), format="%Y-%m-%d %H:%M:%S") ##Adding a date-time variable
Sys.setlocale("LC_TIME", "English")

##Plotting
png("plot3.png",width=480,height=480,units='px')
plot(ndata$dateTime, ndata$Sub_metering_1, type="l",xlab="",ylab="Energy sub metering")
lines(ndata$dateTime,ndata$Sub_metering_3, type="l", col=4)
lines(ndata$dateTime,ndata$Sub_metering_2, type="l", col=2)
legend("topright", pch = "_", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off() 
