# By Richard Wheeler
# Script for C4W1 project
# plot4.R

if(!exists("getPlotData", mode ="function")) source("getPlotData.R")
if(!exists("plot2", mode = "function")) source("plot2.R")
if(!exists("plot3", mode = "function")) source("plot3.R")

plot4 <- function() {
    par(mfrow=c(2,2))
    pdata <- getPlotData()
    plot2(TRUE, pdata)

    plot(pdata$Voltage, type="n", xaxt="n", ylab="Voltage", xlab = "datetime")
    lines(pdata$Voltage,type="l")
    axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
    #text(1, labels = "datetime", cex = 1)
    
    plot3(TRUE, pdata)
    
    plot(pdata$Global_reactive_power, type="n", xaxt="n", ylab="Global Reactive Power", xlab = "datetime")
    lines(pdata$Global_reactive_power,type="l")
    axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

    dev.copy(png,file="plot4.png")
    dev.off()
}#plot4()