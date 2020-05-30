# Building a covariance matrix in R - Two ways

# create column vectors
a <- c(1,2,3,4,5,6)
b <- c(3,2,5,7,9,12)
c <- c(10,20,30,40,50,60)
d <- c(2,1,3,4,2,9)
e <- c(4,1,4,7,8,9)

# create a matrix from vectors
m <- cbind(a,b,c,d,e)
k <- ncol(m)
n <- nrow(m)
print(m)

# Find the mean for each column. Mean here is the expectation
k_mean <- matrix(data=1, nrow = n) %*% cbind(mean(a), mean(b), mean(c), mean(d), mean(e))
print(k_mean)

# Create a difference matrix
diffm <- m - k_mean
print(diffm)

# create the covariance matrix
covarm <- (n-1)^-1 * t(diffm) %*% diffm # sample covariance
print(covarm)

# find the variance from the covariance matrix
variance <- diag(covarm)
print(variance)

# use r's built in function
print(cov(m))


