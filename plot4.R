##Read the table in
data <- read.table( "household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

#convert date for filtering and display purposes
data$Date <- as.Date(data$Date, "%d/%m/%Y")


## Just work on the 2 days that were requested
subdata <- subset( data, data$Date== "2007-02-01" | data$Date== "2007-02-02")
subdata$TimeDay<- strptime( paste( subdata$Date, subdata$Time), "%Y-%m-%d %H:%M:%S" )


## Transform active power to a numberic; Note: any of the "?" were removed by the date filter
## since they do not occur during this 2 day period
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
subdata$Sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3 <- as.numeric(subdata$Sub_metering_3)
subdata$Voltage <- as.numeric(subdata$Voltage)
subdata$Global_reactive_power <- as.numeric(subdata$Global_reactive_power)


##setup a plot matrix
par( mfcol= c(2,2) )

plot( subdata$TimeDay, subdata$Global_active_power, type= "n", xlab= "", ylab="Global Active Power(kilowatts)" )
lines( subdata$TimeDay, subdata$Global_active_power )

plot( subdata$TimeDay, subdata$Sub_metering_1, type= "n", xlab= "", ylab="Global Access Power(kilowatts)" )
lines( subdata$TimeDay, subdata$Sub_metering_1 )
lines( subdata$TimeDay, subdata$Sub_metering_2, col= "Red" )
lines( subdata$TimeDay, subdata$Sub_metering_3, col= "Blue" )

## Plot the line graph
plot( subdata$TimeDay, subdata$Voltage, type= "n", ylab="Voltage" ,xlab="datetime")
lines( subdata$TimeDay, subdata$Voltage )


plot( subdata$TimeDay, subdata$Global_reactive_power, type= "n" ,xlab="datetime")
lines( subdata$TimeDay, subdata$Global_reactive_power )



## Convert to PNG Device format and save to plot1.png
#dev.copy(png, file= "plot3.png" )


## deactivate the PNG device
#dev.off()
