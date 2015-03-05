#read the data
all<-read.csv("household_power_consumption.txt",skip=66637,nrows=2880,header=TRUE,sep=";")

#Global active power list to vector
x<-c(do.call("cbind",all[3]))

#perform the histogram
hist(x,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#Export the plot to png file
dev.copy(png,"plot1.png")

#close the graphic device
dev.off()