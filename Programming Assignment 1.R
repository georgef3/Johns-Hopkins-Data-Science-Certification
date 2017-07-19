Homework Assignment Progamming
# Figuring out how to locate an object by setting a working directory
getwd() ## gets my working directory
ls() ##shows what's in there
list.files() #or dir() shows the files in my working directory
args(list.files) #shows the arguments available in the functionbye
dir.create("testdir")
file.create("mytest.R")
file.exists("mytest.R")
file.info("mytest.R")
file.info("mytest.R")$mode
file.rename("mytest.R", "mytest2.R") # renames the files specified
file.copy("mytest2.R", "mytest3.R")
file.path("mytest3.R") ##provides a file path
dir.create(file.path('testdir2', 'testdir3'), recursive = TRUE) ##allows a file path to be created in within dir

setwd("C:/Users/gfleeson/Desktop/learn/Data Science in R/specdata")
list.files() ##successfully linked my downloaded files into a folder in which I could manipulate the data from!
# https://www.youtube.com/watch?v=QkE8cp0B9gg
#Now, how to build the appropriate function?
#Name all the CSV files one thing "csv_files"
csv_files <- list.files("C:/Users/gfleeson/Desktop/learn/Data Science in R/specdata", full.names = TRUE)

filesD<-list.files("C:/Users/gfleeson/Desktop/learn/Data Science in R/specdata",full.names = TRUE)

dat <- data.frame()

complete <- function(csv_files,id=1:332){
        
        #create a list of files
        filesD<-list.files(csv_files,full.names = TRUE)
        #create an empty data frame
        dat <- data.frame()
        
        for(i in id){
                #read in the file
                temp<- read.csv(filesD[i],header=TRUE)
                #delete rows that do not have complete cases
                temp<-na.omit(temp)
                
                #count all of the rows with complete cases
                tNobs<-nrow(temp)
                
                #enumerate the complete cases by index
                dat<-rbind(dat,data.frame(i,tNobs))
                
        }
        return(dat)
}


