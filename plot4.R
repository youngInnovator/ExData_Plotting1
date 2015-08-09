plot4 <- function(directory) {
        par(mfrow = c(2, 2))
        data <- read.csv(directory,header = TRUE, sep = ";", nrows=2880,skip=66636)
        colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        data$Date <- as.Date(data$Date , "%d/%m/%Y")
        data$Time <- strptime(data$Time , "%H:%M:%S")
        
        plot(data$Global_active_power, type = "l", ylab = "Global Active Power (killowatts)", main = "", xaxt="n")
        axis(1, at=1:3, labels =c("Thu", "Fri", "Sat"))
        
        plot(data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", main = "", xaxt="n")
        axis(1, at=1:3, labels =c("Thu", "Fri", "Sat"))
        
        plot(data$Sub_metering_1, type = "l", ylab = "Energy Sub metering", main = "", xaxt="n")
        lines( data$Sub_metering_2, col = "red")
        lines( data$Sub_metering_3, col = "blue")
        legend("topright", lty = c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.2)
        axis(1, at=1:3, labels =c("Thu", "Fri", "Sat"))
        
        plot(data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive power", main = "", xaxt="n")
        axis(1, at=1:3, labels =c("Thu", "Fri", "Sat"))
        
        dev.copy(png, "plot4.png")
        dev.off()
        
        
}
