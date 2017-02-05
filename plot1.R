## Assignment1 - plot1

#to read only subset of the dataset. Use read.table() command and grep()
File <- file("household_power_consumption.txt")
data <- read.table(text= grep("^[1,2]/2/2007", readLines(File), value = TRUE), sep = ";", header = TRUE)

#adding column names so can manipulate columns
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1" , "Sub_metering_2" , "Sub_metering_3")

#to plot the histogram and save it as png file
#have to first open a png graphic device, plot , and close the graphic device
png(filename = "plot1.png")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
