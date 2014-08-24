cacheSolve <- function(x, ...) {
    ##This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
    # If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
    m <- x$getmatinv()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setmatinv(m)
    m
}
