data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data[,"Date"]<-as.Date(data[,"Date"],format="%d/%m/%Y")
d<-data[data$Date==as.Date("2007-02-01")|data$Date==as.Date("2007-02-02"),]
d[,"Global_active_power"]<-as.numeric(as.character(d[,"Global_active_power"]))
png("plot2.png",width = 480, height = 480, units = "px")
plot(as.POSIXct(strptime(paste(d$Date,d$Time), "%Y-%m-%d %H:%M:%S")),d$Global_active_power,type="l", lwd=2,xlab="",ylab="Global active power(Kilowatts)")
dev.off()