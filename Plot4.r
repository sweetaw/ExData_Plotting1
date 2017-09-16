##Preparing data

#Download
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "C:\\Users\\Anthony\\Documents\\Data Science Course\\course4\\week1.zip")

#Unzip
zipF<- "C:\\Users\\Anthony\\OneDrive\\Documents\\Data Science Course\\week1.zip"
outDir<-"C:\\Users\\Anthony\\OneDrive\\Documents\\Data Science Course\\week1"
unzip(zipF,exdir=outDir)

#Read data accounting for seperators and na strings
dt <- read.table("C:\\Users\\Anthony\\OneDrive\\Documents\\Data Science Course\\week1\\household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")

#Subset by the required dates
dt2 <- dt[dt$Date %in% c("1/2/2007","2/2/2007"),]

SetTime <-strptime(paste(dt2$Date, dt2$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

dt2 <- cbind(SetTime, dt2)

##Plotting the data
#Plot 4

labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(dt2$SetTime, dt2$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(dt2$SetTime, dt2$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(dt2$SetTime, dt2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dt2$SetTime, dt2$Sub_metering_2, type="l", col="red")
lines(dt2$SetTime, dt2$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(dt2$SetTime, dt2$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png,"Plot4.png",width=480,height=480,units="px")
dev.off()