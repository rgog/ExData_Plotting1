install.packages("sqldf")
library(sqldf)
install.packages("lubridate")
library(lubridate)
dset <- read.csv.sql("household_power_consumption.txt", 
                     "select * from file where Date='1/2/2007' or Date = '2/2/2007'", sep = ";")
dset[dset == "?"] <- NA
dset$Date <- dmy(dset$Date)
#Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dset, {
  plot(Global_active_power~Date_Time, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
  plot(Voltage~Date_Time, type="l", 
       ylab="Voltage (volt)", xlab="", cex=0.8)
  plot(Sub_metering_1~Date_Time, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
  lines(Sub_metering_2~Date_Time,col='Red')
  lines(Sub_metering_3~Date_Time,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5)
  plot(Global_reactive_power~Date_Time, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="", cex=0.8)
})
#Export png file
dev.copy(png, file="plot4.png", height=480, width=480)
#Close graphics device
dev.off() 