##Plot 3.R

## for this code to run, we need to install the package sqldf using 
## the command "install.packages("sqldf")" [if not already installed]

require("sqldf")

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

myTab <- read.csv.sql("household_power_consumption.txt",sql=mySql,sep=";")

myTab$myDate <- strptime(paste(myTab$Date, myTab$Time), "%d/%m/%Y %H:%M:%S",tz="EST")

## Plot 3
png(file="plot3.png")
plot(myTab$myDate, myTab$Sub_metering_1,type="s",col="black",xlab="",ylab="Energy sub metering")
lines(myTab$myDate, myTab$Sub_metering_2,type="s",col="red")
lines(myTab$myDate, myTab$Sub_metering_3,type="s",col="blue")
legend("topright",lty = 1, lwd=2,col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

## End of Code