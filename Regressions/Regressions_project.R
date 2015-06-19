library(mtcars)

fit <-lm(mpg~cyl, mtcars)
cf <- coef(fit)
p <- qplot(cyl,mpg, data=mtcars)
p + geom_abline(intercept=cf[1], aes(slope=cf[2]))


