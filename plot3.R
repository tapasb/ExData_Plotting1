data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data[,"Date"]<-as.Date(data[,"Date"],format="%d/%m/%Y")
d<-data[data$Date==as.Date("2007-02-01")|data$Date==as.Date("2007-02-02"),]
d[,"Global_active_power"]<-as.numeric(as.character(d[,"Global_active_power"]))
d[,"Sub_metering_1"]<-as.numeric(as.character(d[,"Sub_metering_1"]))
d[,"Sub_metering_2"]<-as.numeric(as.character(d[,"Sub_metering_2"]))
d[,"Sub_metering_3"]<-as.numeric(as.character(d[,"Sub_metering_3"]))
png("plot3.png",width = 480, height = 480, units = "px")
plot(as.POSIXct(strptime(paste(d$Date,d$Time), "%Y-%m-%d %H:%M:%S")),d$Sub_metering_1,type="l", lwd=2,xlab="",col="black",ylab="Energy sub metering")
lines(as.POSIXct(strptime(paste(d$Date,d$Time), "%Y-%m-%d %H:%M:%S")),d$Sub_metering_2,col="red")
lines(as.POSIXct(strptime(paste(d$Date,d$Time), "%Y-%m-%d %H:%M:%S")),d$Sub_metering_3,col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , 
       lty=1, col=c('black', 'red', 'blue'), bty='n', cex=.75)
dev.off()