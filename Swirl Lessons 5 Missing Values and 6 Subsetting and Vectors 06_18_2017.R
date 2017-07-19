## swirl Lesson 5: Missing Values
y <- rnorm(1000)
z <- rep(NA,1000) ## Creates 1000 NA's
my_data <- sample(c(y,z),100) ##selectS A sample of 100 elements at random from these 2000 values in y and z
my_na <- is.na(my_data)## tells us whether each element of a vector is NA
my_data ==NA ##The reason you got a vector of all NAs is that NA 
sum(my_na) ##Counts the total number of items in a vector, in this excersise my vector that includes NAs
#NaN stands for Not a Number
#Inf stands for Infinity

## swirl Lesson 6: Subsetting Vectors
x[is.na(x)] ##yields a
## vector of logical values the same length as x, with TRUEs corresponding to NA values in x and FALSEs
## corresponding to non-NA values in x.
y <- x[!is.na(x)] #gives us the negation of a logical expression and puts them in y
y[y > 0] ##shows all of the positive elements of y
x[x > 0] ## isolates the positive elements of x
x[!is.na(x) & x > 0] ## gives the subset of x that IS NOT NA and is greater than zero 
x[c(3,5,7)] ##subset the 3rd, 5th, and 7th elements of x
x[c(-2, -10)] ##gives us all elements of x EXCEPT for the 2nd and 10 elements.
x[-c(2, 10)] ##shorthand way to show the above
vect <- c(foo = 11, bar = 2, norf = NA) #names the listed numbers "foo", "bar", and "norf"
names() #function will show the names of a passed vector
vect2 <- c(11,2,NA)
names(vect2) <- c("foo", 'bar', "norf") ##assigns names to the listed elemens of vect2
vect["bar"] ##gives the second element of vect
vect[c("foo", "bar")] ##specifies a vector with names "foo", and "bar"