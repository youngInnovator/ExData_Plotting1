plot3 <- function(directory) {
        data <- read.csv(directory,header = TRUE, sep = ";", nrows=2880,skip=66636)
        colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        data$Date <- as.Date(data$Date , "%d/%m/%Y")
        data$Time <- strptime(data$Time , "%H:%M:%S")
        
        
        plot(data$Sub_metering_1, type = "l", ylab = "Energy Sub metering", main = "", xaxt="n")
        lines( data$Sub_metering_2, col = "red")
        lines( data$Sub_metering_3, col = "blue")
        legend("topright", lty = c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.5)
        axis(1, at=1:3, labels =c("Thu", "Fri", "Sat"))
        dev.copy(png, "plot3.png")
        dev.off()
}
