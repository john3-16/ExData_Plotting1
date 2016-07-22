# By Richard Wheeler
# Script for C4W1 project
# getPlotData.R

getPlotData <- function() {
    inputfile <- file("household_power_consumption.txt", open="rt")
    outputfile <- file("output.txt", open = "wt")
    colnames <- readLines(inputfile,n=1, warn = FALSE)
    colnames <- unlist(strsplit(colnames,split = ";"))
    colnames <- c(paste0(colnames[1], colnames[2],collaspe=""), colnames[3:9])
    while(length(data <- readLines(inputfile,n=1000, warn = FALSE)) > 0) {
        for (i in 1:length(data)) {
            if(any(sapply(as.Date(strsplit(data[i],";")[[1]][1],"%d/%m/%Y"),grepl,"2007-02-01 2007-02-02"))) {
                dline <- paste(format(as.Date(strsplit(data[i],";")[[1]][1],"%d/%m/%Y"),"%Y-%m-%d"),paste(strsplit(data[i],";")[[1]][2:9], collapse = ';'),sep = " ")
                writeLines(dline,outputfile)
            }# Write only data at the sepecified dates
        }
        if(as.Date(strsplit(data[i],";")[[1]][1],"%d/%m/%Y") >= "2007-02-03") break
    }#while LOOP
    close(inputfile)
    close(outputfile)
    
    data <- read.table("output.txt",sep=';',header = FALSE, col.names = colnames, blank.lines.skip = TRUE, stringsAsFactors = FALSE)
    return(data)
}#getPlotData()