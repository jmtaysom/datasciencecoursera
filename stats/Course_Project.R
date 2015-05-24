library(ggplot2)
library(grid)
library(gridExtra)

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
x <- ggplot(xdf,aes(x=expn)) + geom_histogram(aes(fill = ..count..), binwidth=.25) + xlim(2,8) +ylim(0,150)
abline(v=5) 

x2 <- ggplot(xdf,aes(x=expn))
x2 + geom_histogram(aes(fill = ..count..)) + geom_vline(xintercept = mean(expn), color='red') + geom_vline(xintercept = 1/lambda, color='black')+n

mean(expn)
1/.2

sd(expn)
(1/.2)/sqrt(40)



norm <-rnorm(1000,mean=5, sd = 5)
ndf <- data.frame(norm)
n <- ggplot(ndf, aes(x=norm)) + geom_density(color='blue')
n +x2

ndf$distribution <- 'population'
names(ndf)[names(ndf)=="norm"] <- "value"
xdf$distribution <- 'sample'
names(xdf)[names(xdf)=="expn"] <- "value"
combined <- rbind(xdf,ndf)

ggplot(combined, aes(x=value, colour=distribution)) + geom_density()

grid.arrange(x,n, ncol=2, main='Exponential distribution vs. normal distribution')




# Project part 2


