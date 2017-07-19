##Swirl Lesson lapply and sapply
## 4 July 2017
rm(list=ls()) #removes all previous variables
head(flags) #gives the header rows of the dataset
dim(flags) #gives the dimensions of the dataset, in this case showing 194 rows and 30 columns
class(flags) #will show the format of the variables
#but in this case only shows the entire dataset, so we'd like to see each column
lapply() #function takes a list as input, applies a function to each element of the list, then
         # returns a list of the same length as the original one.
cls_list <- lapply(flags, class) #applies the class() function to each column of the flags data
# but don't need the usual parenthesis following the function, here, "class"
as.character(cls_list) #can be simplified to a character vector 
cls_vect <- sapply(flags,class) #will simplify the results in the list of characters
sum(flags$orange) #will show the sum of the orange column of the flags data
flag_colors <- flags[, 11:17] #to extract the columns containing the color data and store
#them in a new data frame called flag_colors, the lack of a number before the comma means we want
#all rows, but then we specify the number of columns afterwards
head(flag_colors) #gives the heading and first few rows of the columns we requested
lapply(flag_colors,sum) #will loop the "sum" function across the "flag_colors" data
sapply(flag_colors,mean) #will loop the "mean" function across the "flag_colors" data
flag_shapes <- flags[, 19:23] #will extract columns 19 through 23 from the flags dataset
lapply(flag_shapes,range) #returns the minimum and maximum of the first argument, here: flag_shapes
shape_mat <- sapply(flag_shapes,range) #stores the range in a simplified list, here a matrix!
unique_vals <- lapply(flags,unique) #shows the unique values in the flags dataset
sapply(unique_vals,length) #will give the number of unique values for each variable
lapply(unique_vals, function(elem) elem[2]) #will return a list containing the second item from each
#element of the unique_vals list, with elem as an anonymous function - not sure why this works

