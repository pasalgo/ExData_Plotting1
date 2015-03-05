#read the data
all<-read.csv("household_power_consumption.txt",skip=66637,nrows=2880,header=TRUE,sep=";")

#Global active power list to vector
x<-c(do.call("cbind",all[3]))

#Date to vector
d<-c()
for (i in 1:length(all[,1])) d<-c(d,paste(all[i,1],all[i,2]))
da<-strptime(d, format="%d/%m/%Y %H:%M:%S")


#perform the plot
plot(da,x,type="l",ylab="Global Active Power (kilowatts)",xlab="")

#Export the plot to png file
dev.copy(png,"plot2.png")

#close the graphic device
dev.off()