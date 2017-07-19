#Swirl Lesson Simulation

sample(1:6, 4, replace = TRUE) #simulates four six-sided dice
#Sampling with replacement simply means that each number is "replaced" after it is selected
sample(1:20, 10) #simulates 10 numbers without replacement
LETTERS #shows all the letters
sample(LETTERS) #to permute all 26 letters of the English alphabet
#when sample is not specified, R takes a sample equal in size to the vector from which we're sampling
flips <- sample(c(0,1),100, replace=TRUE, prob = c(0.3,0.7))
#creates a variable flips with a sample 100 times that could be zero or a one
#with a probabilyl of 0 being 0.3 and 1, 0.7 
sum(flips)
rbinom(1, size = 100, prob = 0.7)
flips2 <- rbinom(100, size = 1, prob = 0.7) #creats a random binomial with 100 observations
#size of 1, and probability of 70%
rnorm(10) #will generate 10 random numbers from a standard normal distribution
rnorm(10,mean = 100, sd = 25) #will generate random numbers with defined mean and standard deviation
rpois(5,10) #uses a Poisson distrubtion to plug in some random numbers
my_pois <- replicate(100, rpois(5, 10)) #performs the above operation 100 times
cm <- colMeans(my_pois) #grabs the column means of my distribution
hist(cm) #creates a histogram of the same