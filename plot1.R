install.packages("sqldf")
library(sqldf)
install.packages("lubridate")
library(lubridate)
dset <- read.csv.sql("household_power_consumption.txt", 
                     "select * from file where Date='1/2/2007' or Date = '2/2/2007'",
                     sep = ";")
dset[dset == "?"] <- NA
dset$Date <- dmy(dset$Date)

#Plot 1
hist(dset$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

#Export png file
dev.copy(png, file="plot1.png", height=480, width=480)

#Close graphics device
dev.off()