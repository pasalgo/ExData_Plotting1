#read the data
all<-read.csv("household_power_consumption.txt",skip=66637,nrows=2880,header=TRUE,sep=";")

#Global active power list to vector
GAP<-c(do.call("cbind",all[3]))
Vol<-c(do.call("cbind",all[5]))
m1<-c(do.call("cbind",all[7]))
m2<-c(do.call("cbind",all[8]))
m3<-c(do.call("cbind",all[9]))
GRP<-c(do.call("cbind",all[4]))

#Date to vector
d<-c()
for (i in 1:length(all[,1])) d<-c(d,paste(all[i,1],all[i,2]))
da<-strptime(d, format="%d/%m/%Y %H:%M:%S")


#perform the plot
par(mfrow = c(2, 2))
plot(da,GAP,type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(da,Vol,type="l",ylab="Voltage",xlab="datetime")

plot(da,m1,type="l",ylab="Energy sub metering",xlab="")
lines(da,m2,col="red")
lines(da,m3,col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5)

plot(da,GRP,type="l",ylab="Global_reactive_power",xlab="datetime")


#Export the plot to png file
dev.copy(png,"plot4.png")

#close the graphic device
dev.off()