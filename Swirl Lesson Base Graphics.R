#Swirl Lesson Base Graphics
data(cars)
?cars
head(cars)
dim()
names()
head()
tail()
summary()
plot(cars$dist,cars$speed)
?plot
plot(x = cars$speed, y = cars$dist, xlab = "Speed", ylab = "Stopping Distance") #sets the xaxis label to Speed
plot(cars, sub = "My Plot Subtitle") #creates the plot with the mentioned subtitle
?par #explores the many arguments that can be passed
plot(cars, col = 2) #makes the plotted elements red
plot(cars, xlim = c(10,15)) #sets the x parameters to 10 and 15
?points #provedes the details of the shapes that can be used
plot(cars, pch = 2) #pch is a shape argument, 2 is for triangles
boxplot(formula = mpg ~ cyl,data = mtcars) #creates a cool box and whisker plot
hist(mtcars$mpg) #creates a histogram with a mpg as a vectors
?ggplot