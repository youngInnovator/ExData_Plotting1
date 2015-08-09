plot2 <- function(directory) {
        data <- read.csv(directory,header = TRUE, sep = ";", nrows=2881,skip=66636)
        colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        data$Date <- as.Date(data$Date , "%d/%m/%Y")
        data$Time <- strptime(data$Time , "%H:%M:%S")
        
        plot(data$Global_active_power, type = "l", ylab = "Global Active Power (killowatts)", main = "Global Active Power", xaxt="n")
        axis(1, at=1:3, labels =c("Thu", "Fri", "Sat"))
        dev.copy(png, "plot2.png")
        dev.off()
}
