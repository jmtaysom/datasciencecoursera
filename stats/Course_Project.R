set.seed(0)
mns = NULL
for (i in 1 : 1000) mns = c(mns, mean(runif(40)))

df <- data.frame(mns)
m <- ggplot(df, aes(x=mns))
m + geom_histogram(aes(fill = ..count..))
