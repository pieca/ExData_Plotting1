Sys.setlocale("LC_TIME", "English")
par(mar = c(5, 5, 2, 1), pty = "s", mfrow = c(1, 1))
hpc <- read.table(file = "household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)
names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colnames(hpc) <- names
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
with(hpc, plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(hpc, points(datetime, Sub_metering_2, type = "l", col = "red"))
with(hpc, points(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.6)
dev.copy(png, file = "plot3.png")
dev.off()