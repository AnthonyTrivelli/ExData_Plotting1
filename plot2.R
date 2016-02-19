##Read the table in
data <- read.table( "household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)


## Convert text date to Date object for filtering and displaying
data$Date <- as.Date(data$Date, "%d/%m/%Y")


## Grab the 2 days of interest and create a combined date/time
subdata <- subset( data, data$Date== "2007-02-01" | data$Date== "2007-02-02")
subdata$TimeDay<- strptime( paste( subdata$Date, subdata$Time), "%Y-%m-%d %H:%M:%S" )



## Transform active power to a numberic; Note: any of the "?" were removed by the date filter
## since they do not occur during this 2 day period
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)



## Plot the line graph
plot( subdata$TimeDay, subdata$Global_active_power, type= "n", xlab= "", ylab="Global Active Power(kilowatts)" )
lines( subdata$TimeDay, subdata$Global_active_power )


## Convert to PNG Device format and save to plot1.png
dev.copy(png, file= "plot2.png" )


## deactivate the PNG device
dev.off()
