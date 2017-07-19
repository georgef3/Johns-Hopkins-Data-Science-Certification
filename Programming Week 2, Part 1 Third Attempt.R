##Programming Week 2, Part 1 Third Attempt
dup <- numeric() #createss a numeric vector
nums <- c(2,6,3,2,5,6)
for (num in nums){ #constructed my first for loop here in R, awesome!
        dup <-c(dup,num)
}
setwd("C:/Users/gfleeson/Desktop/learn/Data Science in R/specdata") #sets my working directory
read.csv("01.csv") #will display what's in the named csv
head(data) #will show the top few lines of data for a specific set
setwd(c)
list.files() #or dir() shows the files in my working directory
read.csv("331.csv") #will display what's in the named csv

specdata <- "C:/Users/gfleeson/Desktop/learn/Data Science in R/specdata" #creates a variable for the working directory I want
pollutantmean <- function(directory,pollutant, id = 1:332){
        filelist <- list.files(path = directory, pattern= ".csv", full.names = TRUE)
        values <- numeric()
        
        for(i in id){
                data <- read.csv(filelist[i])
                values <- c(values,data[[pollutant]])
        }
        mean(values,na.rm = TRUE)
}