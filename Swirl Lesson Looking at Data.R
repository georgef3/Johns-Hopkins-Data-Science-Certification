#Swirl Lesson Look at Data
ls() #shows current variables
class(plants) #shows the class of the variable "plants"
dim(plants) #shows rows and columns for plants
# 5166 rows and 10 columns
nrow(plants) #shows the number of rows
ncol(plants) #show the number of columns
object.size(plants) #shows the size of the dataset
names(plants) #gives variable names for plants
head(plants) #shows the first few rows
head(plants,10) #shows the first 10 rows of plants
tail(plants,15) #shows the last 15 rows of plants
summary(plants) #displays the minimum, 1st quartile, median, mean, 3rd quartile, and maximum
table(plants$Active_Growth_Period) #shows the Active Growth Period by Count
str(plants)
