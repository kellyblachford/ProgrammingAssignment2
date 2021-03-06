
# Creates a "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {  # input x will be a matrix
  i  <- NULL
  set  <- function(y){
    x <<- y
    i <<- NULL 
  }
  get  <- function() x
  setinverse  <- function(inverse) i  <<- inverse
  getinverse  <- function() i
  list(set= set, get = get, 
       setinverse = setinverse, 
       getinverse = getinverse)
  
}


# Computes the inverse and if the inverse has already been calculated then cacheSolve
# retrieves the inverse from the cache

cacheSolve <- function(x, ...) { # the input x is an object created by makecacheMatrix
  i  <- x$getinverse()
  if (!is.null(i)){
    message("getting cached data")
    return(i)
  }
  data  <- x$get()
  i  <- solve(data, ...)
  x$setinverse(i)
  i
}
