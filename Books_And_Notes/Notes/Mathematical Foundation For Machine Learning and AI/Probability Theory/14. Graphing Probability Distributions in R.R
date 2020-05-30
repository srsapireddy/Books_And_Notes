# Graphing Probability Density Functions

# Example - Plotting the normal distributions of the children's iq scores - mean of 100 and standard deviation of 15
# What percentage of children have an iq score greater than score of 115?

# Define parameters of our distribution
mean = 100
standev = 12

# define lower and upper bounds of region of interests
lower = 115
upper = Inf

# generate of sequence of numberes and make normal distribution
x <- seq(-4, 4, length = 100) * standev + mean
prob <- dnorm(x, mean, standev)

# make plot and add probability distributions and axis labels
plot(x, prob, type = 'n', xlab = 'iq values', ylab = 'P(x)', main = 'Normal Distribution on iq scores', axes = FALSE)
# axes = false will get rid of the entire axis
lines(x, prob)
axis(1, at=seq(40, 160, 20), pos = 0)

# generate a polygon of region of interest
i <- x >= lower & x<= upper
polygon(c(lower, x[i], upper), c(0, prob[i],0), col = 'red')

# Calculate area under curve for region of interest and print results
area <- 1 - pnorm(lower, mean, standev)
result <- paste("P(",lower,"< IQ", upper, ") = ", signif(area, digits = 3))
mtext(result,3)