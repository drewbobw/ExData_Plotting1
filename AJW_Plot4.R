#Andrew Warlick
# Coursera Ex_data Plotting Proj. 1 Plot 4

#==================================================
# Libraries
library(data.table) 
library(sqldf)
#==================================================================
#Import and clean data; assumes already downloaded
setwd("~/Documents/Coursera/Exploratory/Project/");

household<-read.csv.sql("household_power_consumption.txt", 
                        sql= "select * from file where Date IN ('1/2/2007','2/2/2007')", sep=";");

household$DT<-paste(household$Date, household$Time);
household$DT<-as.POSIXct(household$DT, format="%d/%m/%Y %H:%M:%S");
"Global Active Power (kilowatts)";
#====================================================================
#Plot 4
png("plot4.png")
par(mfrow=c(2,2))
#Plot 4.1
with(household, plot(DT, Global_active_power,pch="", 
                     ylab="Global Active Power (kilowatts)", xlab=""))
with(household, lines(DT, Global_active_power, type="l"))
#===========================================================
#Plot 4.2
with(household, plot(DT, Voltage,pch="", ylab="Voltage", xlab="datetime"))
with(household, lines(DT, Voltage, type="l"))
#===========================================================
#Plot 4.3
with(household, plot(DT, Sub_metering_1, pch="", ylab="Energy sub metering",xlab=""))
with(household, lines(DT, Sub_metering_1, type="l", col="black"))
with(household, points(DT, Sub_metering_2,pch="" ))
with(household, lines(DT, Sub_metering_2, type="l", col="red"))
with(household, points(DT, Sub_metering_3,pch="" ))
with(household, lines(DT, Sub_metering_3, type="l", col="blue"))
legend("topright",pch="", col=c("black","red","blue"), lwd=1, bty='n',
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

#===========================================================
#Plot 4.4
with(household, plot(DT, Global_reactive_power,pch="", xlab="datetime"))
with(household, lines(DT, Global_reactive_power, type="l"))

dev.off()