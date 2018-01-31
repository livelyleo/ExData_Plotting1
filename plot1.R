# Plot 1
# Read selected data from the current working directory which has the full data set in txt format
data<-subset(fread("household_power_consumption.txt",colClasses="character"),Date=="1/2/2007"|Date=="2/2/2007")

#Convert Date and Time into one vector
datetime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

#Convert the global active power to numeric class and store as a vector
globalactivepower<-as.numeric(data$Global_active_power)

# Open  the png graphics device and store the histogram in plot1.png
png("plot1.png",width=480,height=480)
hist(globalactivepower,main="Global Active Power", col="red",xlab="Global Active Power (Kilowatts)")
dev.off()
