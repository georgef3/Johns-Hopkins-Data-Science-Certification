#R Programming Assignment 2 - Lexical Scoping

#This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
        inversecache <- NULL
        set <- function(y) {
                x <<- y
                inversecache <<- NULL
        }
        get <- function() x
        setinverse <- function(cachesolve) inversecache <<- cacheSolve
        getinverse <- function() inversecachelib
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

#This function computes the inverse of the special "matrix" returned by 
#makeCacheMatrix above
cacheSolve <- function(x, ...) {
        inversecache <- x$getinverse()
        if(!is.null(inversecache)) {
                message("getting cached data")
                return(inversecache)
        }
        data <- x$get()
        inversecache <- solve(data, ...)
        x$setinverse(inversecache)
        inversecache
}