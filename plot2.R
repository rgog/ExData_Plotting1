install.packages("sqldf")
library(sqldf)
install.packages("lubridate")
library(lubridate)
dset <- read.csv.sql("household_power_consumption.txt", 
                     "select * from file where Date='1/2/2007' or Date = '2/2/2007'", sep = ";")
dset[dset == "?"] <- NA
dset$Date <- dmy(dset$Date)
#Plot 2
date_Time <- paste(dset$Date, dset$Time)
dset$Date_Time <- ymd_hms(date_Time)
plot(dset$Global_active_power~dset$Date_Time, 
     type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Export png file
dev.copy(png, file="plot2.png", height=480, width=480)
#Close graphics device
dev.off() 