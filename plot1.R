plot1 <- function(directory) {
        data <- read.csv(directory,header = TRUE, sep = ";", nrows=2880,skip=66636)
        colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        data$Date <- as.Date(data$Date , "%d/%m/%Y")
        data$Time <- strptime(data$Time , "%H:%M:%S")
        
        hist(data$Global_active_power, xlab = "Global Active Power (killowatts)", col = "red", main = "Global Active Power")
        dev.copy(png, "plot1.png")
        dev.off()
}
