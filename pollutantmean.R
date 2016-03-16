pollutantmean <- function(directory, pollutant, id=1:332) {
    setwd(directory)
    files<-list.files()
    # filename<-paste("0",files[1],".csv",sep="")
    # paste(directory, "/", formatC(id, width=3, flag="0"), ".csv", sep="")
    #x<-read.csv(filename)
    dat<- data.frame()
    for (i in 1:332){
        dat <-rbind(dat,read.csv(files[i]))
    }
    y<-dat[pollutant]
    colMeans(y,na.rm=TRUE)
}