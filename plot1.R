## Loading the data (it was downloaded manually)
data <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"),sep=";",header=T, dec=".",na.strings = "?")
data<-transform(data, Date=as.Date(Date,format="%d/%m/%Y")) ## Setting dates format
ndata <- subset(data, Date == '2007-02-01' | Date == '2007-02-02') ##Subsetting data for 2 days

Sys.setlocale("LC_TIME", "English")

##Plotting
png("plot1.png",width=480,height=480,units='px')
hist(ndata$Global_active_power, col=2,main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
