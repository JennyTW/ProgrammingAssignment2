## This R script contains 2 functions :
#1.makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
#2.cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

## Function1 : makeCacheMatrix create a special "matrix", which stores a list of following functions:
# 1.set the value of the matrix
# 2.get the value of the matrix
# 3.set the value of the inverse of a matrix (solve())
# 4.get the value of the inverse of a matrix (solve())

makeCacheMatrix <- function(x = matrix()) {
s <- NULL
    set <- function(y) {
        x <<- y
        s <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) s <<- solve
    getsolve <- function() s
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## Function2 : cacheSolve dose 2 things
# 1. Verify if s ( x$getsolve() from function1 ) exists and is not NULL. If it exists in memory, then it returns a message and the value m.
# 2. If s doesn't exist, then it will 
#     a) Retrive a matrix                  ( data<- x$get() from function1)
#     b) Compute the inverse of the matrix ( s<-solve(data,...) )
#     c) Assign a value to s               ( x$setsolve(s) )

data gets the vector stored with makeVector,
m calculates the mean of the vector and x$setmean(m) stores it in the object generated assigned with makeVector

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        s <- x$getsolve()
        if(!is.null(s)) {
            message("getting cached data")
            return(s)
        }
        data <- x$get()
        s <- solve(data, ...)
        x$setsolve(s)
        s
}
