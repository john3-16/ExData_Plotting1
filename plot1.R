# By Richard Wheeler
# Script for C4W1 project
# plot1.R

plot1 <- function() {
    if(!exists("getPlotData", mode="function")) source("getPlotData.R")
    pdata <- getPlotData()
    hist(pdata$Global_active_power, breaks = 36, xaxt='n', col = "red",
         main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)",
         ylim = c(0,1200))
    axis(side = 1, at=seq(0,6,2), labels=seq(0,6,2))
    dev.copy(png,file="plot1.png")
    dev.off()
}#plot1()
