## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = numeric()) {
m <- NULL
z <- matrix(x, nrow=2, ncol=2)
set <- function(y) {
				z <- matrix(y, nrow=2, ncol=2)
                x <<- z
                m <<- NULL
        }
get <- function() z
setinverse <- function(solve) m <<- solve
getinverse <- function() m
list(set = set, get = get,
			 setinverse = setinverse,
			 getinverse = getinverse)
}

## Write a short comment describing this function
## Calculate the inverse of the matrix via solve function or get from cache if already solved

CacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
		m <- solve(data)
        x$setinverse(m)
        m
}
