##Plot 2.R

## for this code to run, we need to install the package sqldf using 
## the command "install.packages("sqldf")" [if not already installed]

require("sqldf")

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

myTab <- read.csv.sql("household_power_consumption.txt",sql=mySql,sep=";")

myTab$myDate <- strptime(paste(myTab$Date, myTab$Time), "%d/%m/%Y %H:%M:%S",tz="EST")

## Plot 2
png(file="plot2.png")
plot(myTab$myDate, myTab$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()

## End of Code
