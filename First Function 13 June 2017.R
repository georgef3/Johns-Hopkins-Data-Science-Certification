

above10 <- function(x) {
        use <- x > 10
        x[use]
}


above <- funtion(x,n=10){
        use <- x > n
        x[use]
}

columnmean <- function(y,removeNA = TRUE){
        nc <- ncol(y)
        mean <- numeric(nc)
        for(i in 1:nc){
                means[i] <- mean(y[,i],na.rm = removeNA)
        }
        means
}

add2fixed <- function (5,x = 2){}

args(paste)

lm <- function(x){x*x}

make.power <- function(n){
        pow <- function(x){
                x^n
        }
        pow
}

cube <- make.power(3)
square <-make.power(2)
