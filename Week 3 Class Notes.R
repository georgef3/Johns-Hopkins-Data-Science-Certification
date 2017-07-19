#Class Notes for R Programming Week 4

str #function will give you one line of output for the question, what's in this object?
str(str)
library(datasets)
head(airquality)
str(airquality)
s<- split(airquality, airquality$Month)

#Simluation in R
x <- rnorm(10)
x <- rnorm(10,20,2) #Ten rn variables with mean of 20 and sd of 2
set.seed(1) #if you want generate the same set of random numbers we can set
# a seed with any integer, setting the sequence of random variables to occur
rpois(10,1) #will generate 10 random variables with a rate of 1
set.seed(20)
x <- rnorm(100)
e <- rnorm(100,0,2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x,y)

#Sample functions in R
set.seed(1)
sample(1:10,4)
sample(letters,5)
sample(1:10,replace = TRUE)
