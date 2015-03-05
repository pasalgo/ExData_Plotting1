#read the data
all<-read.csv("household_power_consumption.txt",skip=66637,nrows=2880,header=TRUE,sep=";")

#Global active power list to vector
x<-c(do.call("cbind",all[7]))
y<-c(do.call("cbind",all[8]))
z<-c(do.call("cbind",all[9]))

#Date to vector
d<-c()
for (i in 1:length(all[,1])) d<-c(d,paste(all[i,1],all[i,2]))
da<-strptime(d, format="%d/%m/%Y %H:%M:%S")

#perform the plot
plot(da,x,type="l",ylab="Energy sub metering",xlab="")
lines(da,y,col="red")
lines(da,z,col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Export the plot to png file
dev.copy(png,"plot3.png")

#close the graphic device
dev.off()