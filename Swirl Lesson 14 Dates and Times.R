## Swirl Dates and Times
# dates ae represented by the 'Date' class and times by the 'POSIXct' (seconds since 1970 and 'POSIXlt' seconds,min,hours
d2 <- as.Date("1969-01-01")
t1 <- Sys.time()
unclass(x) ##shows what's inside a time function (or any function?)
## default, Sys.time() returns an object of class POSIXct, but we can coerce the result to POSIXlt with
t2 <- as.POSIXlt(Sys.time()) ##changes the class of a variable to POSIXlt
t2$min
weekdays() ##this function is really nice, returns the week day of a certain date
months() 
quarters() ##returns the quarters function
strptime() ##converts character vectors to POSIXlt
t3 <- "October 17, 1986 08:24"
t4 <- strptime(t3, "%B %d, %Y %H:%M")
## there are a number of operations that you can perform on dates and times, 
## including arithmetic
| operations (+ and -) and comparisons (<, ==, etc.)
sys.time() > t1 ##confirms that the current time is greater than the t1 time I created
difftime() ##which allows you to specify a 'units' parameter.
difftime(Sys.time(), t1, units = 'days')