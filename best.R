best<-function(state,outcome){
    outcomedata<-read.csv("outcome-of-care-measures.csv",colClasses = "character")
    if(any(outcomedata$State==state)==FALSE){
        message("invalid state")
    }
    
    s<-state
    q<-subset(outcomedata,outcomedata$State==s)
    
    if(outcome!="heart attack" && outcome!="heart failure" && outcome!= "pneumonia"){
        stop("invalid outcome")
    }
    if(outcome=="heart attack"){
        y<-q[which.min(q$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),]
    }
    if(outcome=="heart failure"){
        y<-q[which.min(q$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),]
    }
    if(outcome=="pneumonia"){
        y<-q[which.min(q$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),]
    }
    w<-y[2]
    w
    #which.min pulls first min, doesn't allow for ties
}