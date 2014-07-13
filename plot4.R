## Loading the data (it was downloaded manually)
data <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"),sep=";",header=T, dec=".",na.strings = "?")
data<-transform(data, Date=as.Date(Date,format="%d/%m/%Y")) ## Setting dates format
ndata <- subset(data, Date == '2007-02-01' | Date == '2007-02-02') ##Subsetting data for 2 days
ndata$dateTime <- strptime(paste(ndata$Date,ndata$Time), format="%Y-%m-%d %H:%M:%S") ##Adding a date-time variable
Sys.setlocale("LC_TIME", "English")

##Plotting
png("plot4.png",width=480,height=480,units='px')
par(mfrow=c(2,2))
with(ndata,plot(dateTime, Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")) 
with(ndata, plot(dateTime,Voltage,type="l",xlab="datetime",ylab="Voltage"))
with(ndata,{
plot(dateTime, Sub_metering_1, type="l",xlab="",ylab="Energy sub metering")
lines(dateTime,Sub_metering_3, type="l", col=4)
lines(dateTime,Sub_metering_2, type="l", col=2)
})
legend("topright", pch = "_", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty="n",pt.cex=1)
plot(ndata$Global_reactive_power,type="l",xlab="datetime")

dev.off() 

