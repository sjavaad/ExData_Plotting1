##PLot 1.R

## for this code to run, we need to install the package sqldf using 
## the command "install.packages("sqldf")" [if not already installed]

require("sqldf")

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

myTab <- read.csv.sql("household_power_consumption.txt",sql=mySql,sep=";")

myTab$myDate <- strptime(paste(myTab$Date, myTab$Time), "%d/%m/%Y %H:%M:%S",tz="EST")

## Plot 1
png(file="plot1.png")
hist(myTab$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red")

dev.off()

## End of Code