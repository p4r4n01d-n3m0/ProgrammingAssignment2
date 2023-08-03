source("./cachematrix.R")


matrix1 <- matrix(1:4, 2, 2)

res <- makeCacheMatrix(x = matrix1)
res$get() 
res$get_inverse()

cacheSolve(res)
res$get()
res$get_inverse()

matrix2 <- matrix(c(2, 1, -1, 0, 3, 1, 1, -2, 5), nrow = 3, byrow = TRUE)

res <- makeCacheMatrix(x = matrix2)
res$get()
res$get_inverse()

cacheSolve(res)
res$get()
res$get_inverse()
