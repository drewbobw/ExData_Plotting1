#Andrew Warlick
# Coursera Ex_data Plotting Proj. 1 Plot 2

#==================================================
# Libraries
library(data.table) 
library(sqldf)
#==================================================
#Import and clean data; assumes already downloaded
setwd("~/Documents/Coursera/Exploratory/Project/");

household<-read.csv.sql("household_power_consumption.txt", 
                        sql= "select * from file where Date IN ('1/2/2007','2/2/2007')", sep=";");

household$DT<-paste(household$Date, household$Time);
household$DT<-as.POSIXct(household$DT, format="%d/%m/%Y %H:%M:%S");
"Global Active Power (kilowatts)";
#==================================================
#Plot 2
png("plot2.png")
with(household, plot(DT, Global_active_power,pch="",
                     ylab="Global Active Power (kilowatts)", xlab=""))
with(household, lines(DT, Global_active_power, type="l"))
dev.off()