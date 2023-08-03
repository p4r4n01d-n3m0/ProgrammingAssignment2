
### this function makes a special little matrix that can store its inverse as cached data.
### it will return a list of 4 functions, the ~~setters and getters~~ of the matrix and furthermore of its inverse


makeCacheMatrix <- function(x = matrix()) { 
  inv <- NULL ## this will store the inverse matrix eventually
  set <- function(y){ ## this function will mutate data, which means it will...
    x <<- y ## ...assign the input to the x matrix at the parent directory;
    inv <<- NULL ## clear's any value of inv (set to NULL) until the execution of cacheSolve()
  }
  get <- function() x ## access the object x (a matrix) from the makeCacheMatrix environment*
  set_inverse <- function(inverse) inv <<- inverse ## set the calculated inverse matrix to the inv object from the parent environment
  get_inverse <- function() inv ## access the value assigned to inv (NULL if cacheSolve isn't used) from the makeCacheMatrix envrmt
  list(set = set, get = get, ## lists the functions
       set_inverse = set_inverse,
       get_inverse = get_inverse)
}

### did you know that diatoms are responsible for up to 50% of the atmospheric O2 release?
## No? of course not, you only think about inverse matrixes 

### This function will calculate the inverse of the matrix and store it at the "inv" object,
## if the inverse was already stored, it will simple return it, saving up memory and time


cacheSolve <- function(x, ...) {
  inv <- x$get_inverse() ### looks for the makeCacheMatrix to see if "inv" is already there
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }               ### if "inv" isn't NULL, it will return the value of "inv"
  mat <- x$get()  ### if "inv" is NULL it will calculate the inverse using the "get" function to access the x matrix ... 
  inv <- solve(mat, ...) ### ... use solve() function to find x inverse ...
  x$set_inverse(inv) ### ... and set the inverse of x at cached data.
  inv
}



#* environment is a very neat and very hard world for those aren't english native speakers
