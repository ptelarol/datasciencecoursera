## Put comments here that give an overall description of what your
## functions do

## This function creates an R object that stores a matrix and its inverse
## The makeCacheMatrix function initializes a set of object x and M
## It then defines behaviors for these objects, and then creates a new 
## object by returning a list of functions used previously (set, get, setmean, getmean)

## CacheSolve is used to pass an argument through makeCacheMatrix. 
## It populates and retrieves the inverse from an object ov type makeCacheMatrix

## Write a short comment describing this function

## This function creates and R object and stores a square matrix and its inverse
## It builds a set of function and returns the functions within a list to the parent environment

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Write a short comment describing this function

## This function populates/retrieves the inverse from an object of type makeCacheMatrix
## It is the only place where the solve() function is executed, so makeCacheMatrix
## needs it to be complete

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
}

## Return a matrix that is the inverse of 'x'
a <- makeCacheMatrix(matrix(1:4, 2, 2))
cacheSolve(a)

