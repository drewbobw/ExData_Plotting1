#Andrew Warlick
# Coursera Ex_data Plotting Proj. 1 Plot 1 

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
#Plot 1
png("plot1.png")
hist(household$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
     main="Global Active Power") 
dev.off()