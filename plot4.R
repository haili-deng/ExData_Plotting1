hpc<-read.table(".\\household_power_consumption.txt",sep=";",quote = "\"",dec = ".",header=TRUE,stringsAsFactors=FALSE)
hpc$Date<-as.Date(hpc$Date,format="%d/%m/%Y")
a<-subset(hpc,Date=="2007-2-1")
b<-subset(hpc,Date=="2007-2-2")
x<-rbind(a,b)
z<-paste(x[,1],x[,2])
z<-strptime(z,format="%Y-%m-%d %H:%M:%S")

png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
par(mfcol=c(2,2))

x[,3]<-as.numeric(x[,3])
plot(z,x[,3],type="s",xlab="",ylab="Global Active Power")

x[,7]<-as.numeric(x[,7])
x[,8]<-as.numeric(x[,8])
x[,9]<-as.numeric(x[,9])
plot(z,x[,7],type="s",xlab="",ylab="Energy sub metering",col="black")
lines(z,x[,8],type="s",col="red")
lines(z,x[,9],type="s",col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="",col=c("black","red","blue"),lwd=1,bty="n")

x[,5]<-as.numeric(x[,5])
plot(z,x[,5],type="s",ylab="Voltage",xlab="datetime")

x[,4]<-as.numeric(x[,4])
plot(z,x[,4],type="s",ylab="Global_reactive_power",xlab="datetime")

dev.off()
