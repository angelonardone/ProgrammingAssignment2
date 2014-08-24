## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix<-function(x=matrix()){
    ##This function creates a special "matrix" object that can cache its inverse.
    m <- NULL
    # here I set the matix
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    # this function get back the matrix
    get <- function() x
    # this compute the invers of the matrix ~ solve()
    setmatinv <- function(solve) m <<- solve
    # this returnt the computed inverse store based on scopint rules
    getmatinv <- function() m
    # here i return the list of functions
    list(set = set, get = get,
         setmatinv = setmatinv,
         getmatinv = getmatinv)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ##This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
    # If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
    m <- x$getmatinv()
    # if existe I return the cahced inverse matrix
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    # it does not exiest so I get the matrix first
    data <- x$get()
    # then I compute the inverse of the matrix with the ~ solve() command
    m <- solve(data, ...)
    # i set the invers into the cache
    x$setmatinv(m)
    m
}
