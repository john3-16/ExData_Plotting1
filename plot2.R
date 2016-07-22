# By Richard Wheeler
# Script for C4W1 project
# plot2.R

if(!exists("getPlotData", mode="function")) source("getPlotData.R")

plot2 <- function(dispOnly = FALSE, pdata = NULL) {
    if(dispOnly == FALSE)  pdata <- getPlotData()

    plot.ts(pdata$Global_active_power, axes=FALSE, ann=FALSE)
    box()
    title(ylab="Global Active Power (Kilowatts)")
    axis(2, at=c(0,2,4,6))
    axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
    if(dispOnly == FALSE) {
        dev.copy(png,file="plot2.png")
        dev.off()
    }
}#plot2()