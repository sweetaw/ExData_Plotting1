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
#Plot 1

hist(dt2$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png,"Plot1.png",width=480,height=480,units="px")