#Assignment1- Plot3

#to read only subset of the dataset. Use read.table() command and grep()
File <- file("household_power_consumption.txt")
data <- read.table(text= grep("^[1,2]/2/2007", readLines(File), value = TRUE), sep = ";", header = TRUE)

#adding column names so can manipulate columns
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1" , "Sub_metering_2" , "Sub_metering_3")

# to change the format of the date and time for plotting
dateTime <- paste(as.Date(data$Date, format = "%d/%m/%Y"), data$Time)
data$DateTime <- as.POSIXct(dateTime)

#to plot
png(filename = "plot3.png")
with(data, { plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering", xlab="")
             lines(Sub_metering_2 ~ DateTime, col = "red")
             lines(Sub_metering_3 ~ DateTime, col = "blue")
             })
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
       