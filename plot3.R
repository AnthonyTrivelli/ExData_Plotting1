##Read the table in
data <- read.table( "household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

## Convert text date to a real Date field for filtering and display
data$Date <- as.Date(data$Date, "%d/%m/%Y")


## Filter the data for just the requested 2 days
subdata <- subset( data, data$Date== "2007-02-01" | data$Date== "2007-02-02")
subdata$TimeDay<- strptime( paste( subdata$Date, subdata$Time), "%Y-%m-%d %H:%M:%S" )

## Transform the measures to a numberic; Note: any of the "?" were removed by the date filter
## since they do not occur during this 2 day period
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
subdata$Sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3 <- as.numeric(subdata$Sub_metering_3)


## Plot the line graph
plot( subdata$TimeDay, subdata$Sub_metering_1, type= "n", xlab= "", ylab="Global Access Power(kilowatts)" )
lines( subdata$TimeDay, subdata$Sub_metering_1 )
lines( subdata$TimeDay, subdata$Sub_metering_2, col= "Red" )
lines( subdata$TimeDay, subdata$Sub_metering_3, col= "Blue" )

legend( "topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



## Convert to PNG Device format and save to plot1.png
dev.copy(png, file= "plot3.png" )


## deactivate the PNG device
dev.off()
