library(ggplot2)


set.seed(0)

uni <- runif(1000)
uni.df <- data.frame(uni)
u <- ggplot(uni.df,aes(x=uni))
u + geom_histogram(aes(fill = ..count..))

mns = NULL
for (i in 1 : 1000) mns = c(mns, mean(runif(40)))
df <- data.frame(mns)
m <- ggplot(df, aes(x=mns))
m + geom_histogram(aes(fill = ..count..))

expn = NULL
for (i in 1:1000) expn = c(expn, mean(rexp(40,.2)))
xdf <- data.frame(expn)
x <- ggplot(xdf,aes(x=expn))
x + geom_histogram(aes(fill = ..count..))
