## Put comments here that give an overall description of what your
## functions do

## It creates a special matrix like object, with some new features
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setInverse <- function(value) inv <<- value 
    getInverse <- function() inv
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## The same as the example with mean
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getInverse()
    if(!is.null(inv)) {
        message("getting cached inverse")
        return(inv) ## and the function returns here
    }
    ## If there is no cache, then we came here
    data <- x$get()
    inv <- solve(data)
    x$setInverse(inv)
    inv
}
