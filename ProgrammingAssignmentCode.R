#Programming Assignment 3
setwd("C:/Users/gfleeson/Desktop/learn/Data Science in R/ProgrammingAssignment3")
list.files()
read.csv("hospital-data.csv")
read.csv("hospital-data.csv")

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
str(outcome)
ncol(outcome) #shows the number of columns or variables in the data set
nrow(outcome) #Shows the number of rows in the data set
names(outcome) #shows the names of each variable across the columns
outcome[, 11] <- as.numeric(outcome[, 11]) #makes column 11 numeric
str(outcome[11]) #shows the type of characters in the formula
colMeans(outcome[11])
?colMeans
colMeans(outcome[11],na.rm=TRUE) #gives me the mean of the column, exluding NA values
hist(outcome[, 11]) #gives a histogram of the column specified
"TX" %in% outcome$State
evaluate(function(x){x+1}, 6)

#best(function(state,outcome))
state <- "RI"
if(is.element(my_state,outcome$State)==FALSE) stop("Invalid state") #validates whether the state is correct
colnames(outcome)
#heart attack is at 12, heart failure is at 17, pneumonia is at 23, 
        
        
        
        
        elif
statecount(function(mystate,count){
        count <- length(which(outcome$State == mystate))
}
        ) <- length(which(outcome$State == "RI"))

best <- (state,outcome){
        state <- 
}
