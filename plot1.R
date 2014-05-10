data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data[,"Date"]<-as.Date(data[,"Date"],format="%d/%m/%Y")
d<-data[data$Date==as.Date("2007-02-01")|data$Date==as.Date("2007-02-02"),]
d[,"Global_active_power"]<-as.numeric(as.character(d[,"Global_active_power"]))
png("plot1.png",width = 480, height = 480, units = "px")
hist(d$Global_active_power,xlab="Gloabl Active Power(Kilowatts)",ylab="Frequency",col="red",main="Gloabl Active Power")
dev.off()