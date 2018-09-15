install.packages("sqldf")
library(sqldf)
install.packages("lubridate")
library(lubridate)
dset <- read.csv.sql("household_power_consumption.txt", 
                     "select * from file where Date='1/2/2007' or Date = '2/2/2007'", sep = ";")
dset[dset == "?"] <- NA
dset$Date <- dmy(dset$Date)
#Plot 3
date_Time <- paste(dset$Date, dset$Time)
dset$Date_Time <- ymd_hms(date_Time)
plot(dset$Sub_metering_1~dset$Date_Time, 
     type="l", ylab="Energy Sub Metering", xlab="")
lines(dset$Sub_metering_2~dset$Date_Time, col = "Red")
lines(dset$Sub_metering_3~dset$Date_Time, col = "Blue")
legend("topright",col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Export png file
dev.copy(png, file="plot3.png", height=480, width=480)
#Close graphics device
dev.off()
