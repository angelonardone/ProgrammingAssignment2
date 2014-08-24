makeCacheMatrix<-function(x=matrix()){
    ##This function creates a special "matrix" object that can cache its inverse.
    m <- NULL
    mat <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setmatinv <- function(solve) m <<- solve
    getmatinv <- function() m
    list(set = set, get = get,
         setmean = setmean,
         getmean = getmean)
}