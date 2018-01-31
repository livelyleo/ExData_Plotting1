# Plot 1
# Read selected data from the current working directory which has the full data set in txt format
data<-subset(fread("household_power_consumption.txt",colClasses="character"),Date=="1/2/2007"|Date=="2/2/2007")

#Convert Date and Time into one vector
datetime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

#Convert the global active power to numeric class and store as a vector
globalactivepower<-as.numeric(data$Global_active_power)
globalreactivepower<-as.numeric(data$Global_reactive_power)

# Convert the sub metering values to numeric and store them as separate vectors
submetering1<-as.numeric(data$Sub_metering_1)
submetering2<-as.numeric(data$Sub_metering_2)
submetering3<-as.numeric(data$Sub_metering_3)

# Open  the png graphics device and store the histogram in plot1.png
png("plot4.png",width=480,height=480)
#Divide the space into 4 parts, row wise
par(mfrow=c(2,2))

#plot 1 Row:1 Col:1
plot(datetime,globalactivepower,type="l",xlab="",ylab="Global Active Power (Kilowatts)")

#plot 2 Row:1 Col:2
plot(datetime,voltage,type="l",xlab="datetime",ylab="Volatge")

#plot 3 Row:2 Col:1
plot(datetime,submetering1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(datetime,submetering2,col="red")
lines(datetime,submetering3,col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot 4 Row:2 Col:2
plot(datetime,globalreactivepower,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
