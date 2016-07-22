# By Richard Wheeler
# Script for C4W1 project
# plot3.R

if(!exists("getPlotData", mode="function")) source("getPlotData.R")

plot3 <- function(dispOnly = FALSE, pdata = NULL) {
    boxtype <- "o"
    textwidth <- 600
    if(dispOnly == FALSE) {  
        pdata <- getPlotData()
    } else {
        boxtype <- "n"
        textwidth <- 1050
    }
    
    plot(pdata$Sub_metering_1, type="n", xaxt="n", ylab="Energy sub metering")
    lines(pdata$Sub_metering_1,type="l")
    lines(pdata$Sub_metering_2,type="l",col="red")
    lines(pdata$Sub_metering_3,type="l",col="blue")
    axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,
           text.width = textwidth, cex=.75, y.intersp = .75, bty = boxtype)

    if(dispOnly == FALSE) {
        dev.copy(png,file="plot3.png")
        dev.off()
    }
}#plot3()