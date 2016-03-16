## makeCacheMatrix will create a special "matrix" object that can cache its inverse
## cacheSolve will compute the inverse of the "matrix" returned by makeCacheMatrix. If the inverse
## has already been calculated (as in you run cacheSolve a second time), then cacheSolve will
## retrieve the inverse from the cache, and will print the message "getting cached data"

## create a special "matrix" object that can cache its inverse
## example syntax for working with this function:
## x<-matrix(c(3,4,5,4),nrow=2,ncol=2)
## b<-makeCacheMatrix(x)

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## returns inverse of 'x', either by calculating or getting from cache

cacheSolve <- function(x, ...) {
        
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    ## Return a matrix that is the inverse of 'x'
    m <- solve(data, ...)
    x$setinverse(m)
    m
}
