#Quiz for Week 3

#Question 1
library(datasets)
data("iris")
header(iris)
lapply(iris,class)
iris.width <- iris[101:150,1]
mean(iris.width)
#yields 6.588
#another maybe better approach is 
round(mean(iris[which(iris$Species == "virginica"),]$Sepal.Length))

#Question 2
apply(iris[, 1:4], 2, mean)
#"2" in the above signifies columns, 1 would signal rows

#Question 3
library(datasets)
data("mtcars")
head(mtcars)
split(mtcars, mtcars$cyl) #will split the data across the cyl column
sapply(split(mtcars$mpg, mtcars$cyl), mean)
#there are several ways to arrive at the same conclusion, here, for which the quiz gives options
#Question 4
sapply(s,function(x) colMeans(x[,c("Ozone", "Solar.R", "Wind")],na.rm=TRUE))
#Question 5
# Look into this at a later point
