##Plot 4.R

## for this code to run, we need to install the package sqldf using 
## the command "install.packages("sqldf")" [if not already installed]

require("sqldf")

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

myTab <- read.csv.sql("household_power_consumption.txt",sql=mySql,sep=";")

myTab$myDate <- strptime(paste(myTab$Date, myTab$Time), "%d/%m/%Y %H:%M:%S",tz="EST")

## Plot 4
png(file="plot4.png")
par(mfrow = c(2,2),mar=c(4,4,2,1))

plot(myTab$myDate, myTab$Global_active_power,type="l",xlab="",ylab="Global Active Power")

plot(myTab$myDate, myTab$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(myTab$myDate, myTab$Sub_metering_1,type="s",col="black",xlab="",ylab="Energy sub metering")
lines(myTab$myDate, myTab$Sub_metering_2,type="s",col="red")
lines(myTab$myDate, myTab$Sub_metering_3,type="s",col="blue")
legend("topright",bty="n",cex=1,lty = 1, lwd=2,col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(myTab$myDate, myTab$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()

## End of Code

