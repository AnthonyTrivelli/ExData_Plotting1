##Read the table in
data <- read.table( "household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)


## Convert $Date character vector to $Date Date vector

data$Date <- as.Date(data$Date, "%d/%m/%Y")
subdata <- subset( data, data$Date== "2007-02-01" | data$Date== "2007-02-02")

## Transform active power to a numberic
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)


## Plot the histogram
hist( subdata$Global_active_power, col="red", main= "Global Active Power" ,xlab="Global Active Power(killowatts) ")

## Convert to PNG Device format and save to plot1.png
dev.copy(png, file= "plot1.png" )


## deactivate the PNG device
dev.off()
